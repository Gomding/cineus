package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/members/*")
public class MemberController extends HttpServlet {
	
	MemberService memberService;
	MemberBean memberBean;
	
	@Override
	public void init() throws ServletException {
		memberService = new MemberService();
		memberBean = new MemberBean();
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
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getPathInfo();
		String contextPath = request.getContextPath();
		PrintWriter out = response.getWriter();	
		HttpSession session = request.getSession();
		System.out.println("action : " + action);
		System.out.println("contextPath : " + request.getContextPath());
		
		try {
			if(action == null){
				nextPage = "";
			}else if(action.equals("/login.me")){	//로그인 페이지로 이동
				
				nextPage = "/member/login.jsp";
				
			}else if(action.equals("/SignUp.me")){	//회원가입 페이지로 이동
				
				nextPage = "/member/SignUp.jsp";
				
			}else if(action.equals("/MemberSignUp.me")){	//회원가입
				
				//입력한 새 회원 정보 얻기
				String customer_id = request.getParameter("userid");
				String customer_pw = request.getParameter("userpwd");
				String customer_name = request.getParameter("username");
				String customer_email = request.getParameter("useremail");
				String customer_tel = request.getParameter("usertel");
				String customer_postcode = request.getParameter("postcode");
				String customer_address = request.getParameter("address");
				String customer_detailAddress = request.getParameter("detailAddress");
				String customer_extraAddress = request.getParameter("extraAddress");
				String customer_grade = request.getParameter("grade");
				String customer_delete = request.getParameter("delete");
				
				//입력한 새로운 회원정보를 MemberBean에 저장
				memberBean.setCustomer_id(customer_id);
				memberBean.setCustomer_pw(customer_pw);
				memberBean.setCustomer_name(customer_name);
				memberBean.setCustomer_email(customer_email);
				memberBean.setCustomer_tel(customer_tel);
				memberBean.setCustomer_postcode(customer_postcode);
				memberBean.setCustomer_address(customer_address);
				memberBean.setCustomer_detailAddress(customer_detailAddress);
				memberBean.setCustomer_extraAddress(customer_extraAddress);
				memberBean.setCustomer_grade(customer_grade);
				memberBean.setCustomer_delete(customer_delete);
				
				int check = memberService.servinsertMember(memberBean);
				
				if(check == 0){System.out.println("가입 X");}else{System.out.println("가입 O");}				
				
				out.println("<script>" + " alert('회원가입을 축하드립니다.');" + " location.href='" + contextPath + "/members/login.me';" + "</script>");
				out.flush();
			

			}else if(action.equals("/memberCheck.me")){	//아이디 중복체크

				String customer_id = (String)request.getParameter("uid");				
				if(customer_id.length() >= 3){
						
													
						int check = memberService.servidCheck(customer_id);
						System.out.println(check);
						
						if(check == 1){ //중복
							out.print("not_usable");
						}else if(check == 0){//중복아님 사용가능
							out.print("usable");									
						}
					}
						return;
						
						
			}else if(action.equals("/Memberlogin.me")){ //로그인
				
				String id = request.getParameter("id");
				String pwd = request.getParameter("pwd");				
				int check = memberService.servuserCheck(id, pwd);
				System.out.println(check);
				
				try {
					if(check == 1){//입력한 아이디, 비밀번호 일치
					
							session.setAttribute("id", id);
							response.sendRedirect(contextPath + "/main.jsp");
						
					}else{
						out.println("<script>" + " alert('가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.');" + " location.href='" + contextPath + "/members/login.me';" + "</script>");
						out.flush();
					}				
					
				} catch (Exception e) {
					System.out.println("Memberlogin.me에서 에러 : " + e);
				}
				
				
			}else if(action.equals("/Kakaologin.me")){ //카카오톡 로그인
				
				String userID = request.getParameter("userID");
				String userNickName = request.getParameter("userNickName");
				String userEmail = request.getParameter("userEmail");
				
				System.out.println("카카오 닉네임 : " + userNickName);
				System.out.println("카카오 아이디 : " + userID);
				System.out.println("카카오 이메일 : " + userEmail);
				
				try {
					int check = memberService.servidCheck(userID);
					
					if(check == 1){ //DB에 카카오톡 계정이 들어가 있으면
						
						session.setAttribute("id", userNickName);
						
					}else if(check == 0){ //DB에 카카오톡 계정이 없으면 DB에 카톡정보를 넣고 로그인 시킴
						
						memberBean.setCustomer_id(userNickName);
						memberBean.setCustomer_pw(null);
						memberBean.setCustomer_name(userID);
						memberBean.setCustomer_tel(null);
						memberBean.setCustomer_email(userEmail);
						memberBean.setCustomer_postcode(null);
						memberBean.setCustomer_address(null);
						memberBean.setCustomer_detailAddress(null);
						memberBean.setCustomer_extraAddress(null);						
						memberBean.setCustomer_grade("일반");
						memberBean.setCustomer_delete("0");
						
						
						int signup = memberService.servinsertMember(memberBean);
						
						session.setAttribute("id", userNickName);
						
					}
					
				} catch (Exception e) {
					System.out.println("Kakaologin.me에러 : " + e);
				}				
				
				return;
				
			}else if(action.equals("/Naverlogin.me")){ //네이버 로그인
				
				String Nid = request.getParameter("Nid");
				String Nemail = request.getParameter("Nemail");
				String Nnickname = request.getParameter("Nnickname");
				
				System.out.println("네이버 닉네임 : " + Nnickname);
				System.out.println("네이버 아이디 : " + Nid);
				System.out.println("네이버 이메일 : " + Nemail);
				
				try {
					int check = memberService.servidCheck(Nemail);
					
					if(check == 1){ //DB에 네이버 계정이 들어가 있으면
						
						session.setAttribute("id", Nnickname);
						
					}else if(check == 0){ //DB에 네이버 계정이 없으면 DB에 카톡정보를 넣고 로그인 시킴
						
						memberBean.setCustomer_id(Nnickname);
						memberBean.setCustomer_pw(null);
						memberBean.setCustomer_name(Nid);
						memberBean.setCustomer_tel(null);
						memberBean.setCustomer_email(Nemail);
						memberBean.setCustomer_postcode(null);
						memberBean.setCustomer_address(null);
						memberBean.setCustomer_detailAddress(null);
						memberBean.setCustomer_extraAddress(null);						
						memberBean.setCustomer_grade("일반");
						memberBean.setCustomer_delete("0");
						
						
						int signup = memberService.servinsertMember(memberBean);
						
						session.setAttribute("id", Nnickname);
						
					}
					
				} catch (Exception e) {
					System.out.println("Naverlogin.me에러 : " + e);
				}				
				
				return;
				
			}else if(action.equals("/logout.me")){ //로그아웃
				
				try {
					session.invalidate();
					response.sendRedirect(contextPath + "/main.jsp");
					
				} catch (Exception e) {
					System.out.println("logout.me에서 에러 : " + e);
				}
				
			}else if(action.equals("/userFind.me")){ //ID/PW 찾기 페이지로 이동
				
				nextPage = "/member/userFind.jsp";
				
			}else if(action.equals("/authMail.me")){
				
				nextPage = "/member/authMail.jsp";
				
				
			}else if(action.equals("/idFind.me")){ //아이디 찾기 버튼 클릭				
				
				String findName = request.getParameter("findName");
			    String findTel = request.getParameter("findTel");
			    String findEmail = request.getParameter("findEmail");

			    String findId = memberService.servfindId(findName, findTel, findEmail);
			    System.out.println(findId);
			    out.print(findId);
			    return;
				
				
			}else if(action.equals("/pwFind.me")){ //비밀번호 찾기 버튼 클릭
				
				
				String findpwName = request.getParameter("findpwName");
			    String findpwId = request.getParameter("findpwId");
			    String findpwEmail = request.getParameter("findpwEmail");
			    
			    String findPw = memberService.servfindPw(findpwName, findpwId, findpwEmail);
			    
			    if(findPw != null){
			    	memberService.servsendpwEmail(findpwEmail, findPw);
			    }		    
			    
			    System.out.println(findPw);
			    out.print(findPw);
			    return;
			    
				
			}else if(action.equals("/membertelCheck.me")){	//연락처 중복체크

				String customer_tel = (String)request.getParameter("utel");				
						
				if(customer_tel.length() == 11){									
						int check = memberService.servtelCheck(customer_tel);
						System.out.println(check);
						
						if(check == 1){ //중복
							out.print("not_usable");
						}else if(check == 0){//중복아님 사용가능
							out.print("usable");									
						}
				}
						return;
			
			}else if(action.equals("/EditMember.me")){ // 회원정보 수정 페이지로 이동
				
				String id = (String)session.getAttribute("id");
				memberBean = memberService.getMemberInfo(id);
				request.setAttribute("mbean", memberBean);
				
				nextPage = "/member/Edit.jsp";
				
			}else if(action.equals("/MemberEdit.me")){	//회원정보수정
				
				//회원 정보 얻기
				String customer_id = request.getParameter("userid");
				String customer_pw = request.getParameter("userpwd");
				String customer_name = request.getParameter("username");
				String customer_email = request.getParameter("useremail");
				String customer_tel = request.getParameter("usertel");
				String customer_postcode = request.getParameter("postcode");
				String customer_address = request.getParameter("address");
				String customer_detailAddress = request.getParameter("detailAddress");
				String customer_extraAddress = request.getParameter("extraAddress");
				
				//새로운 회원정보를 MemberBean에 저장
				memberBean.setCustomer_id(customer_id);
				memberBean.setCustomer_pw(customer_pw);
				memberBean.setCustomer_name(customer_name);
				memberBean.setCustomer_email(customer_email);
				memberBean.setCustomer_tel(customer_tel);
				memberBean.setCustomer_postcode(customer_postcode);
				memberBean.setCustomer_address(customer_address);
				memberBean.setCustomer_detailAddress(customer_detailAddress);
				memberBean.setCustomer_extraAddress(customer_extraAddress);
				
				int check = memberService.servupdateMember(memberBean);				
				
				out.println("<script>" + " alert('회원정보가 수정되었습니다.');" + " location.href='" + contextPath + "/members/fa_1.me';" + "</script>");
				out.flush();
			

			}else if(action.equals("/deleteMember.me")){	//회원탈퇴 페이지로 이동
				
				nextPage = "/member/deleteMember.jsp";			

			}else if(action.equals("/memberDelete.me")){	//회원탈퇴 버튼을 클릭
				
				String customer_ID = request.getParameter("Did");
				String customer_pw = request.getParameter("deletePassword");
				String customer_delete = request.getParameter("Cdelete");
				
				String Delete = memberService.servdeleteMember(customer_ID, customer_pw);
				
				if(Delete != null){ //로그인한 아이디와 입력한 비밀번호가 일치
					
					memberBean.setCustomer_id(customer_ID);
					memberService.servdelUpdateMember(memberBean);
					session.invalidate();
					
				}
				
				System.out.println("customer_ID : " + customer_ID);
				System.out.println("customer_pw : " + customer_pw);
				System.out.println("Delete : " + Delete);
				out.print(Delete);
				return;
				

			}else if(action.equals("/fa_1.me")) { //마이페이지로 이동
				
				String id = (String)session.getAttribute("id");
				memberBean = memberService.getMemberInfo(id);
				request.setAttribute("mbean", memberBean);				
				
				nextPage = "/intro/fa_1.jsp";
			
			}else if(action.equals("/fa_2_1.me")) {
				
				nextPage = "/intro/fa_2_1.jsp";
			
			}else if(action.equals("/fa_2_2.me")) {
				
				nextPage = "/intro/fa_2_2.jsp";
			
			}else if(action.equals("/fa_3.me")) {
				
				nextPage = "/intro/fa_3.jsp";
			
			}else if(action.equals("/fa_4.me")) {
				
				nextPage = "/intro/fa_4.jsp";
			
			}else if(action.equals("/fa_5.me")) {
				
				nextPage = "/customer/getMovieLikeList.do";
			
			}else if(action.equals("/fa_6.me")) {
				
				nextPage = "/intro/fa_6.jsp";
			
			}
			
			
			
			
			
			
			
			
			
			
			if(action != null){				
				RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
				dispatch.forward(request, response);
			}					
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
