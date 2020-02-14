package Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import movie.MovieDTO;

public class CustomerDAO {
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
	public int login(String id, String pw){
		sql = "select * from customer where customer_ID=?";
		try {
			getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(pw.equals(rs.getString("customer_pw"))){ 
					return 1;
				}
				else{
					return 0; 
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
	
	public List<CustomerDTO> getAllCustomerList(){
		List<CustomerDTO> list=new ArrayList<>();
		sql = "select * from customer";
		try {
			getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				CustomerDTO dto = new CustomerDTO();
				dto.setCustomer_ID(rs.getString("customer_ID"));
				dto.setCustomer_name(rs.getString("customer_name"));
				dto.setCustomer_tel(rs.getInt("customer_tel"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			close();
		}
		return list;
	}
	
}
