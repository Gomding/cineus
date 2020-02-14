package main;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import faqboard.BoardBean;
import faqboard.BoardDAO;
import faqboard.BoardService;
import faqboard.NoticeBean;

@WebServlet("/index.home")
public class index extends HttpServlet {
	
	NoticeBean noticeBean;
	BoardBean boardBean;
	BoardService boardService;
	BoardDAO boardDAO;
	
	public void init(ServletConfig config) throws ServletException {
		boardService = new BoardService();
		boardBean = new BoardBean();
		boardDAO = new BoardDAO();
		noticeBean = new NoticeBean();
		
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage = "";
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String action = request.getPathInfo();
		System.out.println("action:" + action);
		HttpSession session = request.getSession();
		
		try {
			//공지사항 게시판 최신글 5개를 가져옴
			List<NoticeBean> noticeList = new ArrayList<NoticeBean>();
			noticeList = boardService.getNoticeListTop5(noticeList);
			request.setAttribute("noticeList", noticeList);
			//공지사항 게시판 최신글 5개를 가져옴
		} catch (Exception e) {
			System.out.println("index.java(controller) 에서 발생한 예외" + e);
		}
		
		RequestDispatcher dispatch = request.getRequestDispatcher("/index.jsp");
		dispatch.forward(request, response);
		
	}
	
}
