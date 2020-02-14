package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MovieLikeDAO {
	
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
	
	public boolean insertMovieLike(int movie_ID, String customer_ID){
		sql="insert into movie_like (movie_ID, customer_ID, reg_date) values (?,?,?)";
		try {
			getConnection();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movie_ID);
			pstmt.setString(2, customer_ID);
			pstmt.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
			int result=pstmt.executeUpdate();
			if(result==1) return true;
			else return false;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}//finally끝
		return false;
	}
	
	public boolean deleteMovieLike(int movie_ID, String customer_ID){
		sql="delete from movie_like where movie_ID=? and customer_ID=?";
		try {
			getConnection();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movie_ID);
			pstmt.setString(2, customer_ID);
			int result=pstmt.executeUpdate();
			if(result==1) return true;
			else return false;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}//finally끝
		return false;
	}

	//영화의 ID를 받아서
	//해당영화의 좋아요 개수를 리턴함.
	public int getMoiveLikeTotal(int movie_ID){
		sql="select count(*) from movie_like where movie_ID=?";
		try {
			getConnection();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movie_ID);
			rs=pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("getMoiveLikeTotal 결과는 : "+rs.getInt(1));
				return rs.getInt(1);
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}//finally끝
		return -1;
	}
	
	//사용자의 ID를 받아서
	//좋아요 누른 영화 아이디 목록을 리턴함
	public List<Integer> getMovieLikeList(String customer_ID){
		List<Integer> list=new ArrayList<>();
		sql="select movie_ID from movie_like where customer_ID=? order by reg_date desc";
		try {
			getConnection();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, customer_ID);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				list.add(rs.getInt(1));
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}//finally끝
		return list;
	}
	
	//어떤 사용자가 어떤 영화에
	//좋아요를 누른 상태인지 아닌지를 리턴함
	public boolean movieLikeExists(int movie_ID, String customer_ID){
		sql="select count(*) from movie_like where movie_ID=? and customer_ID=?";
		try {
			getConnection();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movie_ID);
			pstmt.setString(2, customer_ID);
			rs=pstmt.executeQuery();
			if (rs.next()) {
				int result=rs.getInt(1);
				if(result==1) return true; //누른 상태이다.
				else{ 
					//오류
				}
			}
			else{
				return false; //안누른 상태이다.
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		return false; //오류
	}
	
	public boolean movieLikeToggle(int movie_ID, String customer_ID){
		if(movieLikeExists(movie_ID, customer_ID)){ //존재하면
			//지운다
			return deleteMovieLike(movie_ID, customer_ID);
		}
		else{ //존재하지 않으면
			//만든다
			return insertMovieLike(movie_ID, customer_ID);
		}
	}
}
