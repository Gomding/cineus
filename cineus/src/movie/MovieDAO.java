package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MovieDAO {
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
	
	/***********/
	/** 검색 **/
	/***********/
	
	
	//영화의 아이디를 전달받아 그에 해당하는 정보 검색 하는 메서드
	public MovieDTO getMovieDTO(int movie_ID){
		
		MovieDTO dto =null;
		sql = "select * from movie where movie_ID = ?";
		try {
			getConnection();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movie_ID);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				dto = new MovieDTO(
						rs.getInt("movie_ID"),
						rs.getString("title"),
						rs.getString("title_en"),
						rs.getString("plot"),
						rs.getString("trailer"),
						rs.getInt("product_year"),
						rs.getInt("show_time"),
						rs.getDate("start_date"),
						rs.getDate("end_date")
				);
			}
			else{
			}
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			close();
		}
		return dto;
	} //getMovieDTO 끝
	
	
	//영화 목록을 반환하는 메서드
	//예약 가능한 목록만 반환한다.( = 상영 종료일이 지난 영화는 제외한다)
	public List<MovieDTO> getMoviesListAll(){
		List<MovieDTO> list=new ArrayList<>();
		
		//sql = "select * from movie order by movie_ID desc"; 
		//최근 것부터 읽는다. 
		sql="select * from movie where (end_date>=CURDATE() or end_date is null) order by movie_ID desc";
		try{
			getConnection();
			pstmt = con.prepareStatement(sql);
					
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				MovieDTO dto = new MovieDTO(
					rs.getInt("movie_ID"),
					rs.getString("title"),
					rs.getString("title_en"),
					rs.getString("plot"),
					rs.getString("trailer"),
					rs.getInt("product_year"),
					rs.getInt("show_time"),
					rs.getDate("start_date"),
					rs.getDate("end_date")
				);
				list.add(dto);
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
	
	
	
	//범위만큼의 영화 목록을 반환한다.
	//파라미터 1 : 시작인덱스(0부터 카운트)
	//파라미터 2 : 리스트 길이
	//파라미터 3 : 1 -최신개봉작, 2-상영예정작
	//파라미터 4 : 1-개봉일순, 2-가나다순, 3-예매율순, 4-평점순
	public List<MovieDTO> getMoviesListLimit(int start, int length, int condition, int option){
		String sql1="select * from movie ";
		String sql2="";
		String sql3="";
		String sql4="limit ?, ? ";
		if(condition==1){ //개봉작만 고름
			sql2="where start_date<=? and (end_date>=? or end_date is null) ";
		}
		else if(condition==2){ //상영예정작만 고름
			sql2="where start_date>? and start_date>? ";
		}
		else{
			System.out.println("MovieDAO getMoviewListLimit()에 잘못된 파라미터 입력됨 condition값: "+condition);
		}
		
		if(option==1){
			if (condition==1){
				sql3="order by start_date desc, product_year desc ";
			}
			else{
				sql3="order by start_date asc, product_year desc ";
			}
		}
		else if(option==2){
			sql3="order by title asc ";
		}
		else if(option==3){
			sql3=""; //보류
		}
		else if(option==4){
			sql3=""; //보류
		}
		else{
			System.out.println("MovieDAO getMoviewListLimit()에 잘못된 파라미터 입력됨 : option값 "+option);
		}
		
		List<MovieDTO> list=new ArrayList<>();
		
		sql = sql1+sql2+sql3+sql4;
		ZonedDateTime nowSeoul = ZonedDateTime.now(ZoneId.of("Asia/Seoul"));
		try{
			getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setDate(1, java.sql.Date.valueOf(java.time.LocalDate.now()));
			pstmt.setDate(2, java.sql.Date.valueOf(java.time.LocalDate.now()));
			pstmt.setInt(3, start);
			pstmt.setInt(4, length);
			rs = pstmt.executeQuery();
				
			while (rs.next()) {
				MovieDTO dto = new MovieDTO(
					rs.getInt("movie_ID"),
					rs.getString("title"),
					rs.getString("title_en"),
					rs.getString("plot"),
					rs.getString("trailer"),
					rs.getInt("product_year"),
					rs.getInt("show_time"),
					rs.getDate("start_date"),
					rs.getDate("end_date")
				);
				list.add(dto);
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
}
