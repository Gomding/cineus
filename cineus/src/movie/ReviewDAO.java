package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//ReviewDAO를 DB와 연결 시켜 내용을 불러온다.
public class ReviewDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;
	
	//
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
	
	public int getAllReviewCount(int movie_ID) {
		int count = 0; 
		try {
			getConnection();
			sql = "select count(*) from review where movie_ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movie_ID);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				count = rs.getInt(1);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}//finally끝
		return count;
	
		
	}
	public boolean deleteReview(int review_num) {
		sql="delete from review where review_num=?";
		try {
			getConnection();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, review_num);
			int result=pstmt.executeUpdate();
			if(result==1) 
				return true;
			else 
				return false;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}//finally끝
		return false;
	}
	
	public List<ReviewBean> getReviewListAll(int movie_ID, int startRow){
		List<ReviewBean> list=new ArrayList<>();
		 
		sql="select * from review where movie_ID = ? order by review_num desc limit ? , 10";
		try{
			getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movie_ID);
			pstmt.setInt(2, startRow);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReviewBean rbean = new ReviewBean(
					rs.getInt("review_num"),
					rs.getString("review_name"),
					rs.getInt("review_star"),
					rs.getString("review_content"),
					rs.getTimestamp("review_date"),
					rs.getInt("movie_ID")
				);
				list.add(rbean);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		return list; //ArrayList리턴
	} //getMoviesList 끝

	public boolean insertReview(ReviewBean rbean) {
		
		sql="insert into review (review_name, review_star, review_content, movie_ID) values (?,?,?,?)";
		try {
			getConnection();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rbean.getReview_name());
			pstmt.setInt(2, rbean.getReview_star());
			pstmt.setString(3, rbean.getReview_content());
			pstmt.setInt(4, rbean.getMovie_ID());
			
			int result=pstmt.executeUpdate();
			
			
			if(result==1) 
				return true;
			else 
				return false;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}//finally끝
		return false;
		
		
	}
	
	
}










