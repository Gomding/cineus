package schedule;

import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.temporal.IsoFields;
import java.time.temporal.WeekFields;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Theater.TheaterDAO;
import Theater.TheaterDTO;
import movie.MovieDAO;
import movie.MovieDTO;

/**
 * Servlet implementation class ScheduleController
 */
@WebServlet("/schedule/*")
public class ScheduleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	scheduleDAO schedule_dao;
	MovieDAO movie_dao;
	TheaterDAO theater_dao;
	String next_page;
	HttpServletRequest request;
	HttpServletResponse response;
	
	@Override
	public void init() throws ServletException {
		schedule_dao=new scheduleDAO();
		movie_dao=new MovieDAO();
		theater_dao=new TheaterDAO();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doHandle(request, response);
	}
	
	public void doHandle(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		this.request=req;
		this.response=resp;
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String action=request.getPathInfo().substring(1);
		
		switch(action){
		case "getSchedule.do":
			getSchedule();
			break;
		case "getSchedule_screen.do":
			getSchedule_screen();
			break;
		case "getSchedule_movie.do":
			getSchedule_movie();
			break;
		}
	}/*doHandle 끝*/
	
	
	
	private void getSchedule(){
		//전달받는 값(스케쥴ID)
		int s_id=-1;
		if(request.getParameter("s_id")==null || request.getParameter("s_id")==""){
		}else{
			s_id=Integer.parseInt(request.getParameter("s_id"));
		}
		
		if(s_id!=-1){
			/*스케쥴을 검색한다.*/
			scheduleDTOJ s=schedule_dao.getSchedule(s_id);
			request.setAttribute("s", s);
		}
		else{
			//할일 없다
		}
		String lockSeats = schedule_dao.getTicket_seat(s_id);
		
		request.setAttribute("lockSeats", lockSeats);
		// view 포워드
		next_page="/views/reservation/reservation_p1.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(next_page);
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private void getSchedule_movie() {
		//전달받는 값 (영화 아이디, 선택한 날짜)처리
		int m_id=-1;
		LocalDate date=LocalDate.now(); //오늘 날짜로 지정
		
		if(request.getParameter("movie_ID")==null || request.getParameter("movie_ID")==""){
		}else{
			m_id=Integer.parseInt(request.getParameter("movie_ID"));
		}
		if(request.getParameter("date")==null){
		}else{
			//입력된 날짜 데이터는 "2016-08-16" 형식임.
			date=LocalDate.parse(request.getParameter("date"));
		}
		
		
		
		//예매가능한(상영중이거나 상영예정인) 영화목록
		List<MovieDTO> m_list=movie_dao.getMoviesListAll();
		request.setAttribute("m_list", m_list);
		
		if(m_id!=-1){ /*현재 선택된 영화가 있으면*/
			/*스케쥴을 검색한다.*/
			/*List<scheduleDTO> list=schedule_dao.getScheduleListByMovie(m_id, date);*/
			List<scheduleDTOJ> list=schedule_dao.getScheduleListByMovieJ(m_id, date);
			request.setAttribute("s_list", list);
			request.setAttribute("movie_ID", m_id); //그대로 되돌려준다
		}
		else{
			//할일 없다
		}
		request.setAttribute("date", date);//그대로 되돌려준다
		
		// view 포워드
		next_page="/views/movie/movieSchedule.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(next_page);
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	public void getSchedule_screen(){
		int s_idx=Integer.parseInt(request.getParameter("v_screen"));
		int t_idx=Integer.parseInt(request.getParameter("v_theater")); 
		int l_idx=Integer.parseInt(request.getParameter("v_location"));
		int year;
		int week;
		
		if(request.getParameter("v_year")==null){
			year=ZonedDateTime.now(ZoneId.of("Asia/Seoul")).getYear() ;
		}
		else{
			year=Integer.parseInt(request.getParameter("v_year"));
			//2020
		}
		
		if(request.getParameter("v_week")==null){
			week=ZonedDateTime.now(ZoneId.of("Asia/Seoul")).get(IsoFields.WEEK_OF_WEEK_BASED_YEAR);
			//2 (현재 2020 01 10)
		}
		else{
			week=Integer.parseInt(request.getParameter("v_week"));
			//예외처리. 클라이언트측에서 예외값이 넘어올 수 있는 상태임.
			//(1~그 해의 주 수 범위를 벗어나는 숫자처리)
			if (week==0){ //작년으로 넘어가야 하는 경우
				year=year-1;
				LocalDate ld=LocalDate.of(year, 12, 31);
				if(ld.getDayOfWeek().getValue()==6){//말일이 토요일이면
					week =ld.get(WeekFields.ISO.weekOfYear());
				}
				else{ //말일이 토요일이 아니면(12월 마지막주와 1월 첫주가 겹치면)
					week =ld.get(WeekFields.ISO.weekOfYear())-1;
				}
			}
			else if(week==IsoFields.WEEK_OF_WEEK_BASED_YEAR.rangeRefinedBy(LocalDate.of(year, 12, 31)).getMaximum()+1){ 
				//내년으로 넘어가야 하는 경우
				year=year+1;
				LocalDate ld=LocalDate.of(year, 1, 1);
				if(ld.getDayOfWeek().getValue()==0){//첫날이 일요일이면
					week=1;
				}
				else{ //첫날이 일요일이 아니면(12월 마지막주와 1월 첫주가 겹치면)
					week=2;
				}
			}
		}
		List<scheduleDTO> list=schedule_dao.getScheduleListByScreen(s_idx, t_idx, l_idx, year, week);
		request.setAttribute("s_list", list);
		
		//영화 정보도 같이 넘겨준다.
		Map<Integer,MovieDTO> movie_info_map=new HashMap<>();
		for(scheduleDTO dto: list){
			int id=dto.getMovie_ID();
			movie_info_map.put(id,movie_dao.getMovieDTO(id));
		}
		request.setAttribute("movie_info_map", movie_info_map);
		
		//극장과 관 정보
		TheaterDTO t_dto=theater_dao.getTheaterByIndex(t_idx, l_idx);
		request.setAttribute("location_idx",l_idx); //받은값 그대로 돌려줌
		request.setAttribute("theater_info",t_dto);
		request.setAttribute("theater_idx", t_idx);
		/*System.out.println("확인 : "+t_dto.toString());*/
		request.setAttribute("screen_idx",s_idx); //받은값 그대로 돌려줌
		request.setAttribute("v_year", year); //받은 값 그대로
		request.setAttribute("v_week", week); //받은 값 그대로
		
		// view 포워드
		next_page="/views/admin/admin_schedule.jsp";
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
