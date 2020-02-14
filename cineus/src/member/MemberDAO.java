package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.InternetAddress;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

	//커넥션풀로 부터 커넥션을 얻기 위한 메소드
	private Connection getConnection() throws Exception{
			 
		Connection con = null;
		Context init = new InitialContext();
		//커넥션풀 얻기
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/CineUs");
		//커넥션풀로 부터 커넥션 객체 얻기
		con = ds.getConnection();
			
		return con;			
	}//getConnection()메소드 끝
	
	
	
	//회원 중복 확인
	public int idCheck(String customer_id){
			
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int check = 2;
			
		try{
			//커넥션풀로부터 커섹션 빌려오기(DB접속)
			con = getConnection();
			//SELECT SQL문 만들기 : 입력한 아이디에 해당하는 회원 검색
			sql = "select * from customer where customer_id = ?";
			//PreparedStatement 객체 얻기
			pstmt = con.prepareStatement(sql);
			//?에 대응되는 값 설정
			pstmt.setString(1, customer_id);
			//검색
			rs = pstmt.executeQuery();
				
			if(rs.next()){//검색한 데이터가 있으면 아이디 중복
				check = 1;
			}else{//검색한 데이터가 존재하지 않으면 아이디 중복 아님
				check = 0;
			}
		}catch(Exception e){
			System.out.println("DAO idCheck에서 에러" + e);
		}finally{
			//자원해제
			if(pstmt != null){try{pstmt.close();} catch (SQLException e){e.printStackTrace();}}
			if(con != null){try{con.close();} catch (SQLException e){e.printStackTrace();}}
			if(rs != null){try{rs.close();} catch (SQLException e){e.printStackTrace();}}
		}
		return check; //중복 또는 중복 아닌 판별값 리턴
	}//idCheck end
	
	
	
	
	//연락처 중복 확인
	public int telCheck(String customer_tel){
			
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int check = 2;
			
		try{
			con = getConnection();
			sql = "select * from customer where customer_tel = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, customer_tel);
			rs = pstmt.executeQuery();				
			if(rs.next()){//검색한 데이터가 있으면 연락처 중복
				check = 1;
			}else{//검색한 데이터가 존재하지 않으면 연락처 중복 아님
				check = 0;
			}
		}catch(Exception e){
			System.out.println("DAO telCheck에서 에러" + e);
		}finally{
			//자원해제
			if(pstmt != null){try{pstmt.close();} catch (SQLException e){e.printStackTrace();}}
			if(con != null){try{con.close();} catch (SQLException e){e.printStackTrace();}}
			if(rs != null){try{rs.close();} catch (SQLException e){e.printStackTrace();}}
		}
		return check; //중복 또는 중복 아닌 판별값 리턴
	}//telCheck end
	
	
	//회원가입 insert
	public int insertMember(MemberBean memberBean){
		int check = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql= "";
		
		try{
			//커넥션풀로 커넥션 얻기(DB접속객체 Connection얻기)
			con = getConnection();
			//sql insert
			sql= "insert into customer(customer_id,customer_pw,customer_name,customer_email,customer_tel,customer_postcode,customer_address,customer_detailAddress,customer_extraAddress,customer_grade,customer_delete)"+
				  "values(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			//?값 설정
			pstmt.setString(1, memberBean.getCustomer_id());
			pstmt.setString(2, memberBean.getCustomer_pw());
			pstmt.setString(3, memberBean.getCustomer_name());
			pstmt.setString(4, memberBean.getCustomer_email());	
			pstmt.setString(5, memberBean.getCustomer_tel());
			pstmt.setString(6, memberBean.getCustomer_postcode());
			pstmt.setString(7, memberBean.getCustomer_address());
			pstmt.setString(8, memberBean.getCustomer_detailAddress());
			pstmt.setString(9, memberBean.getCustomer_extraAddress());
			pstmt.setString(10, memberBean.getCustomer_grade());
			pstmt.setString(11, memberBean.getCustomer_delete());
			
			check = pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("DAO insertMember에서 에러" + e);
		}finally{
			//자원해제
			if(pstmt != null){try{pstmt.close();} catch (SQLException e){e.printStackTrace();}}
			if(con != null){try{con.close();} catch (SQLException e){e.printStackTrace();}}
		}
		return check;
	}//insertMember end
	
	
	//로그인
	public int userCheck(String customer_id, String customer_pw){
		
		int check = -1; //1 -> 아이디, 비밀번호 DB에 존재함
						//0 -> 아이디 맞음, 비밀번호 틀림
						//-1 -> 아이디 틀림
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try{
			//커넥션풀로부터 커섹션 빌려오기(DB접속)
			con = getConnection();
			//탈퇴하지 않은 id에 해당하는 레코드 검색
			sql = "select * from customer where customer_id=? and customer_delete=0";
			//PreparedStatement객체 얻기
			pstmt = con.prepareStatement(sql);
			//?설정
			pstmt.setString(1, customer_id);
			//SELECT 구문 실행 후 결과 얻기
			rs = pstmt.executeQuery();
			
			if(rs.next()){ //아이디가 존재함
				//login.jsp에서 입력한 비밀번호와 DB에 저장되어 있는 비밀번호가 동일하면?
				if(customer_pw.equals(rs.getString("customer_pw"))){
					check = 1; //아이디 맞음, 비밀번호 맞음
				}else{// 아이디 맞음, 비밀번호 틀림
					check = 0;
				}
				
			}else{//아이디가 존재하지 않음
				check = -1;
			}
			
			
		}catch(Exception e){
			System.out.println("DAO userCheck에서 에러" + e);
		}finally{
			//자원해제
			if(pstmt != null){try{pstmt.close();} catch (SQLException e){e.printStackTrace();}}
			if(con != null){try{con.close();} catch (SQLException e){e.printStackTrace();}}
			if(rs != null){try{rs.close();} catch (SQLException e){e.printStackTrace();}}
		}
		//check리턴
		return check;
	}//userCheck end
	
	
	//이메일 인증 랜덤 번호 작업을 하는 randomNum() 메서드
	public String randomNum(){
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 6; i++) {
			int num = (int) (Math.random() * 10);
			sb.append(num);
		}
		return sb.toString();
	}//randomNum end
	
	
	//인증용 이메일을 발송하는 sendEmail() 메서드
	public int sendEmail(String to, String authNum){
		String sender = "mealkit534@gmail.com";
		String subject = "CINEUS 가입 인증 번호 발송 메일입니다.";
		String content = "반갑습니다 " + to + "님! <br> 고객님의 인증번호는 [" + authNum + "] 입니다!"; 
		
		Properties p = System.getProperties();
		
		try {
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.host", "smtp.gmail.com");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.port", "587");	//gmail 포트
			Authenticator auth = new GoogleAuthentication(); 
			Session session = Session.getDefaultInstance(p, auth);
			
			Message message = new MimeMessage(session);	//메일의 내용을 담을 객체
			message.setSubject(subject);	//제목
			
			message.setHeader("content-type", "text/html;charset=UTF-8");
			
			Address senderAd = new InternetAddress(sender);
			message.setFrom(senderAd);	//보내는 사람
			
			Address receiverAd = new InternetAddress(to);
			message.addRecipient(Message.RecipientType.TO, receiverAd);	//받는 사람

			message.setContent(content, "text/html;charset=UTF-8");	//내용과 인코딩
			
			message.setSentDate(new Date());
			Transport.send(message);	//이메일 전송
			
			return 1;
			
		} catch (Exception e) {
			System.out.println("sendEmail()메서드에서 오류" + e);
			return 0;
		}
	
	}//sendEmail end
	
	
	//아이디 찾기
	public String findId(String customer_name, String customer_tel, String customer_email){
		
		String findId = null;	

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try{
		con = getConnection();
		sql = "select customer_ID from customer where customer_name=? and customer_tel=? and customer_email=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, customer_name);
		pstmt.setString(2, customer_tel);
		pstmt.setString(3, customer_email);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			findId = rs.getString(1);
		}
		
		}catch(Exception e){
			System.out.println("DAO findId에서 에러" + e);
		}finally{
		//자원해제
		if(pstmt != null){try{pstmt.close();} catch (SQLException e){e.printStackTrace();}}
		if(con != null){try{con.close();} catch (SQLException e){e.printStackTrace();}}
		if(rs != null){try{rs.close();} catch (SQLException e){e.printStackTrace();}}
		
		}

		return findId;
				
		}//findId end
	
	
	
	//비밀번호 찾기
	public String findPw(String customer_name, String customer_ID, String customer_email){
		
		String findPw = null;	

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try{
		con = getConnection();
		sql = "select customer_pw from customer where customer_name=? and customer_ID=? and customer_email=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, customer_name);
		pstmt.setString(2, customer_ID);
		pstmt.setString(3, customer_email);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			findPw = rs.getString("customer_pw");
		}
		
		}catch(Exception e){
			System.out.println("DAO findPw에서 에러" + e);
		}finally{
		//자원해제
		if(pstmt != null){try{pstmt.close();} catch (SQLException e){e.printStackTrace();}}
		if(con != null){try{con.close();} catch (SQLException e){e.printStackTrace();}}
		if(rs != null){try{rs.close();} catch (SQLException e){e.printStackTrace();}}
		
		}
		return findPw;
				
		}//findId end
	
	
	//비밀번호 찾기 이메일
	public int sendpwEmail(String to, String pathNum){
		String sender = "mealkit534@gmail.com";
		String subject = "CINEUS 비밀번호 찾기";
		String content = "반갑습니다 " + to + "님! <br> 고객님의 비밀번호는 [" + pathNum + "] 입니다!"; 
		
		Properties p = System.getProperties();
		
		try {
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.host", "smtp.gmail.com");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.port", "587");	//gmail 포트
			Authenticator auth = new GoogleAuthentication(); 
			Session session = Session.getDefaultInstance(p, auth);
			
			Message message = new MimeMessage(session);	//메일의 내용을 담을 객체
			message.setSubject(subject);	//제목
			
			message.setHeader("content-type", "text/html;charset=UTF-8");
			
			Address senderAd = new InternetAddress(sender);
			message.setFrom(senderAd);	//보내는 사람
			
			Address receiverAd = new InternetAddress(to);
			message.addRecipient(Message.RecipientType.TO, receiverAd);	//받는 사람

			message.setContent(content, "text/html;charset=UTF-8");	//내용과 인코딩
			
			message.setSentDate(new Date());
			Transport.send(message);	//이메일 전송
			
			return 1;
			
		} catch (Exception e) {
			System.out.println("sendpwEmail()메서드에서 오류" + e);
			return 0;
		}
	
	}//sendEmail end
	
	
	//로그인한 회원의 정보를 불러오는 메서드
	public MemberBean getMemberInfo(String customer_id) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		MemberBean mbean = new MemberBean();			
		
		try {

			con = getConnection();
			sql = "select * from customer where customer_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, customer_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {								
				mbean.setCustomer_id(rs.getString("customer_id"));
				mbean.setCustomer_name(rs.getString("customer_name"));
				mbean.setCustomer_email(rs.getString("customer_email"));
				mbean.setCustomer_tel(rs.getString("customer_tel"));
				mbean.setCustomer_postcode(rs.getString("customer_postcode"));
				mbean.setCustomer_address(rs.getString("customer_address"));
				mbean.setCustomer_detailAddress(rs.getString("customer_detailAddress"));
				mbean.setCustomer_extraAddress(rs.getString("customer_extraAddress"));
				mbean.setCustomer_grade(rs.getString("customer_grade"));
				mbean.setCustomer_delete(rs.getString("customer_delete"));
			}
			
		} catch (Exception e) {
			System.out.println("getMemberInfo()메서드에서 오류" + e);
		} finally {
			if(pstmt != null){try{pstmt.close();} catch (SQLException e){e.printStackTrace();}}
			if(con != null){try{con.close();} catch (SQLException e){e.printStackTrace();}}
			if(rs != null){try{rs.close();} catch (SQLException e){e.printStackTrace();}}
		} 
		return mbean;

	}//getMemberInfo end
	
	
	
	
	//회원정보 수정 메소드
	public int updateMember(MemberBean memberBean){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int check = 0;
		try{
			//커넥션풀로부터 커넥션 얻기
			con = getConnection();
			
			sql = "select * from customer where customer_ID=?";
			//SELECT를 실행할 PreparedStatement객체 얻기
			pstmt = con.prepareStatement(sql);
			//?기호에 대응하는 값을 설정
			pstmt.setString(1,memberBean.getCustomer_id());
			//검색한 후 그 결과를 ResultSet객체에 저장하여 얻기
			rs = pstmt.executeQuery(); 
			
			sql = "update customer set customer_pw=?, customer_name=?, customer_tel=?, customer_email=?, customer_postcode=?, customer_address=?, customer_detailAddress=?, customer_extraAddress=? where customer_ID=?";
			//?기호에 대응되는 값을 설정
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberBean.getCustomer_pw());
			pstmt.setString(2, memberBean.getCustomer_name());
			pstmt.setString(3, memberBean.getCustomer_tel());
			pstmt.setString(4, memberBean.getCustomer_email());
			pstmt.setString(5, memberBean.getCustomer_postcode());
			pstmt.setString(6, memberBean.getCustomer_address());
			pstmt.setString(7, memberBean.getCustomer_detailAddress());
			pstmt.setString(8, memberBean.getCustomer_extraAddress());
			pstmt.setString(9, memberBean.getCustomer_id());
			
			pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("DAO updateMember에서 에러" + e);
		}finally{
			if(pstmt != null){try{pstmt.close();} catch (SQLException e){e.printStackTrace();}}
			if(con != null){try{con.close();} catch (SQLException e){e.printStackTrace();}}
			if(rs != null){try{rs.close();} catch (SQLException e){e.printStackTrace();}} 
		}
		return check;
	}//updateMember end
	
	
	//회원탈퇴
	public String deleteMember(String customer_ID, String customer_pw){
		
		String Delete = null;	

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try{
		con = getConnection();
		sql = "select customer_ID from customer where customer_pw=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, customer_pw);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			Delete = rs.getString(1);
		}
		
		}catch(Exception e){
			System.out.println("DAO deleteMember에서 에러" + e);
		}finally{
		//자원해제
		if(pstmt != null){try{pstmt.close();} catch (SQLException e){e.printStackTrace();}}
		if(con != null){try{con.close();} catch (SQLException e){e.printStackTrace();}}
		if(rs != null){try{rs.close();} catch (SQLException e){e.printStackTrace();}}
		
		}

		return Delete;
				
		}//deleteMember end
	
	
	
	
	//회원탈퇴 회원 비활성화
	public int delUpdateMember(MemberBean memberBean){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int check = 0;
		try{
			//커넥션풀로부터 커넥션 얻기
			con = getConnection();
			
			sql = "select customer_delete from customer where customer_ID=?";
			//SELECT를 실행할 PreparedStatement객체 얻기
			pstmt = con.prepareStatement(sql);
			//?기호에 대응하는 값을 설정
			pstmt.setString(1,memberBean.getCustomer_id());
			//검색한 후 그 결과를 ResultSet객체에 저장하여 얻기
			rs = pstmt.executeQuery(); 
			
			sql = "update customer set customer_delete = 1 where customer_ID=?";
			//?기호에 대응되는 값을 설정
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberBean.getCustomer_id());			
			pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("DAO delUpdateMember에서 에러" + e);
		}finally{
			if(pstmt != null){try{pstmt.close();} catch (SQLException e){e.printStackTrace();}}
			if(con != null){try{con.close();} catch (SQLException e){e.printStackTrace();}}
			if(rs != null){try{rs.close();} catch (SQLException e){e.printStackTrace();}} 
		}
		return check;
	}//delUpdateMember end
	
	
	//로그인한 회원이 탈퇴한 회원인지를 판별하는 메서드
	public int login2(MemberBean memberBean){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int check = 0;
		try{
			//커넥션풀로부터 커넥션 얻기
			con = getConnection();
			
			sql = "select customer_delete from customer where customer_ID=?";
			//SELECT를 실행할 PreparedStatement객체 얻기
			pstmt = con.prepareStatement(sql);
			//?기호에 대응하는 값을 설정
			pstmt.setString(1,memberBean.getCustomer_id());
			//검색한 후 그 결과를 ResultSet객체에 저장하여 얻기
			rs = pstmt.executeQuery(); 
			
			sql = "update customer set customer_delete = 1 where customer_ID=?";
			//?기호에 대응되는 값을 설정
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberBean.getCustomer_id());			
			pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("DAO delUpdateMember에서 에러" + e);
		}finally{
			if(pstmt != null){try{pstmt.close();} catch (SQLException e){e.printStackTrace();}}
			if(con != null){try{con.close();} catch (SQLException e){e.printStackTrace();}}
			if(rs != null){try{rs.close();} catch (SQLException e){e.printStackTrace();}} 
		}
		return check;
	}//login2 end


	
	
}//MemberDAO end
