package Reservation;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Theater.TheaterDAO;
import movie.MovieDAO;
import schedule.scheduleDAO;
import schedule.scheduleDTOJ;

/**
 * Servlet implementation class ReservationController
 */
@WebServlet("/reservation/*")
public class ReservationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	TicketDAO ticket_dao;
	scheduleDAO schedule_dao;
	
	String next_page;
	HttpServletRequest request;
	HttpServletResponse response;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	@Override
	public void init() throws ServletException {
		ticket_dao=new TicketDAO();
		schedule_dao=new scheduleDAO();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		this.request=req;
		this.response=resp;
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		
		String action=request.getPathInfo().substring(1);
		
		switch(action){
		case "getPayPage.do":
			getPayPage();
			break;
		case "confirm_pay.do":
			confirm_pay();
			break;
		case "checkPayment.do":
			checkPayment();
			break;
		case "fa_3.me":
			checkmoviecheck();
			break;
		}
	}/*doHandle 끝*/

	
	
	public void checkmoviecheck() {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		List<TicketDTO> list = ticket_dao.getTecketList(id);
		request.setAttribute("list", list);
		
		next_page = "/intro/fa_3.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(next_page);
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 쿠폰적용&결제 페이지
	public void getPayPage() {
		//전달받는 값
		//1. 스케쥴번호
		//2. 좌석번호
		//3. (극장번호, 관번호 등등은 편의상 받아옴)
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int schedule_id=Integer.parseInt(request.getParameter("i_schedule_id"));
		int movie_id=Integer.parseInt(request.getParameter("i_movie_id"));
		String title=request.getParameter("i_title");
		String theater_name=request.getParameter("i_theater_name");
		int screen_id=Integer.parseInt(request.getParameter("i_screen_id"));
		String schedule_date=request.getParameter("i_schedule_date");
		String start_at=request.getParameter("i_start_at");
		String end_at=request.getParameter("i_end_at");
		String showtimes = start_at + " - " + end_at;
		List<String> seats=new ArrayList<>();
		for(int i=1 ; i<=8 ; i++){ //티켓 최대 개수 8개
			if(request.getParameter("i_seat_"+i)==null)
				break;
			else{
				seats.add(request.getParameter("i_seat_"+i));
			}
		}
		int headCount = seats.size();
		String allSeat = "";
		for(int i=1; i<=8 ; i++) {
			if(request.getParameter("i_seat_"+i)==null)
				break;
			else {
				allSeat += (request.getParameter("i_seat_"+i) + ",");
			}
			
		}
		
		// 좌석 선택페이지에서 고른 좌석들
		allSeat = allSeat.substring(0, allSeat.length()-1);
		System.out.println(allSeat);
		
		int ticketPrice = seats.size() * 10000; // 티켓 인원당 10000원씩 곱해서 가격을 정해줌
		
		// 임시티켓을 생성함
		ticket_dao.setFirstTicket(schedule_date, title, movie_id, showtimes, theater_name, screen_id, schedule_id, allSeat, headCount, ticketPrice, id);
		
		// 영화ID값과 시간표ID값 선택좌석 유저 아이디로  검색해서 티켓 아이디를 가져옴
		int ticket_id = ticket_dao.getTicketID(movie_id, schedule_id, allSeat, id);
		
		ticket_dao.setDeleteTicket_event(ticket_id, schedule_id); // 1분뒤 임시 티켓을 삭제하는 이벤트를 생성함
		
		//seats - > seats_id ???
		//주문서?(Reservation)생성하고
		//티켓 생성하기
		//나중에 좌석선택페이지 넘어갈 때 ajax로 reservation 스캔해서
		//결제 안되고 시간 초과한게 있다면 삭제해준다.
		//그렇게 하면 결제되지 않은 티켓도 알아서 삭제된다.
		//
		//그 다음 현재 스케쥴에 해당하는 티켓을 스캔해서 팔린(혹은 예매 진행중인) 좌석을
		//선택하지 못하게 표시한다.
		//이것도 ajax
		request.setAttribute("ticket_id", ticket_id);
		request.setAttribute("schedule_ID", schedule_id);			// 	영화 시간표 ID?
		request.setAttribute("movie_ID", movie_id);					// 영화 포스터 ID
		request.setAttribute("title", title);						// 영화제목
		request.setAttribute("theater_name", theater_name);			// 영화관 이름(지점 이름)
		request.setAttribute("screen_ID", screen_id);				// 영화관 관번호 (N관)
		request.setAttribute("start_at", start_at);					// 영화 시작 시간
		request.setAttribute("schedule_date", schedule_date);		// 영화 관람 날짜
		request.setAttribute("end_at", end_at); // 영화 끝나는 시간
		request.setAttribute("seats", seats);				// 좌석 배열
		request.setAttribute("ticketPrice", ticketPrice); // 총 티켓 가격
		
		// 선택한 좌석 allSeat
		// 이미 팔린 좌석들
		
		// 선택한 좌석으로 검색해서 있으면 true 없으면 false를 반환해서 
		// true 면 이미 팔린 좌석이라서 다시 좌석 선택화면으로 돌아감
		
		// view 포워드
		next_page="/views/reservation/reservation_p2.jsp"; // 결제수단 선택 페이지
		RequestDispatcher rd = request.getRequestDispatcher(next_page);
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// 할인선택 및 결제수단 선택(작은 팝업 결제창으로 이동할떄 쓰는 메소드
	public void checkPayment() {
		
		int ticket_id = Integer.parseInt(request.getParameter("ticket_id"));
		
		request.setAttribute("ticket_id", ticket_id);
		
		next_page = "/views/reservation/reservation_popup.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(next_page);
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 결제 팝업창에서 결제완료 클릭시 신용카드 검사 및 결제 완료 메소드
	public void confirm_pay( ) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String payMethod = request.getParameter("payMethod");
		String company = request.getParameter("company");
		int ticket_id = Integer.parseInt(request.getParameter("ticket_id"));
		String cardnum = request.getParameter("cardnum");
		String telnum = request.getParameter("telnum");
		ticket_dao.deleteEvent(ticket_id);
		ticket_dao.setConfirmTicket(payMethod, company, ticket_id, cardnum, telnum);
		
		List<TicketDTO> list = ticket_dao.getTecketList(id);
		request.setAttribute("list", list);
		
		TicketDTO ticket = ticket_dao.getTicket(ticket_id); 
		request.setAttribute("ticket", ticket);
		
		next_page = "/views/mypage/myReservation.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(next_page);
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}
	
}
