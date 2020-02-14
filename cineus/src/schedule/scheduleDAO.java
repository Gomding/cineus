package schedule;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Theater.TheaterDTO;

public class scheduleDAO {
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
			e.printStackTrace();
		}
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
	
	public String getTicket_seat(int s_id) {

		String allSeats = "";
		
		sql="select reservation_payment_seats from reservation_payment where reservation_payment_schedule_id = ?";
			try{
				getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, s_id);
				rs=pstmt.executeQuery();
				while(rs.next()){
					allSeats += rs.getString("reservation_payment_seats") + ",";
					
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
			finally{
				close();
			}
		
		return allSeats;
	}
	
	
	public List<scheduleDTO> getScheduleListByScreen(int s_idx, int t_idx, int l_idx, int year, int week){
		//넘겨받은 값은 검색시작년도(year, 예를 들어 2020), 검색할 주(week, 1부터 시작함)
		List<scheduleDTO> list=new ArrayList<>();
		/*sql="select * from schedule where screen_ID=?, theater_ID=?";*/
		/*전달받은 값은 아이디와 반드시 일치하지는 않는다.
		theater_ID의 경우 83번부터 시작함. 그러므로 index에 대응하는 id를 찾으려면 
		sql문이 길어진다.*/
		sql="select schedule_ID, schedule_date, "
			+"date_format(start_at, '%H%i'), date_format(end_at, '%H%i'), "
			+"movie_ID, screen_ID, theater_ID from schedule "
			+"where screen_ID=? and theater_ID=("
		   +"select theater_ID from theater where code=("
		   +"select code from locations where group_num=?"
		   +")"
		   +"order by " 
		   +"if(ascii(substring(name,1))<128,9,1) asc, name asc " 
		   +"limit ?,1"
		   +") and week(schedule_date,0)=? and year(schedule_date)=?;";
		try{
			getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,s_idx);
			pstmt.setInt(2,l_idx);
			pstmt.setInt(3,t_idx-1);
			pstmt.setInt(4, week-1);
			pstmt.setInt(5, year);
			rs=pstmt.executeQuery();
			while(rs.next()){
				scheduleDTO dto=new scheduleDTO(
						rs.getInt(1),
						rs.getDate(2),
						rs.getString(3),
						rs.getString(4),
						rs.getInt(5),
						rs.getInt(6),
						rs.getInt(7)
				);
				
				list.add(dto);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			close();
		}
		
		return list;
	}
	
	//얘는 일단 안쓰고 ~J를 쓴다.
	public List<scheduleDTO> getScheduleListByMovie(int movie_ID, LocalDate pdate){
		List<scheduleDTO> list=new ArrayList<>();
		Date date=java.sql.Date.valueOf(pdate);
		//System.out.println("scheduleDAO서 받은 date 값 : "+date.toString());
		// ㄴ 오늘 날짜로 똑바로 나온다. 그런데 왜 sql 문에서는 전날로 나올까???
		// ㄴ 일단 보류함
		System.out.println("LocalDate : "+pdate+"| Date : "+date);
		sql="select * from schedule where movie_ID=? and schedule_date=?";
		// ㄴ 정렬도 해야하는데 아직 schedule 데이터가 충분하지 않아서 일단 미룸
		try{
			getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, movie_ID);
			pstmt.setDate(2, date);
			rs=pstmt.executeQuery();
			while(rs.next()){
				scheduleDTO dto=new scheduleDTO(
						rs.getInt(1),
						rs.getDate(2),
						rs.getString(3),
						rs.getString(4),
						rs.getInt(5),
						rs.getInt(6),
						rs.getInt(7)
				);
				
				list.add(dto);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			close();
		}
		return list;
	}//getScheduleListByMovie 끝

	
	public List<scheduleDTOJ> getScheduleListByMovieJ(int movie_ID, LocalDate pdate){
		//아래 값들을 추가로 구해야 한다.
		/*String theater_name; // 예 : 강남 메가박스
		int group_num; //1~8
		String location_name; //예 : 부산 충청 대전...
		int show_time;
		String end_at_accurate; // ####, 네자리 hhmm
*/		
		List<scheduleDTOJ> list=new ArrayList<>();
		Date date=java.sql.Date.valueOf(pdate);
		//System.out.println("scheduleDAO서 받은 date 값 : "+date.toString());
		// ㄴ 오늘 날짜로 똑바로 나온다. 그런데 왜 sql 문에서는 전날로 나올까???
		// ㄴ 일단 보류함
		sql="select schedule.*, theater.name, movie.title, movie.show_time, locations.group_num, "
			+"locations.name from schedule "
			+"left join theater on schedule.theater_ID=theater.theater_ID "
			+"left join movie on schedule.movie_ID=movie.movie_ID "
			+"left join locations on locations.code=theater.code "
			+"where schedule.movie_ID=? and schedule.schedule_date=? "
			+"order by locations.group_num asc, theater.name asc, schedule.screen_ID asc, "
			+"schedule.start_at asc";
		try{
			getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, movie_ID);
			pstmt.setDate(2, date);
			rs=pstmt.executeQuery();
			while(rs.next()){
				scheduleDTOJ dtoj=new scheduleDTOJ(
						rs.getInt(1),
						rs.getDate(2),
						rs.getString(3),
						rs.getString(4),
						rs.getInt(5),
						rs.getInt(6),
						rs.getInt(7)
				);
				dtoj.setTheater_name(rs.getString(8));
				dtoj.setTitle(rs.getString(9));
				dtoj.setShow_time(rs.getInt(10));
				dtoj.setGroup_num(rs.getInt(11));
				dtoj.setLocation_name(rs.getString(12));
				
				//end_at_accurate 는 계산해서 넣음
				int show_time=dtoj.getShow_time();
				int h=show_time/60+Integer.parseInt(dtoj.start_at.substring(0, 2));
				int m=show_time%60+Integer.parseInt(dtoj.start_at.substring(3,5))+10; //10분 더해준다.
					// ㄴ 왜냐면 영화는 시작시각에서 10분 지나서 상영 시작이기 때문.
					// 그리고 참고로 start_at 은 hh:mm:ss 형식임.
				if(m>=60) {h+=m/60; m=m%60;}
				if(m>=10){
					dtoj.setEnd_at_accurate(String.valueOf(h)+String.valueOf(m));
				}
				else{
					dtoj.setEnd_at_accurate(String.valueOf(h)+"0"+String.valueOf(m));
				}
				
				list.add(dtoj);
			} /*while 끝*/
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			close();
		}
		return list;
	}
	
	
	
	//schedule id를 받아서 해당하는 scheduleDTOJ를 구한다.
	public scheduleDTOJ getSchedule(int s_id){
		scheduleDTOJ dtoj=null;
		sql="select schedule.*, theater.name, movie.title, movie.show_time, locations.group_num, "
				+"locations.name from schedule "
				+"left join theater on schedule.theater_ID=theater.theater_ID "
				+"left join movie on schedule.movie_ID=movie.movie_ID "
				+"left join locations on locations.code=theater.code "
				+"where schedule_ID=? "
				+"order by locations.group_num asc, theater.name asc, schedule.screen_ID asc, "
				+"schedule.start_at asc";
		try{
			getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, s_id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				dtoj=new scheduleDTOJ(
						rs.getInt(1), 	//  schedule_ID;
						rs.getDate(2), 	//  schedule_date;
						rs.getString(3), // start_at;
						rs.getString(4), // end_at; 
						rs.getInt(5), 	//movie_ID;
						rs.getInt(6), 	// screen_ID;	
						rs.getInt(7) 	//theater_ID;
				);
				dtoj.setTheater_name(rs.getString(8));
				dtoj.setTitle(rs.getString(9));
				dtoj.setShow_time(rs.getInt(10));
				dtoj.setGroup_num(rs.getInt(11));
				dtoj.setLocation_name(rs.getString(12));
				
				//end_at_accurate 는 계산해서 넣음
				int show_time=dtoj.getShow_time();
				int h=show_time/60+Integer.parseInt(dtoj.start_at.substring(0, 2));
				int m=show_time%60+Integer.parseInt(dtoj.start_at.substring(3,5))+10; //10분 더해준다.
					// ㄴ 왜냐면 영화는 시작시각에서 10분 지나서 상영 시작이기 때문.
					// 그리고 참고로 start_at 은 hh:mm:ss 형식임.
				if(m>=60) {h+=m/60; m=m%60;}
				if(m>=10){
					dtoj.setEnd_at_accurate(String.valueOf(h)+String.valueOf(m));
				}
				else{
					dtoj.setEnd_at_accurate(String.valueOf(h)+"0"+String.valueOf(m));
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			close();
		}
		return dtoj;
	}//getScheduleListByMovie 끝	
}
