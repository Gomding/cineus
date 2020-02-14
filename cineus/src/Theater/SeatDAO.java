package Theater;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SeatDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;
	
	private void getConnection(){
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/CineUs");
			con = ds.getConnection();
		} catch (Exception e) {
			System.out.println("TheaterDAO getConnection() 예외 발생");
			e.printStackTrace();
		}
	}
	
	private void close(){
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		} catch (SQLException e) {
			System.out.println("SeatDAO close()");
			e.printStackTrace();
		}
	}
	
	public List<String> getMap(int theater_ID, int screen_ID){
		CustomPair cp=getMapSize(theater_ID, screen_ID);
		int[][] map=new int[cp.rows][cp.cols];
		// ㄴ  For primitive types like int , long , float 
		//     the default value are zero ( 0 or 0.0 )
		
		sql="select seat_no, seat_line_no "
		   +"from seat "
		   +"where theater_ID=? and screen_ID=?";
		try{
			getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, theater_ID);
			pstmt.setInt(2, screen_ID);
			rs=pstmt.executeQuery();
			while(rs.next()){
				map[rs.getInt(2)-1][rs.getInt(1)-1]=1;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			close();
		}//여기까지 배열맵
		
		List<String> map_list=new ArrayList<>();
		for (int[] array : map) {
			String s=Arrays.toString(array).replace(",","").replace(" ","");
			s=s.replace("0","_").replace("1","a");
		    map_list.add(s);      
		}
		return map_list;
	}
	
	public CustomPair getMapSize(int theater_ID, int screen_ID){
		CustomPair cp=null;
		try{
			sql="select max(seat_no) as COLS, max(seat_line_no) as ROWS "
					   +"from seat "
					   +"where theater_ID=? and screen_ID=?";
			getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, theater_ID);
			pstmt.setInt(2, screen_ID);
			rs=pstmt.executeQuery();
			if(rs.next()){
				cp=new CustomPair(rs.getInt(2),rs.getInt(1));
			}
		}
		catch(Exception e){
			System.out.println("TheaterDAO constructor 예외 발생");
			e.printStackTrace();
		}
		finally{
			close();
		}
		return cp;
	}
	
	public class CustomPair {
	    private int rows;
	    private int cols;
		public CustomPair(int rows, int cols) {
			this.rows = rows;
			this.cols = cols;
		}
	}
}
