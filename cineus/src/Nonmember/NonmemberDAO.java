package Nonmember;

import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.UUID;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class NonmemberDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;
	
	private Connection getConnection(){
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/CineUs");
			
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	private void close(){
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//1을 리턴해야 로그인 허용임
	//네 항목 모두 일치해야 로그인됨.
	/*public int login(String nonmember_name, String nonmember_pw, int nonmember_tel, int nonmember_birth){*/
	public int login(String nonmember_pw, int nonmember_tel, int nonmember_birth){
		sql = "select * from nonmember "
			 +"where nonmember_tel=? and nonmember_birth=?";
		try {
			getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, nonmember_tel);
			pstmt.setInt(2, nonmember_birth);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(nonmember_pw.equals(rs.getString("nonmember_pw"))){ 
					return 1; //로그인 허용
				}
				else{
					return 0; //비밀번호 틀렸다
				}
			}
			else{
				return -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			close();
		}
		return -2; 
	}//login 끝

	
	
	public boolean join(String nonmember_name, String nonmember_pw, int nonmember_tel, int nonmember_birth){
		sql = "insert into nonmember (nonmember_ID, nonmember_name, nonmember_pw, nonmember_tel, nonmember_birth, reg_date) "
			 +"values(?,?,?,?,?,?)";
		/*sql = "insert into nonmember (nonmember_ID, nonmember_name, nonmember_pw, nonmember_tel, nonmember_birth, reg_date) "
			 +"values("
			 +getNewID()+", "
			 +nonmember_name+", "
			 +nonmember_pw+", "
			 +nonmember_tel+", "
			 +nonmember_birth+", "
			 +new Timestamp(System.currentTimeMillis())
			 +")";*/
		try {
			getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, getNewID());
			/*pstmt.setString(2, "가나다"); 심지어 이렇게 해도 ???로 나온다.*/
			/*pstmt.setString(2, nonmember_name);*/
			pstmt.setString(2, URLEncoder.encode(nonmember_name, "UTF-8"));
			pstmt.setString(3, nonmember_pw);
			pstmt.setInt(4, nonmember_tel);
			pstmt.setInt(5, nonmember_birth);
			pstmt.setTimestamp(6,new Timestamp(System.currentTimeMillis()));
			System.out.println(pstmt.toString());
			
			if(pstmt.executeUpdate()==1){
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return false;
	}
	
	private String getNewID(){
		/*return "nonmember_"+countAll();*/ //nonmember_0, nonmember_1...
		// XXXXXXXXXXXXXX
		
		return UUID.randomUUID().toString();
		
	}
	
	
	//지금은 사용안함
	private int countAll(){
		sql = "select count(*) from nonmember"; 
		try {
			getConnection();
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return -1;
	}
	
	
}
