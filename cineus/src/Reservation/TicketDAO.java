package Reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class TicketDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql = "";

	// 커넥션 풀로부터 커넥션을 얻기위한 메소드
	private Connection getConnection() throws Exception {
		con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/CineUs");
		con = ds.getConnection();

		return con;
	} // getConnection() 메소드 끝

	public void disconnect() throws SQLException {
		if (rs != null) {
			rs.close();
		}
		if (pstmt != null)
			pstmt.close();
		if (con != null)
			con.close();
	}
	
	public TicketDTO getTicket(int ticket_id) {
		 
		 TicketDTO ticketDto = new TicketDTO();
		 
		 	try {
			 
			 con = getConnection();
			 sql = "select * from reservation_payment where reservation_payment_id = ?";
					 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ticket_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ticketDto.setReservation_payment_id(rs.getInt("reservation_payment_id"));
				ticketDto.setReservation_payment_cardNum(rs.getString("reservation_payment_cardNum"));
				ticketDto.setReservation_payment_check(rs.getString("reservation_payment_check"));
				ticketDto.setReservation_payment_date(rs.getString("reservation_payment_date"));
				ticketDto.setReservation_payment_film(rs.getString("reservation_payment_film"));
				ticketDto.setReservation_payment_headCount(rs.getInt("reservation_payment_headCount"));
				ticketDto.setReservation_payment_method(rs.getString("reservation_payment_method"));
				ticketDto.setReservation_payment_movie_id(rs.getInt("reservation_payment_movie_id"));
				ticketDto.setReservation_payment_payCompany(rs.getString("reservation_payment_payCompany"));
				ticketDto.setReservation_payment_schedule_id(rs.getInt("reservation_payment_schedule_id"));
				ticketDto.setReservation_payment_screen_id(rs.getInt("reservation_payment_schedule_id"));
				ticketDto.setReservation_payment_seats(rs.getString("reservation_payment_seats"));
				ticketDto.setReservation_payment_showtimes(rs.getString("reservation_payment_showtimes"));
				ticketDto.setReservation_payment_telnum(rs.getString("reservation_payment_telnum"));
				ticketDto.setReservation_payment_theater_name(rs.getString("reservation_payment_theater_name"));
				ticketDto.setReservation_payment_ticketPrice(rs.getInt("reservation_payment_ticketPrice"));
				ticketDto.setReservation_payment_writeDate(rs.getDate("reservation_payment_writeDate"));
			}
			 
		 }catch(Exception e) {
			 System.out.println("TicketDAO -> getTicket 에서 발생한 예외");
			 e.printStackTrace();
		 }finally {
			 try{
				 disconnect();
				 
			}catch(Exception e) {
				 e.printStackTrace();
			}
		 }
		return ticketDto;
	}
	

	public void deleteEvent(int ticket_id) {

		try {

			con = getConnection();

			sql = "DROP EVENT ee" + ticket_id;
			Statement stmt = con.createStatement();

			stmt.executeUpdate(sql);

			stmt.close();

		} catch (Exception e) {
			System.out.println("TicketDAO -> setDeleteTicket_event 에서 발생한 예외");
			e.printStackTrace();
		} finally {
			try {
				disconnect();

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	public void setDeleteTicket_event(int ticket_id, int schedule_id) {

		try {

			con = getConnection();

			sql = "CREATE EVENT ee" + ticket_id + " ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 MINUTE"
					+ " DO delete from reservation_payment where reservation_payment_id = " + ticket_id
					+ " AND reservation_payment_schedule_id = " + schedule_id;
			Statement stmt = con.createStatement();

			stmt.executeUpdate(sql);

			stmt.close();

		} catch (Exception e) {
			System.out.println("TicketDAO -> setDeleteTicket_event 에서 발생한 예외");
			e.printStackTrace();
		} finally {
			try {
				disconnect();

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	public void setConfirmTicket(String payMethod, String company, int ticket_id, String cardnum, String telnum) {
		try {

			con = getConnection();

			sql = "update reservation_payment set reservation_payment_method = ? , reservation_payment_payCompany = ? , reservation_payment_cardNum = ?, reservation_payment_telnum = ?, reservation_payment_check = '결제완료' where reservation_payment_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, payMethod);
			pstmt.setString(2, company);
			pstmt.setString(3, cardnum);
			pstmt.setString(4, telnum);
			pstmt.setInt(5, ticket_id);
			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("TicketDAO -> setConfirmTicket 에서 발생한 예외");
			e.printStackTrace();
		} finally {
			try {
				disconnect();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public int getTicketID(int movie_id, int schedule_id, String allSeat, String id) {
		int ticket_id = 0;

		try {

			con = getConnection();

			sql = "select reservation_payment_id from reservation_payment where reservation_payment_movie_id = ? AND reservation_payment_schedule_id = ? AND reservation_payment_seats = ? AND customer_id = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movie_id);
			pstmt.setInt(2, schedule_id);
			pstmt.setString(3, allSeat);
			pstmt.setString(4, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				ticket_id = rs.getInt("reservation_payment_id");
			}

		} catch (Exception e) {
			System.out.println("TicketDAO -> getTicketID 에서 발생한 예외");
			e.printStackTrace();
		} finally {
			try {
				disconnect();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return ticket_id;
	}

	public void setFirstTicket(String schedule_date, String title, int movie_id, String showtimes, String theater_name,
			int screen_id, int schedule_id, String allSeat, int headCount, int ticketPrice, String id) {

		try {

			con = getConnection();

			sql = "insert into reservation_payment(reservation_payment_date, reservation_payment_film, reservation_payment_movie_id, reservation_payment_showtimes, reservation_payment_theater_name, reservation_payment_screen_id, reservation_payment_schedule_id, reservation_payment_seats, reservation_payment_headCount, reservation_payment_ticketPrice, customer_id)  values(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, schedule_date);
			pstmt.setString(2, title);
			pstmt.setInt(3, movie_id);
			pstmt.setString(4, showtimes);
			pstmt.setString(5, theater_name);
			pstmt.setInt(6, screen_id);
			pstmt.setInt(7, schedule_id);
			pstmt.setString(8, allSeat);
			pstmt.setInt(9, headCount);
			pstmt.setInt(10, ticketPrice);
			pstmt.setString(11, id);

			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("TicketDAO -> setFirstTicket 에서 발생한 예외");
			e.printStackTrace();
		} finally {
			try {
				disconnect();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public List<TicketDTO> getTecketList(String id) {

		List<TicketDTO> list = new ArrayList<TicketDTO>();
		
		sql = "select * from reservation_payment where customer_id=?";
		try {

			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				TicketDTO tdto = new TicketDTO();
					tdto.setCustomer_id(rs.getString("customer_id"));
					tdto.setReservation_payment_id(rs.getInt("reservation_payment_id"));
					tdto.setReservation_payment_writeDate(rs.getDate("reservation_payment_writeDate"));
					tdto.setReservation_payment_theater_name(rs.getString("reservation_payment_theater_name"));
					tdto.setReservation_payment_screen_id(rs.getInt("reservation_payment_screen_id"));
					tdto.setReservation_payment_film(rs.getNString("reservation_payment_film"));
					tdto.setReservation_payment_showtimes(rs.getString("reservation_payment_showtimes"));
					tdto.setReservation_payment_headCount(rs.getInt("reservation_payment_headcount"));
					tdto.setReservation_payment_seats(rs.getString("reservation_payment_seats"));
					tdto.setReservation_payment_ticketPrice(rs.getInt("reservation_payment_ticketprice"));
					
				list.add(tdto);
			}

		} catch (Exception e) {
			System.out.println("TicketDAO -> setFirstTicket 에서 발생한 예외");
			e.printStackTrace();
		} finally {
			try {
				disconnect();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
			return list;
		
		
	}

}
