package faqboard;

import java.security.acl.Group;
import java.util.List;

public class BoardService {

	BoardDAO boardDAO;
	
	public BoardService() {
		boardDAO = new BoardDAO();
	}
	
	public int getCount() {
		int count = boardDAO.getBoardCount();
		return count;
	}
	
	public List<BoardBean> getFAQList(List<BoardBean> boardList, int startRow) {
		
		boardList = boardDAO.getFQABoard(boardList, startRow);		
		
		return boardList;
		
	}
	
	public List<BoardBean> getsearchList(List<BoardBean> boardList, int startRow, String searchVal, String selectVal) {
		
		boardList = boardDAO.getsearchList(boardList, startRow, searchVal, selectVal);		
		
		return boardList;
		
	}
	
	public int getsearchCount(String searchVal, String selectVal) {
		int count = boardDAO.getCountsearchList(searchVal, selectVal);
		return count;
	}
	
	public List<NoticeBean> getNoticeListTop5(List<NoticeBean> noticeList) {
		noticeList = boardDAO.getNoticeListTop5(noticeList);
		
		return noticeList;
	}
	
	public List<NoticeBean> getNoticeList(List<NoticeBean> noticeList, int startRow) {
		noticeList = boardDAO.getNoticeList(noticeList, startRow);
		
		return noticeList;
	}
	
	public int getNoticeCount() {
		int count = boardDAO.getNoticeCount();
		return count;
	}
	
	public int getLocationCount() {
		int locationCount = boardDAO.getLocationCount();
		return locationCount;
	}
	
	public List<NoticeBean> getLocationList(List<NoticeBean> locationList, int startRow) {
		locationList = boardDAO.getLocationList(locationList, startRow);
		
		return locationList;
	}
	
	public List<NoticeBean> getAllSearchList(List<NoticeBean> noticeList, int startRow, String searchVal) {
		noticeList = boardDAO.getAllSearchList(noticeList, startRow, searchVal);
		
		return noticeList;
	}
	
	public int getAllSearchCount(String searchVal) {
		int count = boardDAO.getAllSearchCount(searchVal);
		return count;
	}
	
	public int getLocationSearchCount(String searchVal, String selectVal, String cinemaSelectVal) {
		int locationCount = boardDAO.getLocationSearchCount(searchVal, selectVal, cinemaSelectVal);
		return locationCount;
	}
	
	public List<NoticeBean> getLocationSearch(List<NoticeBean> locationList, int startRow, String searchVal, String selectVal, String cinemaSelectVal) {
		locationList = boardDAO.getLocationSearch(locationList, startRow, searchVal, selectVal, cinemaSelectVal);
		
		return locationList;
	}
	
	public NoticeBean getNoticeContent(NoticeBean noticeContent, int num) {
		
		noticeContent = boardDAO.getNoticeContent(noticeContent, num);
		
		return noticeContent;
	}
	
	public NoticeBean getNextNoticeContent(NoticeBean nextNoticeContent, int num, String location) {
		nextNoticeContent = boardDAO.getNextNoticeContent(nextNoticeContent, num, location);
		
		return nextNoticeContent;
	}
	
	public NoticeBean getPrevNoticeContent(NoticeBean prevNoticeContent, int num, String location) {
		prevNoticeContent = boardDAO.getPrevNoticeContent(prevNoticeContent, num, location);
		
		return prevNoticeContent;
	}
	
	public void write1on1(String id, String name, String telnum, String email, String location, String question_type, String subject, String content, String fileimg) {
		boardDAO.write1on1(id, name, telnum, email, location, question_type, subject, content, fileimg);
	}
	
	public void writeGroupRent(String id, String group_rent_date, String group_rent_time, String group_rent_film, String group_rent_totalnum, String name, String telnum, String email, String location, String subject, String content) {
		boardDAO.writeGroupRent(id, group_rent_date, group_rent_time, group_rent_film, group_rent_totalnum, name, telnum, email, location, subject, content);
	}
	
	public void writeLostArticle(String id,String date,String time,String film,String name,String telnum,String email,String location,String subject,String content) {
		
		boardDAO.writeLostArticle(id, date, time, film, name, telnum, email, location, subject, content);

	}
	
	public int getLostArticleCount(String searchVal, String selectVal, String cinemaSelectVal, String rep_lost_article) {
		
		int count = boardDAO.getLostArticleCount(searchVal, selectVal, cinemaSelectVal, rep_lost_article);
		return count;
	}
	
	public List<LostArticleBean> getLostArticleSearch(List<LostArticleBean> lostArticleList,int startRow,String searchVal,String selectVal,String cinemaSelectVal, String repSelectVal) {
		lostArticleList = boardDAO.getLostArticleSearch(lostArticleList, startRow, searchVal, selectVal, cinemaSelectVal, repSelectVal);
		return lostArticleList;
	}
	
	public LostArticleBean getLostArticleContent(LostArticleBean lostArticleContent, int lost_article_num) {
		
		lostArticleContent = boardDAO.getLostArticleContent(lostArticleContent, lost_article_num);
		
		return lostArticleContent;
	}
	
	public int getMy1on1Count(String id, String searchVal, String repSelectVal) {
		
		int count = boardDAO.getMy1on1Count(id, searchVal, repSelectVal);
		
		return count;
	}
	
	public List<MtmboardBean> getMy1on1List(List<MtmboardBean> my1on1List,int startRow,String searchVal,String repSelectVal, String id) {
		
		my1on1List = boardDAO.getMy1on1List(my1on1List, startRow, searchVal, repSelectVal, id);
		
		return my1on1List;
	}
	
	public int getMyGroupRentCount(String id, String searchVal, String repSelectVal) {
		
		int count = boardDAO.getMyGroupRentCount(id, searchVal, repSelectVal);
		
		return count;
	}
	
	public List<GroupRentBean> getMyGroupRentList(List<GroupRentBean> myGroupRentList, int startRow, String searchVal, String repSelectVal, String id) {
		
		myGroupRentList = boardDAO.getMyGroupRentList(myGroupRentList, startRow, searchVal, repSelectVal, id);
		
		return myGroupRentList;
	}
	
	public int getMyLostArticleCount(String id, String searchVal, String repSelectVal) {
		
		int count = boardDAO.getMyLostArticleCount(id, searchVal, repSelectVal);
		
		
		return count;
	}
	
	public List<LostArticleBean> getMyLostArticleList(List<LostArticleBean> myLostArticleList, int startRow, String searchVal, String repSelectVal, String id) {
		
		myLostArticleList = boardDAO.getMyLostArticleList(myLostArticleList, startRow, searchVal, repSelectVal, id);
		
		return myLostArticleList;
	}
	
	public MtmboardBean getMy1on1Content(MtmboardBean my1on1Content, int num) {
		
		my1on1Content = boardDAO.getMy1on1Content(my1on1Content, num);
		
		return my1on1Content;
		
	}
	
	public GroupRentBean getGroupRentContent(GroupRentBean groupRentContent, int num) {
		
		groupRentContent = boardDAO.getGroupRentContent(groupRentContent, num);
		
		return groupRentContent;
	}
	
}
