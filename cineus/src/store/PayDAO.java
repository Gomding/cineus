package store;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PayDAO {//pay, paydetail, coupon 테이블 작업 여기서 전부 함!

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	//커넥션풀로부터 커넥션을 얻기 위한 메서드
	private Connection getConnection() throws Exception{
		
		Context init = new InitialContext();
		
		//커넥션풀 얻기
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/CineUs");
		
		//커넥션풀로부터 커넥션 객체 얻기
		con = ds.getConnection();
		
		return con;
		
	}//getConnection()
	
	//자원 해제 하기 위한 메서드
	private void freeResource() {
		try {
			if(con != null) con.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		} catch (Exception e) {
			System.out.println("freeResource()메서드에서 오류" + e);
		}
	}//freeResource()


//-----------------------------------------------------------------------------------------

	//결제 코드 생성
	public String createPayCode() {
		
		String code = null;
		
		String myDate   = new java.text.SimpleDateFormat("yyMMddHHmmSSS").format(new java.util.Date());//날짜시간13자리
        
        StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 2; i++) {//랜덤숫자2자리
			int num = (int) (Math.random() * 10);
			sb.append(num);
		}
		String ranNum = sb.toString();
        
        code = myDate+ranNum;//15자리 결제코드
        
		return code;
	}//createPayCode()

	//쿠폰 번호 생성
	public String createCoupon() {
		String coupon = null;
		
		String myDate = new java.text.SimpleDateFormat("ddMMyyHHmmss").format(new java.util.Date());//시간날짜12자리
		
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 4; i++) {//랜덤숫자4자리 
			int num = (int) (Math.random() * 10);
			sb.append(num);
		}
		String ranNum = sb.toString();
		
		coupon = myDate+ranNum;//16자리 쿠폰번호
		
		return coupon;
	}//createCoupon()

	//결제 정보 저장
	public void insertPayCode(PayBean payBean, PayDetailBean payDetailBean) {
		try {
			con = getConnection();
			//pay테이블 저장
			sql = "INSERT INTO pay (pay_code, customer_id, pay_type, pay_price, pay_date) VALUES (?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, payBean.getPay_code());
			pstmt.setString(2, payBean.getCustomer_id());
			pstmt.setString(3, payBean.getPay_type());
			pstmt.setInt(4, payBean.getPay_price());
			pstmt.setTimestamp(5, payBean.getPay_date());
			
			int check = pstmt.executeUpdate();
			
			if (check > 0) {
				//card테이블 저장
				sql = "insert into card (pay_code, card_num, card_month, card_year, card_pw, card_birth, pay_ins) values (?, ?, ?, ?, ?, ?, ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, payBean.getPay_code());
				pstmt.setString(2, payDetailBean.getCard_num());
				pstmt.setInt(3, payDetailBean.getCard_month());
				pstmt.setInt(4, payDetailBean.getCard_year());
				pstmt.setInt(5, payDetailBean.getCard_pw());
				pstmt.setInt(6, payDetailBean.getCard_birth());
				pstmt.setInt(7, payDetailBean.getPay_ins());
				pstmt.executeUpdate();
			} else {
				System.out.println("insertPayCode가 실패했습니다" + check);
			}
			
		} catch (Exception e) {
			System.out.println("insertPayCode()메서드에서 오류" + e);
		} finally {
			freeResource();
		}
	}//insertPayCode()
		
	//장바구니 정보를 결제상세페이지에 저장
	public void cartToPaydetail(PayBean payBean) {
		
		try {
			con = getConnection();
			sql = "INSERT INTO paydetail (item_code, cart_qty) SELECT item_code, cart_qty FROM cart WHERE customer_id = ? AND cart_status = 0";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, payBean.getCustomer_id());
			
			int check = pstmt.executeUpdate();
			
			if (check > 0) {//paydetail테이블에 다중insert가 성공한 경우
				sql = "UPDATE cart SET cart_status = 1 WHERE customer_id = ?";//장바구니 상태 1로 변경
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, payBean.getCustomer_id());
				int check2 = pstmt.executeUpdate();
				
				if (check2 > 0) {//결제상세에 결제코드 추가 저장
					sql = "UPDATE paydetail SET pay_code = ? WHERE pay_code IS NULL";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, payBean.getPay_code());
					int check3 = pstmt.executeUpdate();
					
					if (check3 > 0) {//쿠폰에 결제코드 추가 및 쿠폰상태 변경
						sql = "UPDATE coupon SET pay_code = ?, cp_status= 0 WHERE customer_id = ? AND DATE(cp_date) = DATE(NOW()) AND cp_status = 2 AND pay_code IS NULL";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, payBean.getPay_code());
						pstmt.setString(2, payBean.getCustomer_id());
						pstmt.executeUpdate();
					}
				}
			} else {
				System.out.println("cartToPaydetail가 실패했습니다" + check);
			}
			
		} catch (Exception e) {
			System.out.println("cartToPaydetail()메서드에서 오류" + e);
		} finally {
			freeResource();
		}
		
	}//cartToPaydetail()

	//쿠폰 생성 및 저장
	public void insertCoupon(String cp_code, int item_code, String customer_id) {
		
		try {
			
			con = getConnection();
			sql = "select cp_code from coupon where cp_code = ?";//쿠폰번호 중복확인
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cp_code);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {//동일한 쿠폰번호가 존재한다면
			//	cp_code = Integer.toString(Integer.parseInt(cp_code) + 1);//쿠폰번호값 + 1
				cp_code = createCoupon();//새쿠폰번호 생성
				
				System.out.println("쿠폰번호는?" + cp_code);			
				sql = "insert into coupon (cp_code, item_code, customer_id, cp_status) values (?, ?, ?, 2)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, cp_code);
				pstmt.setInt(2, item_code);
				pstmt.setString(3, customer_id);
				pstmt.executeUpdate();
				
			} else {//동일한 쿠폰번호가 존재하지않으면
				cp_code = cp_code;
				
				System.out.println("쿠폰번호는?" + cp_code);			
				sql = "insert into coupon (cp_code, item_code, customer_id, cp_status) values (?, ?, ?, 2)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, cp_code);
				pstmt.setInt(2, item_code);
				pstmt.setString(3, customer_id);
				pstmt.executeUpdate();
			}		
			
		} catch (Exception e) {
			System.out.println("insertCoupon()메서드에서 오류" + e);
		} finally {
			freeResource();
		}

	}//insertCoupon()

	//장바구니에서 삭제된 상품에 대한 쿠폰 삭제
	public void deleteCoupon(int item_code, String customer_id) {
		try {
			con = getConnection();
			sql = "DELETE FROM coupon WHERE item_code = ? AND DATE(cp_date) = DATE(NOW()) AND cp_status = 2 AND customer_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, item_code);
			pstmt.setString(2, customer_id);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("deleteCoupon()메서드에서 오류" + e);
		} finally {
			freeResource();
		}
	}//deleteCoupon()

	//마이페이지 결제목록 불러오기
	public List<PayBean> listPay(String customer_id) {
		List<PayBean> payList = new ArrayList<PayBean>();
		
		try {
			con = getConnection();
			//sql = "SELECT pay_date, pay_code, pay_type, pay_price FROM pay WHERE customer_id = ?";
			sql = "SELECT pay_date, pay.pay_code, pay_type, pay_price, coupon1.usableCoupon, coupon2.totalCoupon FROM pay JOIN (SELECT count(*) as 'usableCoupon', pay_code FROM coupon WHERE customer_id = ? AND cp_status = 0 GROUP BY pay_code) coupon1 ON pay.pay_code = coupon1.pay_code JOIN (SELECT count(*) as 'totalCoupon', pay_code FROM coupon WHERE customer_id = ? GROUP BY pay_code) coupon2 ON pay.pay_code = coupon2.pay_code WHERE customer_id = ? AND pay_status = 0";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, customer_id);
			pstmt.setString(2, customer_id);
			pstmt.setString(3, customer_id);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {//구매이력이 있는 경우
				Timestamp pay_date = rs.getTimestamp("pay_date");
				String pay_code = rs.getString("pay_code");
				String pay_type = rs.getString("pay_type");
				int pay_price = rs.getInt("pay_price");				
				int totalCoupon = rs.getInt("totalCoupon");
				int usableCoupon = rs.getInt("usableCoupon");
				
				PayBean payBean = new PayBean();
				
				payBean.setPay_date(pay_date);
				payBean.setPay_code(pay_code);
				payBean.setPay_type(pay_type);
				payBean.setPay_price(pay_price);				
				payBean.setTotalCoupon(totalCoupon);
				payBean.setUsableCoupon(usableCoupon);	
				
				//실패한 방법
				/*String sql_1 = "SELECT count(*) as 'totalCoupon' FROM coupon WHERE customer_id = ? AND pay_code = ?";
				pstmt = con.prepareStatement(sql_1);
				pstmt.setString(1, customer_id);
				pstmt.setString(2, pay_code);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					int totalCoupon = rs.getInt("totalCoupon");
					
					payBean.setTotalCoupon(totalCoupon);
				}
				
				String sql_2 = "SELECT count(*) as 'usableCoupon' FROM coupon WHERE customer_id = ? AND pay_code = ? AND cp_status = 0";
				pstmt = con.prepareStatement(sql_2);
				pstmt.setString(1, customer_id);
				pstmt.setString(2, pay_code);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					int usableCoupon = rs.getInt("usableCoupon");
					
					payBean.setUsableCoupon(usableCoupon);				
				}*/
								
				payList.add(payBean);
			}
			
		} catch (Exception e) {
			System.out.println("listPay()메서드에서 오류" + e);
		} finally {
			freeResource();
		}
		
		return payList;
	}//listPay()

	//마이페이지 해당하는 쿠폰목록 불러오기(ajax용 현재 사용 불가)
	public List<CouponBean> listCoupon(String pay_code, String customer_id) {
		List<CouponBean> couponList = new ArrayList<CouponBean>();

		try {
			con = getConnection();
			sql = "SELECT i.item_name, c.cp_code, c.cp_status FROM item i JOIN coupon c ON i.item_code = c.item_code WHERE c.customer_id = ? AND c.pay_code = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, customer_id);
			pstmt.setString(2, pay_code);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String item_name = rs.getString("item_name");
				String cp_code = rs.getString("cp_code");
				int cp_status = rs.getInt("cp_status");
				
				CouponBean couponBean = new CouponBean();
				couponBean.setItem_name(item_name);
				couponBean.setCp_code(cp_code);
				couponBean.setCp_status(cp_status);
				
				couponList.add(couponBean);
			}
			
		} catch (Exception e) {
			System.out.println("listCoupon()메서드에서 오류" + e);
		} finally {
			freeResource();
		}
		
		return couponList;
	}//listCoupon()

	//마이페이지 해당하는 쿠폰목록 불러오기
	public List<CouponBean> listCoupon(String customer_id) {
		List<CouponBean> couponList = new ArrayList<CouponBean>();
		
		try {
			con = getConnection();
			sql = "SELECT i.item_name, c.cp_code, c.cp_status, c.cp_date FROM item i JOIN coupon c ON i.item_code = c.item_code WHERE c.customer_id = ? AND cp_status IN(0, 1)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, customer_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String item_name = rs.getString("item_name");
				String cp_code = rs.getString("cp_code");
				int cp_status = rs.getInt("cp_status");
				Timestamp cp_date = rs.getTimestamp("cp_date");
				
				CouponBean couponBean = new CouponBean();
				couponBean.setItem_name(item_name);
				couponBean.setCp_code(cp_code);
				couponBean.setCp_status(cp_status);
				couponBean.setCp_date(cp_date);
				
				couponList.add(couponBean);
			}
			
		} catch (Exception e) {
			System.out.println("listCoupon()메서드에서 오류" + e);
		} finally {
			freeResource();
		}
		
		return couponList;
	}//listCoupon()

	//결제상태 변경(삭제)
	public int deletePayStore(String payCode) {
		int delChk = 0;//삭제 확인용 변수
		
		try {
			con = getConnection();
			sql = "UPDATE pay SET pay_status = 2 WHERE pay_code = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, payCode);
			int check = pstmt.executeUpdate();
			if (check > 0) {//상태변경이 완료된 경우
				sql = "DELETE FROM coupon WHERE pay_code = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, payCode);
				delChk = pstmt.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println("deletePayStore()메서드에서 오류" + e);
		} finally {
			freeResource();
		}
		
		return delChk;
	}//deletePayStore()

	

	
	
	
}//PayDAO
