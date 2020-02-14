package faqboard;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/customerboard/*")
public class BoardController extends HttpServlet{
	
	/**
	 * 
	 */
	NoticeBean noticeBean;
	BoardBean boardBean;
	BoardService boardService;
	BoardDAO boardDAO;
	MtmboardBean mtmboardBean;
	LostArticleBean lostArticleBean;
	
	public void init(ServletConfig config) throws ServletException {
		boardService = new BoardService();
		boardBean = new BoardBean();
		boardDAO = new BoardDAO();
		noticeBean = new NoticeBean();
		mtmboardBean = new MtmboardBean();
		lostArticleBean = new LostArticleBean();
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
		doHandle(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage = "";
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String action = request.getPathInfo();
		System.out.println("action:" + action);
		HttpSession session = request.getSession();
		
		try {
			List<BoardBean> boardList = new ArrayList<BoardBean>();
			List<NoticeBean> noticeList = new ArrayList<NoticeBean>();
			List<NoticeBean> locationList = new ArrayList<NoticeBean>();
			List<LostArticleBean> lostArticleList = new ArrayList<LostArticleBean>();
			
			if(action == null){ // 고객센터 메인페이지 이
				int startRow = 0;
				boardList = boardService.getFAQList(boardList, startRow);
				noticeList = boardService.getNoticeListTop5(noticeList);
				request.setAttribute("boardList", boardList);
				noticeList = boardService.getNoticeListTop5(noticeList);
				request.setAttribute("noticeList", noticeList);
				nextPage = "/customboard/customcenter.jsp";
			}else if(action.equals("/customcenter.do")) { // 고객센터 메인페이지 이동
				int startRow = 0;
				boardList = boardService.getFAQList(boardList, startRow);
				noticeList = boardService.getNoticeListTop5(noticeList);
				request.setAttribute("noticeList", noticeList);
				request.setAttribute("boardList", boardList);
				
				nextPage = "/customboard/customcenter.jsp";
			}
			//200131 JIN 추가
			else if(action.equals("/getNoticeListTop5ajax.do")) { // ajax
				noticeList = boardService.getNoticeListTop5(noticeList);
				try {
					PrintWriter out = response.getWriter();
					Gson gson =  new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
					out.print(gson.toJson(noticeList));
				} catch (IOException e) {
					e.printStackTrace();
				}
				return;
			//200131 JIN 추가 끝
			}
			else if(action.equals("/FAQcenter.do")) { //FAQ게시판으로 이동
				String _pageNum = request.getParameter("pageNum");
				int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
				int count = boardService.getCount();
				int pageSize = 10;
				int startRow = (pageNum - 1) * pageSize;
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				boardList = boardService.getFAQList(boardList, startRow);
				request.setAttribute("boardList", boardList);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("pageNum", pageNum);
				nextPage = "/customboard/FAQcenter.jsp";
			}else if(action.equals("/searchList.do")) { // FAQ게시판 검색
				String searchVal = request.getParameter("searchVal"); // FAQcenter.jsp 페이지에서 검색한 값
				String selectVal = request.getParameter("selectVal"); // FAQcenter.jsp 페이지에서 검색 카테고리 선택값
				String _pageNum = request.getParameter("pageNum");
				int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
				int pageSize = 10;
				int startRow = (pageNum - 1) * pageSize;
				boardList = boardService.getsearchList(boardList, startRow, searchVal, selectVal);
				int count = boardService.getsearchCount(searchVal, selectVal);
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				request.setAttribute("boardList", boardList);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("pageNum", pageNum);
				nextPage = "/customboard/FAQcenter.jsp";
			}else if(action.equals("/noticecenter.do")) { // 공지사항 게시판의 전체 영화관 공지게시판으로 이동하는 주소
				String _pageNum = request.getParameter("pageNum");
				int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
				int count = boardService.getNoticeCount();
				int locationCount = boardService.getLocationCount();
				int pageSize = 10;
				int pageBlock = 10;
				int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1:0) * pageBlock + 1);
				int endPage = startPage + pageBlock - 1;
				int locationEndPage = startPage + pageBlock - 1;
				int startRow = (pageNum - 1) * pageSize;
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				if(endPage > pageCount) {
					endPage = pageCount;
				}
				int locationPageCount = locationCount / pageSize + (locationCount % pageSize == 0 ? 0 : 1);
				if(locationEndPage > locationPageCount) {
					locationEndPage = locationPageCount;
				}
				noticeList = boardService.getNoticeList(noticeList, startRow);
				locationList = boardService.getLocationList(locationList, startRow);
				request.setAttribute("noticeList", noticeList);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				request.setAttribute("loactionList", locationList);
				request.setAttribute("locationPageCount", locationPageCount);
				request.setAttribute("locationEndPage", locationEndPage);
				nextPage = "/customboard/noticecenter.jsp";
			}else if(action.equals("/locationnotice.do")) { // 공지사항 게시판의 영화관별 공지로 가는 주소
				String _pageNum = request.getParameter("pageNum");
				int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
				int count = boardService.getNoticeCount();
				int locationCount = boardService.getLocationCount();
				int pageSize = 10;
				int pageBlock = 10;
				int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1:0) * pageBlock + 1);
				int endPage = startPage + pageBlock - 1;
				int locationEndPage = startPage + pageBlock - 1;
				int startRow = (pageNum - 1) * pageSize;
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				if(endPage > pageCount) {
					endPage = pageCount;
				}
				int locationPageCount = locationCount / pageSize + (locationCount % pageSize == 0 ? 0 : 1);
				if(locationEndPage > locationPageCount) {
					locationEndPage = locationPageCount;
				}
				noticeList = boardService.getNoticeList(noticeList, startRow);
				locationList = boardService.getLocationList(locationList, startRow);
				request.setAttribute("noticeList", noticeList);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				request.setAttribute("loactionList", locationList);
				request.setAttribute("locationPageCount", locationPageCount);
				request.setAttribute("locationEndPage", locationEndPage);
				nextPage = "/customboard/noticecenter.jsp";
			}else if(action.equals("/allNoticeSearch.do")) { // 공지사항 전체공지에 대한 검색이동
				String searchVal = request.getParameter("searchVal"); // FAQcenter.jsp 페이지에서 검색한 값
				String _pageNum = request.getParameter("pageNum");
				int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
				int count = boardService.getAllSearchCount(searchVal);
				int locationCount = boardService.getLocationCount();
				int pageSize = 10;
				int pageBlock = 10;
				int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1:0) * pageBlock + 1);
				int endPage = startPage + pageBlock - 1;
				int locationEndPage = startPage + pageBlock - 1;
				int startRow = (pageNum - 1) * pageSize;
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				if(endPage > pageCount) {
					endPage = pageCount;
				}
				int locationPageCount = locationCount / pageSize + (locationCount % pageSize == 0 ? 0 : 1);
				if(locationEndPage > locationPageCount) {
					locationEndPage = locationPageCount;
				}
				noticeList = boardService.getAllSearchList(noticeList, startRow, searchVal);
				request.setAttribute("noticeList", noticeList);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				request.setAttribute("loactionList", locationList);
				request.setAttribute("locationPageCount", locationPageCount);
				request.setAttribute("locationEndPage", locationEndPage);
				nextPage = "/customboard/noticecenter.jsp";
				
			}else if(action.equals("/locationSearch.do")) { // 공지사항 게시판 지역 및 영화관 검색 이동
				String searchVal = request.getParameter("searchVal"); // FAQcenter.jsp 페이지에서 검색한 값
				String selectVal = request.getParameter("selectVal"); // FAQcenter.jsp 페이지에서 검색 카테고리 선택값
				String cinemaSelectVal = request.getParameter("cinemaSelectVal");
				String _pageNum = request.getParameter("pageNum");
				int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
				int count = boardService.getAllSearchCount(searchVal);
				int locationCount = boardService.getLocationSearchCount(searchVal, selectVal, cinemaSelectVal);
				int pageSize = 10;
				int pageBlock = 10;
				int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1:0) * pageBlock + 1);
				int endPage = startPage + pageBlock - 1;
				int locationEndPage = startPage + pageBlock - 1;
				int startRow = (pageNum - 1) * pageSize;
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				if(endPage > pageCount) {
					endPage = pageCount;
				}
				int locationPageCount = locationCount / pageSize + (locationCount % pageSize == 0 ? 0 : 1);
				if(locationEndPage > locationPageCount) {
					locationEndPage = locationPageCount;
				}
				locationList = boardService.getLocationSearch(locationList, startRow, searchVal, selectVal, cinemaSelectVal);
				request.setAttribute("noticeList", noticeList);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				request.setAttribute("loactionList", locationList);
				request.setAttribute("locationPageCount", locationPageCount);
				request.setAttribute("locationEndPage", locationEndPage);
				nextPage = "/customboard/noticecenter.jsp";
			}else if(action.equals("/readNotice.do")) { // 공지사항게시판 상세보기
				String _pageNum = request.getParameter("pageNum");
				String _num = request.getParameter("num");
				String location = request.getParameter("location");
				int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
				int num = Integer.parseInt(_num);
				System.out.println("location : " + location);
				NoticeBean noticeContent = new NoticeBean();
				NoticeBean nextNoticeContent = new NoticeBean();
				NoticeBean prevNoticeContent = new NoticeBean();
				noticeContent = boardService.getNoticeContent(noticeContent, num);
				nextNoticeContent = boardService.getNextNoticeContent(nextNoticeContent, num, location);
				prevNoticeContent = boardService.getPrevNoticeContent(prevNoticeContent, num, location);
				request.setAttribute("noticeContent", noticeContent);
				request.setAttribute("nextNoticeContent", nextNoticeContent);
				request.setAttribute("prevNoticeContent", prevNoticeContent);
				request.setAttribute("pageNum", pageNum);
				nextPage = "/customboard/readNotice.jsp";
			}else if(action.equals("/1on1center.do")) { // 1:1 문의 게시판
				String id = (String)session.getAttribute("id");
				if(id == null || id.equals("")) {
					nextPage = "/member/login.jsp";
				}else {
					
					nextPage = "/customboard/1on1center.jsp";
				}
			}else if (action.equals("/write1on1.do")) {
				String id = (String)session.getAttribute("id");
				ServletContext ctx = session.getServletContext();
				String savePath = ctx.getRealPath("/upload");
				System.out.println(savePath);
				int maxSize = 1024*1024*25; // 25MB

				File dir = new File(savePath);
				if(!dir.isDirectory()) {
					dir.mkdir();
				}
				
				MultipartRequest mr = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
				
				String name = mr.getParameter("name");
				String m1 = mr.getParameter("mobile1");
				String m2 = mr.getParameter("mobile2");
				String m3 = mr.getParameter("mobile3");
				String telnum = m1 + "-" + m2 + "-" + m3;
				String email = mr.getParameter("email"); // 1:1 문의 작성자 이메일
				String lc1 = mr.getParameter("location1");
				String lc2 = mr.getParameter("location2");
				String location = lc1 + "/" + lc2;					// 1:1 문의 작성자 지역
				String question_type = mr.getParameter("question_type"); //1:1 문의 유형
				String subject = mr.getParameter("title"); // 1:1문의 제목
				String content = mr.getParameter("content"); // 1:1문의 글내용
				String fileimg = mr.getFilesystemName("file");

				boardService.write1on1(id, name, telnum, email, location, question_type, subject, content, fileimg);
				
				nextPage = "/customboard/1on1center.jsp";
			}else if(action.equals("/groupRent_center.do")) {
				
				
				nextPage = "/customboard/groupRent_center.jsp";
				
			}else if(action.equals("/write_groupRentCenter.do")) {
				String id = (String)session.getAttribute("id");
				
				String group_rent_date = request.getParameter("group_rent_date");
				String group_rent_time = request.getParameter("rent_time");
				String group_rent_film = request.getParameter("group_rent_film");
				String group_rent_totalnum = request.getParameter("group_rent_totalnum");
				String name = request.getParameter("name");
				String m1 = request.getParameter("mobile1");
				String m2 = request.getParameter("mobile2");
				String m3 = request.getParameter("mobile3");
				String telnum = m1 + "-" + m2 + "-" + m3;
				String email = request.getParameter("email"); // 1:1 문의 작성자 이메일
				String lc1 = request.getParameter("location1");
				String lc2 = request.getParameter("location2");
				String location = lc1 + "/" + lc2;					// 1:1 문의 작성자 지역
				String subject = request.getParameter("title"); // 1:1문의 제목
				String content = request.getParameter("content"); // 1:1문의 글내용
				
				boardService.writeGroupRent(id, group_rent_date, group_rent_time, group_rent_film, group_rent_totalnum, name, telnum, email, location, subject, content);

				
				nextPage = "/customboard/groupRent_center.jsp";
			}else if(action.equals("/write_lostArticle.do")) {
				
				
				nextPage = "/customboard/write_lostArticle.jsp";
			}else if(action.equals("/write_lostArticle_content.do")) {
				String id = (String)session.getAttribute("id");
				
				String date = request.getParameter("date");
				String hour = request.getParameter("hour");
				String minute = request.getParameter("minute");
				String time = hour + " : " + minute; 
				String film = request.getParameter("film");
				String name = request.getParameter("name");
				String m1 = request.getParameter("mobile1");
				String m2 = request.getParameter("mobile2");
				String m3 = request.getParameter("mobile3");
				String telnum = m1 + "-" + m2 + "-" + m3;
				String email = request.getParameter("email"); // 1:1 문의 작성자 이메일
				String lc1 = request.getParameter("location1");
				String lc2 = request.getParameter("location2");
				String location = lc1 + "/" + lc2;					// 1:1 문의 작성자 지역
				String subject = request.getParameter("title"); // 1:1문의 제목
				String content = request.getParameter("content"); // 1:1문의 글내용
				
				boardService.writeLostArticle(id, date, time, film, name, telnum, email, location, subject, content);
				
				nextPage = "/customerboard/lostArticle_center.do";
			}else if(action.equals("/lostArticle_center.do")) {
				String _searchVal = request.getParameter("searchVal"); // FAQcenter.jsp 페이지에서 검색한 값
				String searchVal = (_searchVal == null)? "":_searchVal;
				String _selectVal = request.getParameter("selectVal"); // FAQcenter.jsp 페이지에서 검색 카테고리 선택값
				String selectVal = (_selectVal == null)? "":_selectVal;
				String _cinemaSelectVal = request.getParameter("cinemaSelectVal");
				String cinemaSelectVal = (_cinemaSelectVal == null)? "":_cinemaSelectVal;
				String _repSelectVal = request.getParameter("repSelectVal");
				String repSelectVal = (_repSelectVal == null)? "":_repSelectVal;
				String _pageNum = request.getParameter("pageNum");
				int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
				int count = boardService.getLostArticleCount(searchVal, selectVal, cinemaSelectVal, repSelectVal);
				int pageSize = 10;
				int pageBlock = 10;
				int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1:0) * pageBlock + 1);
				int endPage = startPage + pageBlock - 1;
				int startRow = (pageNum - 1) * pageSize;
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				if(endPage > pageCount) {
					endPage = pageCount;
				}
				
				lostArticleList = boardService.getLostArticleSearch(lostArticleList, startRow, searchVal, selectVal, cinemaSelectVal, repSelectVal);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				request.setAttribute("lostArticleList", lostArticleList);
				request.setAttribute("count", count);
				nextPage = "/customboard/lostArticle_center.jsp";
			}else if(action.equals("/read_lostArticle.do")) {
				String _pageNum = request.getParameter("pageNum");
				String _num = request.getParameter("lost_article_num");
				int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
				int lost_article_num = Integer.parseInt(_num);
				LostArticleBean lostArticleContent = new LostArticleBean();
				lostArticleContent = boardService.getLostArticleContent(lostArticleContent, lost_article_num);
				request.setAttribute("lostArticleContent", lostArticleContent);
				request.setAttribute("pageNum", pageNum);
				
				nextPage = "/customboard/read_lostArticle.jsp";
			}else if(action.equals("/my1on1.do")) {
				List<MtmboardBean> my1on1List = new ArrayList<MtmboardBean>();
				String id = (String)session.getAttribute("id");
				String _searchVal = request.getParameter("searchVal"); // FAQcenter.jsp 페이지에서 검색한 값
				String searchVal = (_searchVal == null)? "":_searchVal;
				String _repSelectVal = request.getParameter("repSelectVal");
				String repSelectVal = (_repSelectVal == null)? "":_repSelectVal;
				String _pageNum = request.getParameter("pageNum");
				
				System.out.println("searchVal :" + searchVal);
				System.out.println("repSelectval :" + repSelectVal);
				int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
				int count = boardService.getMy1on1Count(id, searchVal, repSelectVal);
				int pageSize = 10;
				int pageBlock = 10;
				int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1:0) * pageBlock + 1);
				int endPage = startPage + pageBlock - 1;
				int startRow = (pageNum - 1) * pageSize;
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				if(endPage > pageCount) {
					endPage = pageCount;
				}
				
				my1on1List = boardService.getMy1on1List(my1on1List, startRow, searchVal, repSelectVal, id);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				request.setAttribute("my1on1List", my1on1List);
				request.setAttribute("count", count);
				nextPage = "/intro/fa_6.jsp";
				
			}else if(action.equals("/myRent.do")) {
				List<GroupRentBean> myGroupRentList = new ArrayList<GroupRentBean>();
				String id = (String)session.getAttribute("id");
				String _searchVal = request.getParameter("searchVal"); // FAQcenter.jsp 페이지에서 검색한 값
				String searchVal = (_searchVal == null)? "":_searchVal;
				String _repSelectVal = request.getParameter("repSelectVal");
				String repSelectVal = (_repSelectVal == null)? "":_repSelectVal;
				String _pageNum = request.getParameter("pageNum");
				
				System.out.println("searchVal : " + searchVal);
				System.out.println("repSelectval : " + repSelectVal);
				int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
				int count = boardService.getMyGroupRentCount(id, searchVal, repSelectVal);
				int pageSize = 10;
				int pageBlock = 10;
				int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1:0) * pageBlock + 1);
				int endPage = startPage + pageBlock - 1;
				int startRow = (pageNum - 1) * pageSize;
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				if(endPage > pageCount) {
					endPage = pageCount;
				}
				
				myGroupRentList = boardService.getMyGroupRentList(myGroupRentList, startRow, searchVal, repSelectVal, id);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				request.setAttribute("myGroupRentList", myGroupRentList);
				request.setAttribute("count", count);
				
				nextPage = "/intro/fa_6.jsp";
			}else if(action.equals("/mylostarticle.do")) {
				List<LostArticleBean> myLostArticleList = new ArrayList<LostArticleBean>();
				String id = (String)session.getAttribute("id");
				String _searchVal = request.getParameter("searchVal"); // FAQcenter.jsp 페이지에서 검색한 값
				String searchVal = (_searchVal == null)? "":_searchVal;
				String _repSelectVal = request.getParameter("repSelectVal");
				String repSelectVal = (_repSelectVal == null)? "":_repSelectVal;
				String _pageNum = request.getParameter("pageNum");
				
				System.out.println("searchVal : " + searchVal);
				System.out.println("repSelectval : " + repSelectVal);
				int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
				int count = boardService.getMyLostArticleCount(id, searchVal, repSelectVal);
				int pageSize = 10;
				int pageBlock = 10;
				int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1:0) * pageBlock + 1);
				int endPage = startPage + pageBlock - 1;
				int startRow = (pageNum - 1) * pageSize;
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				if(endPage > pageCount) {
					endPage = pageCount;
				}
				
				myLostArticleList = boardService.getMyLostArticleList(myLostArticleList, startRow, searchVal, repSelectVal, id);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				request.setAttribute("myLostArticleList", myLostArticleList);
				request.setAttribute("count", count);
				
				nextPage = "/intro/fa_6.jsp";
			}else if(action.equals("/read_my1on1.do")) {
				String _pageNum = request.getParameter("pageNum");
				String _num = request.getParameter("oneonone_id");
				int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
				int num = Integer.parseInt(_num);
				MtmboardBean my1on1Content = new MtmboardBean();
				my1on1Content = boardService.getMy1on1Content(my1on1Content, num);
				request.setAttribute("my1on1Content", my1on1Content);
				request.setAttribute("pageNum", pageNum);
				
				nextPage = "/intro/read_myCenter.jsp";
			}else if(action.equals("/read_myRent.do")) {
				String _pageNum = request.getParameter("pageNum");
				String _num = request.getParameter("group_rent_num");
				int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
				int num = Integer.parseInt(_num);
				GroupRentBean groupRentContent = new GroupRentBean();
				groupRentContent = boardService.getGroupRentContent(groupRentContent, num);
				request.setAttribute("groupRentContent", groupRentContent);
				request.setAttribute("pageNum", pageNum);
				
				nextPage = "/intro/read_myCenter.jsp";
			}else if(action.equals("/read_mylostarticle.do")) {
				String _pageNum = request.getParameter("pageNum");
				String _num = request.getParameter("lost_article_num");
				int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
				int num = Integer.parseInt(_num);
				LostArticleBean lostArticleContent = new LostArticleBean();
				lostArticleContent = boardService.getLostArticleContent(lostArticleContent, num);
				request.setAttribute("lostArticleContent", lostArticleContent);
				request.setAttribute("pageNum", pageNum);
				
				nextPage = "/intro/read_myCenter.jsp";
			}
			
			if(action != null) {
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
