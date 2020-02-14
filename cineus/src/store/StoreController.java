package store;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sun.java.swing.plaf.windows.resources.windows;

import member.MemberBean;
import net.sf.json.*;

@WebServlet("/stores/*")
public class StoreController extends HttpServlet {

	StoreService storeService;
	StoreBean storeBean;
	CartBean cartBean;
	MemberBean memberBean;
	PayBean payBean;
	PayDetailBean payDetailBean;
	CouponBean couponBean;
	
	@Override
	public void init() throws ServletException {
		storeService = new StoreService();  
		storeBean = new StoreBean();
		cartBean = new CartBean();
		memberBean = new MemberBean();
		payBean = new PayBean();
		payDetailBean = new PayDetailBean();
		couponBean = new CouponBean();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage = "";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		HttpSession session = request.getSession();
		String action = request.getPathInfo();
		String contextPath = request.getContextPath();
		PrintWriter out = response.getWriter();
		
		//랜덤 생성되는 결제코드~~~~!!!!!
		String pay_code = storeService.createPayCode();//결제코드15자리
		
		System.out.println("action: " + action);
		System.out.println("contextPath: " + contextPath);
		
		try {
			if (action == null) {
				nextPage = "";
			
			} else if (action.equals("/storeList.do")) {//스토어 메인화면
				List<StoreBean> storeList1 = storeService.listStore1();//씨네티켓
				List<StoreBean> storeList2 = storeService.listStore2();//씨네찬스
				List<StoreBean> storeList3 = storeService.listStore3();//씨네푸드
				
				request.setAttribute("storeList1", storeList1);
				request.setAttribute("storeList2", storeList2);
				request.setAttribute("storeList3", storeList3);
				nextPage = "/store/storeList.jsp";
			
			} 
			//20200131 추가 JIN
			else if (action.equals("/getCineChanceAjax.do")) {
				List<StoreBean> storeList2 = storeService.listStore2();//씨네찬스
				try {
					PrintWriter pw = response.getWriter();
					Gson gson =  new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
					pw.print(gson.toJson(storeList2));
				} catch (IOException e) {
					e.printStackTrace();
				}
				return;
			}
			//20200131 추가 JIN 끝 
			else if (action.equals("/viewStore.do")) {//상품 상세보기
				Integer itemCode = Integer.parseInt(request.getParameter("item_code"));
				System.out.println(itemCode);
				
				storeBean = storeService.viewStore(itemCode);				
				request.setAttribute("storeBean", storeBean);				
				nextPage = "/store/storeDetail.jsp";
	
			} else if (action.equals("/insertCart.do")) {//장바구니 담기 & 상품 쿠폰 번호 생성 및 저장
				String customer_id = (String)session.getAttribute("id");
				int item_code = Integer.parseInt(request.getParameter("item_code"));
				int cart_qty = Integer.parseInt(request.getParameter("cart_qty"));
				String item_name = request.getParameter("item_name");
				String item_image = request.getParameter("item_image");
				int sale_price = Integer.parseInt(request.getParameter("sale_price"));
				
				//쿠폰 생성
				String cp_code = storeService.createCoupon();//쿠폰코드16자리
				
				CartBean cartBean  = new CartBean();
				cartBean.setCustomer_id(customer_id);
				cartBean.setItem_code(item_code);
				cartBean.setCart_qty(cart_qty);
				cartBean.setItem_name(item_name);
				cartBean.setItem_image(item_image);
				cartBean.setSale_price(sale_price);
				
				int cartCheck = storeService.listCart(customer_id, item_code);//장바구니 DB에 동일한 제품이 담겼는지 확인
				
				if (cartCheck > 0) {//동일한 제품이 존재한다면
					out.println("<script>" + " alert('이미 담겨있는 상품입니다.');" + " location.href='" + contextPath + "/stores/viewCart.do';" + "</script>");
					out.flush();					
					return;
					
				} else {//동일한 제품이 없다면
					
					int cartCount = storeService.countCart(customer_id);//장바구니 담긴 개수
					
					if (cartCount > 4) {//담긴 개수 5개 초과일 때
						out.println("<script>" + " alert('장바구니는 최대 5개 담을 수 있습니다.');" + " location.href='" + contextPath + "/stores/viewCart.do';" + "</script>");
						out.flush();
						return;
					} else {
						storeService.insertCart(cartBean);//장바구니 DB에 저장 & 쿠폰도 저장
						
						List<CartBean> cartList = storeService.viewCart(customer_id);//장바구니 목록 보기
						
						request.setAttribute("cartList", cartList);
						
						//쿠폰번호 생성 및 저장
						for (int i = 0; i < cart_qty; i++) {//상품개수만큼 저장
							storeService.insertCoupon(cp_code, item_code, customer_id);//pay_code는 FK조건때문에 나중에 따로 하기
						}
						
						//장바구니랑 쿠폰 1분 지나면 삭제되도록 이벤트
						storeService.cartEvent();
						storeService.couponEvent();
						
						response.sendRedirect(contextPath + "/stores/viewCart.do");//nextPage로 이동하면 구매자 정보가 안떠서 이렇게 함
					}				
				}

			} else if (action.equals("/viewCart.do")) {//장바구니 목록 보기
				String customer_id = (String)session.getAttribute("id");
				
				if (customer_id == null) {//로그아웃 상태인 경우
					out.println("<script>" + " alert('로그인 후 이용가능한 서비스입니다.');" + " location.href='" + contextPath + "/members/login.me';" + "</script>");
					out.flush();
					return;
					
				} else {//로그인 상태인 경우
					List<CartBean> cartList = storeService.viewCart(customer_id);//장바구니 목록 보기
					
					memberBean = storeService.viewMemberInfo(customer_id);//구매자 정보 확인
					
					request.setAttribute("cartList", cartList);
					request.setAttribute("memberBean", memberBean);
					
					nextPage = "/store/storeCart.jsp";
				}
				
			} else if (action.equals("/deleteCart.do")) {//장바구니 상품 삭제
				String customer_id = (String)session.getAttribute("id");
				int item_code = Integer.parseInt(request.getParameter("item_code"));
				
				int check = storeService.deleteCart(customer_id, item_code);
				
				if (check > 0) {
					//생성됐던 쿠폰번호 삭제
					storeService.deleteCoupon(item_code, customer_id);
					
					out.println("<script>" + " alert('장바구니에서 상품이 삭제되었습니다.');" + " location.href='" + contextPath + "/stores/viewCart.do';" + "</script>");
					out.flush();
					return;
				} else {
					out.println("<script>" + " alert('장바구니 삭제 실패! 다시 시도해주세요!');" + " location.href='" + contextPath + "/stores/viewCart.do';" + "</script>");
					out.flush();
					return;
				}
				
			} else if (action.equals("/modifyCart.do")) {//장바구니 상품 수량 수정
				String customer_id = (String)session.getAttribute("id");
				int item_code = Integer.parseInt(request.getParameter("item_code"));
				int cart_qty = Integer.parseInt(request.getParameter("cart_qty"));
				
				//쿠폰 생성
				String cp_code = storeService.createCoupon();//쿠폰코드16자리
				
				int check = storeService.modifyCart(customer_id, item_code, cart_qty);
				
				if (check > 0) {
					//생성됐던 쿠폰 삭제 후 수정된 수량만큼 재생성
					storeService.deleteCoupon(item_code, customer_id);
					//쿠폰번호 생성 및 저장
					for (int i = 0; i < cart_qty; i++) {//상품개수만큼 저장
						storeService.insertCoupon(cp_code, item_code, customer_id);//pay_code는 FK조건때문에 나중에 따로 하기
					}
					
					out.println("<script>" + " alert('수량이 변경되었습니다.');" + " location.href='" + contextPath + "/stores/viewCart.do';" + "</script>");
					out.flush();
					return;
				} else {
					out.println("<script>" + " alert('수량변경 실패! 다시 시도해주세요!');" + " location.href='" + contextPath + "/stores/viewCart.do';" + "</script>");
					out.flush();
					return;
				}
				
			} else if (action.equals("/payment.do")) {//결제하기
				String customer_id = (String)session.getAttribute("id");
				int pay_price = Integer.parseInt(request.getParameter("pay_price"));//총결제금액
				String pay_type = request.getParameter("pay_type");
				int card_birth = Integer.parseInt(request.getParameter("card_birth"));
				int card_month = Integer.parseInt(request.getParameter("card_month"));
				int card_year = Integer.parseInt(request.getParameter("card_year"));
				String card_num = request.getParameter("card_num");
				int card_pw = Integer.parseInt(request.getParameter("card_pw"));
				int pay_ins = Integer.parseInt(request.getParameter("pay_ins"));
				Timestamp pay_date = new Timestamp(System.currentTimeMillis());//결제일
				Timestamp cancel_date = new Timestamp(System.currentTimeMillis());//취소일
				
				//랜덤 생성되는 값
			//	String pay_code = storeService.createPayCode();//결제코드15자리 (멤버변수로 빼놓음!!!)
			

				PayBean payBean = new PayBean();
				payBean.setPay_code(pay_code);
				payBean.setCustomer_id(customer_id);
				payBean.setPay_type(pay_type);
				payBean.setPay_price(pay_price);
				payBean.setPay_date(pay_date);
			//	payBean.setCancel_date(cancel_date);//취소일은 취소할 때 입력
			//	payBean.setPay_status(pay_status);//디폴트 0:결제/1:취소신청/2:취소완료
				
				PayDetailBean payDetailBean = new PayDetailBean();
			//	payDetailBean.setPayde_code(payde_code);//Auto increment
			//	payDetailBean.setPay_code(pay_code);//pay테이블에서 갖고오기
			//	payDetailBean.setItem_code(item_code);//cart테이블에서 갖고오기
			//	payDetailBean.setCart_qty(cart_qty);//cart테이블에서 갖고오기
				payDetailBean.setCard_num(card_num);
				payDetailBean.setCard_month(card_month);
				payDetailBean.setCard_year(card_year);
				payDetailBean.setCard_pw(card_pw);
				payDetailBean.setCard_birth(card_birth);
				payDetailBean.setPay_ins(pay_ins);
				
				
				storeService.insertPayCode(payBean, payDetailBean);//결제테이블 정보 저장
				storeService.cartToPaydetail(payBean);//장바구니 정보 결제상세 저장 및 쿠폰에 결제코드 저장

				out.println("<script>" + " alert('결제가 완료되었습니다.');" + " location.href='" + contextPath + "/stores/fa_4.me';" + "</script>");
				out.flush();
				return;
				
			} else if (action.equals("/fa_4.me")) {//마이페이지 구매내역 페이지
				String customer_id = (String)session.getAttribute("id");//id로 조회하기
				
				List<PayBean> payList = storeService.listPay(customer_id);
				List<CouponBean> couponList = storeService.listCoupon(customer_id);
				
				
				request.setAttribute("payList", payList);
				request.setAttribute("couponList", couponList);
				
				nextPage = "/store/storeInfo.jsp";
				
			} else if (action.equals("/fa_4_detail.me")) {//구매목록에서 쿠폰 보기(ajax)(일단 사용안함)
//				String customer_id = (String)session.getAttribute("id");
//				String payCode = request.getParameter("pay_code");//멤버변수랑 이름 중복이라서 바꿈
//
//				List<CouponBean> couponList = storeService.listCoupon(payCode, customer_id);
//				
//				//List를 JSON으로 변환
//				HashMap<String, Object> map = new HashMap<String, Object>();
//				map.put("couponList", couponList);
//				JSONObject jsonObject = new JSONObject();
//				jsonObject.putAll(map);
//				
//				out.print(jsonObject);
//				
//				return;
			} else if (action.equals("/deletePayStore.do")) {//구매내역 삭제
				String payCode = request.getParameter("pay_code");
				System.out.println(payCode);
				
				//결제 상태 변경(삭제) 및 해당 쿠폰 삭제
				int delChk = storeService.deletePayStore(payCode);
				
				if (delChk > 0) {//삭제가 완료되면
					out.println("<script>" + " alert('결제내역이 삭제되었습니다.');" + " location.href='" + contextPath + "/stores/fa_4.me';" + "</script>");
					out.flush();
					return;
				} else {
					out.println("<script>" + " alert('결제내역 삭제가 실패했습니다.');" + " location.href='" + contextPath + "/stores/fa_4.me';" + "</script>");
					out.flush();
					return;
				}
			}
			
			//각각 포워딩시키기
			RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
			dispatcher.forward(request, response);
			
			
		} catch (Exception e) {
			System.out.println("doHandle()메서드에서 오류 : " + e);
		}
		
		
		
		
		
		
	}//doHandle()
	
}//StoreController
