package Nonmember;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebServlet("/nonmember/*")
public class NonmemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	NonmemberDAO nonmem_dao;
	
	HttpServletRequest request;
	HttpServletResponse response;
	
	String next_page;	//initial value : null
	
	@Override
	public void init() throws ServletException {
		nonmem_dao=new NonmemberDAO();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.request=req;
		this.response=resp;
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String action=request.getPathInfo().substring(1);
		
		switch(action){
		case "join_ajax.do": //ajax
			join_ajax();
			break;
		case "login.do": //ajax
			login();
			break;
		}//switch-case 끝
	}// doHandle() 끝

	
	
	
	private void login() {
		// TODO Auto-generated method stub
		PrintWriter out;
		
		int result=nonmem_dao.login(
				/*request.getParameter("i_name"), */
				request.getParameter("i_pass"), 
				Integer.parseInt(request.getParameter("i_phone")), 
				Integer.parseInt(request.getParameter("i_birth"))
		);
		//////////////////////이 부분은 시간나면 구현하기
		if(result==1){
			System.out.println("로그인 성공-이제 주문내역 출력해야 한다.");
			//로그인 성공
		}
		else if(result==0){
			System.out.println("비밀번호 틀렸다.");
			//비밀번호 틀렸다
			try {
				out = response.getWriter();
				String str = "<script>alert('비밀번호가 틀렸습니다')</script>";
				out.print(str);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			/*next_page="/views/custom/movieInfo.jsp";*/
		}
		else{
			//실패
			System.out.println("오류났다..");
		}
	}

	private void join_ajax() {
		/*System.out.println(request.getParameter("i_name"));
		System.out.println(request.getParameter("i_pass_1"));
		System.out.println(request.getParameter("i_phone"));
		System.out.println(request.getParameter("i_birth"));*/
		try {
			
			boolean result = nonmem_dao.join(
					request.getParameter("i_name"),
					request.getParameter("i_pass_1"),
					Integer.parseInt(request.getParameter("i_phone")),
					Integer.parseInt(request.getParameter("i_birth"))
			);
			
			PrintWriter out = response.getWriter();
			out.print(result);
			
		} catch (NumberFormatException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	} // join_ajax() 끝
	

}
