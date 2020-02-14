package Customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import movie.MovieDAO;
import movie.MovieDTO;
import movie.MovieLikeDAO;

@WebServlet("/customer/*")
public class CustomerController  extends HttpServlet {
	private static final long serialVersionUID = 1L;

	CustomerDAO dao;
	MovieDAO movie_dao;
	MovieLikeDAO movie_like_dao;
	
	HttpServletRequest request;
	HttpServletResponse response;
	
	String next_page;	//initial value : null
		
	@Override
	public void init() throws ServletException {
		dao=new CustomerDAO();
		movie_like_dao=new MovieLikeDAO();
		movie_dao=new MovieDAO();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doHandle(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doHandle(request, response);
	}

	/****************************************************************************/
	
	public void doHandle(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.request=req;
		this.response=resp;
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String action=request.getPathInfo().substring(1);
		System.out.println(action);
		
		switch(action){
			/*여기서 로그인 로그아웃 사용하지 않음
			member 패키지 사용합니다*/
			case "login.do":
				login();
				break;
			case "logout.do":
				logout();
				break;
			/*사용안함*/
				
			case "mypage.do":
				mypage();
				break;
			case "getMovieLikeList.do":
				getMovieLikeList();
				break;
			case "getAllCustomerList.do": 
				getAllCustomerList();
				break;
				
		} //switch
	}//doHandle() 끝
	
	private void getAllCustomerList() {
		request.setAttribute("list", dao.getAllCustomerList());
		next_page="/views/admin/sendMessage.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(next_page);
		try {
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void login(){
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		
		int result=dao.login(id, pw);
		
		if(result==1){ //로그인성공
			HttpSession session = request.getSession();
			session.setAttribute("id",id);
			next_page=request.getContextPath()+"/index.jsp";
		}
		else{ //로그인실패
			next_page=request.getContextPath()+"/views/customer/login.jsp";
		}
		try {
			response.sendRedirect(next_page);
		} catch (IOException e) {
			e.printStackTrace();
		}
	} //login() 끝
	
	public void logout(){
		HttpSession session = request.getSession();
		session.removeAttribute("id");
		next_page=request.getContextPath()+"/index.jsp";
		try {
			response.sendRedirect(next_page);
		} catch (IOException e) {
			e.printStackTrace();
		}
	} //logout() 끝
	
	public void mypage(){
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		
		next_page="/views/mypage/mypage.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(next_page);
		try {
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void getMovieLikeList(){
		HttpSession session = request.getSession();
		String customer_ID=(String)session.getAttribute("id");
		List<Integer> movie_ID_list; 
			// ㄴ현재 사용자가 
		    //   보고싶어 누른 영화 아이디 목록을 가져온다.
		movie_ID_list=movie_like_dao.getMovieLikeList(customer_ID);
		/*System.out.println(movie_ID_list.toString());*/
		//받아온 영화 아이디에 해당하는 영화정보(MovieDTO)를 가져온다.
		
		List<MovieDTO> movie_list=new ArrayList<MovieDTO>();
		for(Integer m_id:movie_ID_list){
			movie_list.add(movie_dao.getMovieDTO(m_id));
		}
		
		request.setAttribute("list", movie_list);
		//페이지 이동
		/*next_page="/views/mypage/movieLike.jsp";*/
		next_page = "/intro/fa_5.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(next_page);
		try {
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
