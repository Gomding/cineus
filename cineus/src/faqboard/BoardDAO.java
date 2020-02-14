package faqboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import faqboard.BoardBean;

public class BoardDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql = "";
	
	// 커넥션 풀로부터 커넥션을 얻기위한 메소드
	private Connection getConnection() throws Exception{
		con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/CineUs");
		con = ds.getConnection();
		
		return con;
	} // getConnection() 메소드 끝
	
	 public void disconnect() throws SQLException {
		    if(rs != null) {
		      rs.close();
		    }
		    if(pstmt != null) pstmt.close();
		    if(con != null) con.close();
	 }
	 
	 public GroupRentBean getGroupRentContent(GroupRentBean groupRentContent, int num) {
		 

		 try {
				// 커넥션풀로 부터 커넥션 얻기(DB접속)
				con = getConnection();
				// SQL SELECT
				sql = "select * from group_rent where group_rent_num = ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					groupRentContent.setCustomer_id(rs.getString("customer_id"));
					groupRentContent.setGroup_rent_content(rs.getString("group_rent_content"));
					groupRentContent.setGroup_rent_date(rs.getString("group_rent_date"));
					groupRentContent.setGroup_rent_email(rs.getString("group_rent_email"));
					groupRentContent.setGroup_rent_film(rs.getString("group_rent_film"));
					groupRentContent.setGroup_rent_location(rs.getString("group_rent_location"));
					groupRentContent.setGroup_rent_name(rs.getString("group_rent_name"));
					groupRentContent.setGroup_rent_num(rs.getInt("group_rent_num"));
					groupRentContent.setGroup_rent_rep_content(rs.getString("group_rent_rep_content"));
					groupRentContent.setGroup_rent_subject(rs.getString("group_rent_subject"));
					groupRentContent.setGroup_rent_telnum(rs.getString("group_rent_telnum"));
					groupRentContent.setGroup_rent_time(rs.getString("group_rent_time"));
					groupRentContent.setGroup_rent_totalnum(rs.getString("group_rent_time"));
					groupRentContent.setGroup_rent_totalnum(rs.getString("group_rent_totalnum"));
					groupRentContent.setGroup_rent_writeDate(rs.getDate("group_rent_writeDate"));
					groupRentContent.setRep_group_rent(rs.getString("rep_group_rent"));
					
				}
				
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 try{
		 disconnect();
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }
		 
		 return groupRentContent;
	 }
	 
	 public MtmboardBean getMy1on1Content(MtmboardBean my1on1Content, int num) {
		 

		 try {
				// 커넥션풀로 부터 커넥션 얻기(DB접속)
				con = getConnection();
				// SQL SELECT
				sql = "select * from 1on1_board where oneonone_id = ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					my1on1Content.setCustomer_id(rs.getString("customer_id"));
					my1on1Content.setContent(rs.getString("content"));
					my1on1Content.setEmail(rs.getString("email"));
					my1on1Content.setFileimg(rs.getString("fileimg"));
					my1on1Content.setLocation(rs.getString("location"));
					my1on1Content.setName(rs.getString("name"));
					my1on1Content.setOneonone_id(rs.getInt("oneonone_id"));
					my1on1Content.setQuestion_type(rs.getString("question_type"));
					my1on1Content.setRep_1on1_board(rs.getString("rep_1on1_board"));
					my1on1Content.setRep_1on1_board_content(rs.getString("rep_1on1_board_content"));
					my1on1Content.setSubject(rs.getString("subject"));
					my1on1Content.setTelnum(rs.getString("telnum"));
					my1on1Content.setWriteDate(rs.getDate("writeDate"));
					
				}
				
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 try{
		 disconnect();
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }
			
		 
		 return my1on1Content;
	 }
	 
	 public List<LostArticleBean> getMyLostArticleList(List<LostArticleBean> myLostArticleList, int startRow, String searchVal, String repSelectVal, String id) {
		 

		 try {
				// 커넥션풀로 부터 커넥션 얻기(DB접속)
				con = getConnection();
				// SQL SELECT 
				sql = "select * from lost_article where customer_id = ? AND lost_article_subject like ? AND rep_lost_article like ? order by lost_article_num desc limit ?, 10";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, "%"+searchVal+"%");
				pstmt.setString(3, "%"+repSelectVal+"%");
				pstmt.setInt(4, startRow);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					LostArticleBean bBean = new LostArticleBean();;
					
					bBean.setCustomer_id(rs.getString("customer_id"));
					bBean.setLost_article_num(rs.getInt("lost_article_num"));
					bBean.setLost_article_location(rs.getString("lost_article_location"));
					bBean.setLost_article_film(rs.getString("lost_article_film"));
					bBean.setLost_article_date(rs.getString("lost_article_date"));
					bBean.setLost_article_time(rs.getString("lost_article_time"));
					bBean.setLost_article_name(rs.getString("lost_article_name"));
					bBean.setLost_article_telnum(rs.getString("lost_article_telnum"));
					bBean.setLost_article_email(rs.getString("lost_article_email"));
					bBean.setLost_article_subject(rs.getString("lost_article_subject"));
					bBean.setLost_article_content(rs.getString("lost_article_content"));
					bBean.setLost_article_writeDate(rs.getDate("lost_article_writeDate"));
					bBean.setRep_lost_article(rs.getString("rep_lost_article"));
					bBean.setLost_article_rep_content(rs.getString("lost_article_rep_content"));
					
					
					
					myLostArticleList.add(bBean);
				}
				
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 try{
		 disconnect();
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }

		 
		 return myLostArticleList;
	 }
	 
	 public int getMyLostArticleCount(String id, String searchVal, String repSelectVal) {

		 int count = 0;
			
			try {
				con = getConnection();
				sql = "select count(*) from lost_article where customer_id = ? AND rep_lost_article like ? AND lost_article_subject like ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, "%"+repSelectVal+"%");
				pstmt.setString(3, "%"+searchVal+"%");
				rs = pstmt.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
							
				
			} catch (Exception e) {
				System.out.println("getMyLostArticleCount()메소드에서 발생한 예외" + e);
			}finally {
				try {
					disconnect();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}
		 
		 return count;
	 }

	 public List<GroupRentBean> getMyGroupRentList(List<GroupRentBean> myGroupRentList, int startRow, String searchVal, String repSelectVal, String id) {
		 

		 try {
				// 커넥션풀로 부터 커넥션 얻기(DB접속)
				con = getConnection();
				// SQL SELECT 
				sql = "select * from group_rent where customer_id = ? AND group_rent_subject like ? AND rep_group_rent like ? order by group_rent_num desc limit ?, 10";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, "%"+searchVal+"%");
				pstmt.setString(3, "%"+repSelectVal+"%");
				pstmt.setInt(4, startRow);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					GroupRentBean bBean = new GroupRentBean();
					
					bBean.setCustomer_id(rs.getString("customer_id"));
					bBean.setGroup_rent_num(rs.getInt("group_rent_num"));
					bBean.setGroup_rent_location(rs.getString("group_rent_location"));
					bBean.setGroup_rent_date(rs.getString("group_rent_date"));
					bBean.setGroup_rent_time(rs.getString("group_rent_time"));
					bBean.setGroup_rent_film(rs.getString("group_rent_film"));
					bBean.setGroup_rent_totalnum(rs.getString("group_rent_totalnum"));
					bBean.setGroup_rent_name(rs.getString("group_rent_name"));
					bBean.setGroup_rent_telnum(rs.getString("group_rent_telnum"));
					bBean.setGroup_rent_email(rs.getString("group_rent_email"));
					bBean.setGroup_rent_subject(rs.getString("group_rent_subject"));
					bBean.setGroup_rent_content(rs.getString("group_rent_content"));
					bBean.setGroup_rent_writeDate(rs.getDate("group_rent_writeDate"));
					bBean.setGroup_rent_rep_content(rs.getString("group_rent_rep_content"));
					bBean.setRep_group_rent(rs.getString("rep_group_rent"));
					
					
					myGroupRentList.add(bBean);
				}
				
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 try{
		 disconnect();
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }

		 
		 return myGroupRentList;
	 }
	 
	 
	 
	 public int getMyGroupRentCount(String id, String searchVal, String repSelectVal) {
		 
		 int count = 0;
			
			try {
				con = getConnection();
				sql = "select count(*) from group_rent where customer_id = ? AND rep_group_rent like ? AND group_rent_subject like ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, "%"+repSelectVal+"%");
				pstmt.setString(3, "%"+searchVal+"%");
				rs = pstmt.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
							
				
			} catch (Exception e) {
				System.out.println("getMyGroupRentCount()메소드에서 발생한 예외" + e);
			}finally {
				try {
					disconnect();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}
		 
		 return count;
	 }
	 
	 public int getMy1on1Count(String id, String searchVal, String repSelectVal) {
		 
		 int count = 0;
			
			try {
				con = getConnection();
				sql = "select count(*) from 1on1_board where customer_id = ? AND rep_1on1_board like ? AND subject like ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, "%"+repSelectVal+"%");
				pstmt.setString(3, "%"+searchVal+"%");
				rs = pstmt.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
							
				
			} catch (Exception e) {
				System.out.println("getMy1on1Count()메소드에서 발생한 예외" + e);
			}finally {
				try {
					disconnect();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}
		 
		 return count;
	 }
	 
	 public List<MtmboardBean> getMy1on1List(List<MtmboardBean> my1on1List, int startRow, String searchVal, String repSelectVal, String id) {
		 

		 try {
				// 커넥션풀로 부터 커넥션 얻기(DB접속)
				con = getConnection();
				// SQL SELECT 
				sql = "select * from 1on1_board where customer_id = ? AND subject like ? AND rep_1on1_board like ? order by oneonone_id desc limit ?, 10";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, "%"+searchVal+"%");
				pstmt.setString(3, "%"+repSelectVal+"%");
				pstmt.setInt(4, startRow);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					MtmboardBean bBean = new MtmboardBean();
					
					bBean.setOneonone_id(rs.getInt("oneonone_id"));
					bBean.setCustomer_id(rs.getString("customer_id"));
					bBean.setName(rs.getString("name"));
					bBean.setTelnum(rs.getString("telnum"));
					bBean.setEmail(rs.getString("email"));
					bBean.setLocation(rs.getString("location"));
					bBean.setQuestion_type(rs.getString("question_type"));
					bBean.setSubject(rs.getString("subject"));
					bBean.setContent(rs.getString("content"));
					bBean.setFileimg(rs.getString("fileimg"));
					bBean.setWriteDate(rs.getDate("writeDate"));
					bBean.setRep_1on1_board(rs.getString("rep_1on1_board"));
					bBean.setRep_1on1_board_content(rs.getString("rep_1on1_board_content"));
					
					
					
					my1on1List.add(bBean);
				}
				
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 try{
		 disconnect();
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }

		 
		 return my1on1List;
	 }
	 
	 
	 
	 // 분실물 문의 글 상세보기 메소드
	 public LostArticleBean getLostArticleContent(LostArticleBean lostArticleContent, int lost_article_num) {

		 try {
				// 커넥션풀로 부터 커넥션 얻기(DB접속)
				con = getConnection();
				// SQL SELECT
				sql = "select * from lost_article where lost_article_num = ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, lost_article_num);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					lostArticleContent.setLost_article_num(rs.getInt("lost_article_num"));
					lostArticleContent.setLost_article_location(rs.getString("lost_article_location"));
					lostArticleContent.setLost_article_film(rs.getString("lost_article_film"));
					lostArticleContent.setLost_article_time(rs.getString("lost_article_time"));
					lostArticleContent.setLost_article_name(rs.getString("lost_article_name"));
					lostArticleContent.setLost_article_date(rs.getString("lost_article_date"));
					lostArticleContent.setLost_article_telnum(rs.getString("lost_article_telnum"));
					lostArticleContent.setLost_article_email(rs.getString("lost_article_email"));
					lostArticleContent.setLost_article_subject(rs.getString("lost_article_subject"));
					lostArticleContent.setLost_article_content(rs.getString("lost_article_content"));
					lostArticleContent.setLost_article_writeDate(rs.getDate("lost_article_writeDate"));
					lostArticleContent.setRep_lost_article(rs.getString("rep_lost_article"));
					lostArticleContent.setLost_article_rep_num(rs.getInt("lost_article_rep_num"));
					lostArticleContent.setLost_article_rep_content(rs.getString("lost_article_rep_content"));
				}
				
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 try{
		 disconnect();
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }
			
			return lostArticleContent;
		}
	 
	 // 분실물 게시판 리스트 및 검색 리스트 불러오는 메소드
	 public List<LostArticleBean> getLostArticleSearch(List<LostArticleBean> lostArticleList,int startRow,String searchVal,String selectVal,String cinemaSelectVal, String repSelectVal) {

		 try {
				// 커넥션풀로 부터 커넥션 얻기(DB접속)
				con = getConnection();
				// SQL SELECT
				sql = "select * from lost_article where lost_article_location like ? AND lost_article_location like ? AND lost_article_subject like ? AND rep_lost_article like ? order by lost_article_num desc limit ?, 10";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+selectVal+"%");
				pstmt.setString(2, "%"+cinemaSelectVal+"%");
				pstmt.setString(3, "%"+searchVal+"%");
				pstmt.setString(4, "%"+repSelectVal+"%");
				pstmt.setInt(5, startRow);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					LostArticleBean bBean = new LostArticleBean();
					bBean.setLost_article_num(rs.getInt("lost_article_num"));
					bBean.setLost_article_location(rs.getString("lost_article_location"));
					bBean.setLost_article_subject(rs.getString("lost_article_subject"));
					bBean.setLost_article_content(rs.getString("lost_article_content"));
					bBean.setRep_lost_article(rs.getString("rep_lost_article"));
					bBean.setLost_article_writeDate(rs.getDate("lost_article_writeDate"));
					
					lostArticleList.add(bBean);
				}
				
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 try{
		 disconnect();
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }
		 return lostArticleList;
	 }
	 
	 // 분실물 게시판 전체글 개수 불러오는 메소드
	 public int getLostArticleCount(String searchVal, String selectVal, String cinemaSelectVal, String repSelectVal) {
		 
		 int count = 0;
			
			try {
				con = getConnection();
				sql = "select count(*) from lost_article where lost_article_location like ? AND lost_article_location like ? AND rep_lost_article like ? AND lost_article_subject like ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+selectVal+"%");
				pstmt.setString(2, "%"+cinemaSelectVal+"%");
				pstmt.setString(3, "%"+repSelectVal+"%");
				pstmt.setString(4, "%"+searchVal+"%");
				rs = pstmt.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
							
				
			} catch (Exception e) {
				System.out.println("getLostArticleCount()메소드에서 발생한 예외" + e);
			}finally {
				try {
					disconnect();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}

			return count;
		}
	 
	 // 분실물 게시판 글쓰기 메소드
	 public void writeLostArticle(String id,String date,String time,String film,String name,String telnum,String email,String location,String subject,String content) {
		 

		 try {
			 
			 con = getConnection();
			 
			 sql = "insert into lost_article(customer_id, lost_article_date, lost_article_time, lost_article_film, lost_article_name, lost_article_telnum, lost_article_email, lost_article_location, lost_article_subject, lost_article_content, lost_article_writeDate)  values(?,?,?,?,?,?,?,?,?,?,now())";
			 
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, id);
			 pstmt.setString(2, date);
			 pstmt.setString(3, time);
			 pstmt.setString(4, film);
			 pstmt.setString(5, name);
			 pstmt.setString(6, telnum);
			 pstmt.setString(7, email);
			 pstmt.setString(8, location);
			 pstmt.setString(9, subject);
			 pstmt.setString(10, content);
			 pstmt.executeUpdate();
			 
		 }catch(Exception e) {
			 System.out.println("writeGroupRent 에서 발생한 예외" + e);
		 }finally {
			 try{
				 disconnect();
			}catch(Exception e) {
				 e.printStackTrace();
			}
		 }
		 
	 }
	 
	 // 단체 대관 문의 게시판 글쓰기 메소드
	 public void writeGroupRent(String id, String group_rent_date, String group_rent_time, String group_rent_film, String group_rent_totalnum, String name, String telnum, String email, String location, String subject, String content) {

		 try {
			 
			 con = getConnection();
			 
			 sql = "insert into group_rent(customer_id, group_rent_date, group_rent_time, group_rent_film, group_rent_totalnum, group_rent_name, group_rent_telnum, group_rent_email, group_rent_location, group_rent_subject, group_rent_content, group_rent_writeDate) values(?,?,?,?,?,?,?,?,?,?,?, now())";
			 
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, id);
			 pstmt.setString(2, group_rent_date);
			 pstmt.setString(3, group_rent_time);
			 pstmt.setString(4, group_rent_film);
			 pstmt.setString(5, group_rent_totalnum);
			 pstmt.setString(6, name);
			 pstmt.setString(7, telnum);
			 pstmt.setString(8, email);
			 pstmt.setString(9, location);
			 pstmt.setString(10, subject);
			 pstmt.setString(11, content);
			 pstmt.executeUpdate();
			 
		 }catch(Exception e) {
			 System.out.println("writeGroupRent 에서 발생한 예외" + e);
		 }finally {
			 try{
				 disconnect();
			}catch(Exception e) {
				 e.printStackTrace();
			}
		 }
		 
	 }
	 
	 // 1:1 게시판 전송 메소드 write1on1()메소드의 시작
	 public void write1on1(String id, String name, String telnum, String email, String location, String question_type, String subject, String content, String fileimg) {
		 
		 try {
			 
			 con = getConnection();
			 
			 sql = "insert into 1on1_board(customer_id, name, telnum, email, location, question_type, subject, content, fileimg, writeDate) values(?,?,?,?,?,?,?,?,?,now())";
			 
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, id);
			 pstmt.setString(2, name);
			 pstmt.setString(3, telnum);
			 pstmt.setString(4, email);
			 pstmt.setString(5, location);
			 pstmt.setString(6, question_type);
			 pstmt.setString(7, subject);
			 pstmt.setString(8, content);
			 pstmt.setString(9, fileimg);
			 pstmt.executeUpdate();
			 
		 }catch(Exception e) {
			 System.out.println("write1on1 에서 발생한 예외" + e);
		 }finally {
			 try{
				 disconnect();
			}catch(Exception e) {
				 e.printStackTrace();
			}
		 }
		 
	 }
	 // write1on1()메소드의 끝
	 
	 // 고객센터 메인 공지사항 글 상위 5개 불러오는 메소드
	 public List<NoticeBean> getNoticeListTop5(List<NoticeBean> noticeList) {
		 
		 try {
				// 커넥션풀로 부터 커넥션 얻기(DB접속)
				con = getConnection();
				// SQL SELECT
				sql = "select * from notice_board order by num desc limit 0, 5";
				
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					NoticeBean bBean = new NoticeBean();
					bBean.setNum(rs.getInt("num"));
					bBean.setLocation(rs.getString("location"));
					bBean.setSubject(rs.getString("subject"));
					bBean.setContent(rs.getString("content"));
					bBean.setWriteDate(rs.getDate("writeDate"));
					
					noticeList.add(bBean);
				}
				
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 try{
		 disconnect();
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }
		 
		 return noticeList;
	 }
	 
	 // 공지사항 게시판 다음글 불러오는 메소드
	 public NoticeBean getNextNoticeContent(NoticeBean nextNoticeContent, int num, String location) {
		 
		 try {
			 con = getConnection();
			 if(location.equals("전체")) {
				 sql = "select * from notice_board where num = (select max(num) from notice_board where location = '전체' and num < ?)";
			 }else {
				 sql = "select * from notice_board where num = (select max(num) from notice_board where location != '전체' and num < ?)";
			 }
			 pstmt = con.prepareStatement(sql);
			 pstmt.setInt(1, num);
			 rs = pstmt.executeQuery();
			 
			 rs.next();
			 nextNoticeContent.setNum(rs.getInt("num"));
			 nextNoticeContent.setLocation(rs.getString("location"));
			 nextNoticeContent.setSubject(rs.getString("subject"));
			 nextNoticeContent.setContent(rs.getString("content"));
			 nextNoticeContent.setWriteDate(rs.getDate("writeDate"));
			 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
				try {
					disconnect();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
		}
		 		 
		 return nextNoticeContent;
	 }
	 
	 // 공지사항 게시판 이전글 불러오는 메소드,
	 public NoticeBean getPrevNoticeContent(NoticeBean prevNoticeContent, int num, String location) {
		 
		 try {
			 con = getConnection();
			 if(location.equals("전체")) {
				 sql = "select * from notice_board where num = (select min(num) from notice_board where location = '전체' and num > ?)";
			 }else {
				 sql = "select * from notice_board where num = (select min(num) from notice_board where location != '전체' and num > ?)";
			 }
			 pstmt = con.prepareStatement(sql);
			 pstmt.setInt(1, num);
			 rs = pstmt.executeQuery();
			 rs.next();
			 prevNoticeContent.setNum(rs.getInt("num"));
			 prevNoticeContent.setLocation(rs.getString("location"));
			 prevNoticeContent.setSubject(rs.getString("subject"));
			 prevNoticeContent.setContent(rs.getString("content"));
			 prevNoticeContent.setWriteDate(rs.getDate("writeDate"));
			 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
				try {
					disconnect();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
		}
		 
		 return prevNoticeContent;
	 }
	 
	 // 공지사항 게시판 상세보기 메소드
	 public NoticeBean getNoticeContent(NoticeBean noticeBean, int num) {
		 
		 try {
			 con = getConnection();
			 sql = "select * from notice_board where num = ?";
			 
			 pstmt = con.prepareStatement(sql);
			 pstmt.setInt(1, num);
			 rs = pstmt.executeQuery();
			
			 rs.next();
			noticeBean.setNum(rs.getInt("num"));
			noticeBean.setLocation(rs.getString("location"));
			noticeBean.setSubject(rs.getString("subject"));
			noticeBean.setContent(rs.getString("content"));
			noticeBean.setWriteDate(rs.getDate("writeDate"));
			 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
				try {
					disconnect();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
		}
		 
		 return noticeBean;
	 }
	 
	 // 공지사항 게시판 지역 검색 후 글개수 가져오는 메소드(페이징용)
	 public int getLocationSearchCount(String searchVal, String selectVal, String cinemaSelectVal) {

			int count = 0;
			
			try {
				con = getConnection();
				sql = "select count(*) from notice_board where location != '전체' AND location like ? AND location like ? AND subject like ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+selectVal+"%");
				pstmt.setString(2, "%"+cinemaSelectVal+"%");
				pstmt.setString(3, "%"+searchVal+"%");
				rs = pstmt.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
							
				
			} catch (Exception e) {
				System.out.println("getBoardCount()메소드에서 발생한 예외" + e);
			}finally {
				try {
					disconnect();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}

			return count;
		}
	 
	 // 공지사항 게시판 지역& 영화관 검색리스트 가져오는 메소드
	 public List<NoticeBean> getLocationSearch(List<NoticeBean> locationList, int startRow, String searchVal, String selectVal, String cinemaSelectVal) {
		 

		 
		 try {
				// 커넥션풀로 부터 커넥션 얻기(DB접속)
				con = getConnection();
				// SQL SELECT
				sql = "select * from notice_board where location != '전체' AND location like ? AND location like ? AND subject like ? order by num desc limit ?, 10";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+selectVal+"%");
				pstmt.setString(2, "%"+cinemaSelectVal+"%");
				pstmt.setString(3, "%"+searchVal+"%");
				pstmt.setInt(4, startRow);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					NoticeBean bBean = new NoticeBean();
					bBean.setNum(rs.getInt("num"));
					bBean.setLocation(rs.getString("location"));
					bBean.setSubject(rs.getString("subject"));
					bBean.setContent(rs.getString("content"));
					bBean.setWriteDate(rs.getDate("writeDate"));
					
					locationList.add(bBean);
				}
				
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 try{
		 disconnect();
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }
		 
		 return locationList;
	 }
	 
	 // 공지사항 게시판 전체공지 게시글 개수 가져오는 메소드(페이지용)
	 public int getAllSearchCount(String searchVal) {

			int count = 0;
			
			try {
				con = getConnection();
				sql = "select count(*) from notice_board where location = '전체' AND subject like ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+searchVal+"%");
				rs = pstmt.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
							
				
			} catch (Exception e) {
				System.out.println("getBoardCount()메소드에서 발생한 예외" + e);
			}finally {
				try {
					disconnect();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}

			return count;
		}
	 
	 
	 // 공지사항 게시판 전체공지 검색 리스트 가져오는 메소드
	 public List<NoticeBean> getAllSearchList(List<NoticeBean> noticeList, int startRow, String searchVal) {
		 
		 try {
				// 커넥션풀로 부터 커넥션 얻기(DB접속)
				con = getConnection();
				// SQL SELECT
				sql = "select * from notice_board where location = '전체' AND subject like ? order by num desc limit ?, 10";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+searchVal+"%");
				pstmt.setInt(2, startRow);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					NoticeBean bBean = new NoticeBean();
					bBean.setNum(rs.getInt("num"));
					bBean.setLocation(rs.getString("location"));
					bBean.setSubject(rs.getString("subject"));
					bBean.setContent(rs.getString("content"));
					bBean.setWriteDate(rs.getDate("writeDate"));
					
					noticeList.add(bBean);
				}
				
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 try{
		 disconnect();
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }
		 
		 return noticeList;
	 }
	 
	 // 공지사항 게시판 영화관별 공지 개수 가져오는 메소드(페이징용)
	 public int getLocationCount() {

			int count = 0;
			
			try {
				con = getConnection();
				sql = "select count(*) from notice_board where location != '전체'";
				
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
							
				
			} catch (Exception e) {
				System.out.println("getBoardCount()메소드에서 발생한 예외" + e);
			}finally {
				try {
					disconnect();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}

			return count;
		}
	 
	 // 공지사항 게시판 글 리스트 가져오는 메소드
	 public List<NoticeBean> getLocationList(List<NoticeBean> locationList, int startRow) {
		 
 
		 
		 try {
				// 커넥션풀로 부터 커넥션 얻기(DB접속)
				con = getConnection();
				// SQL SELECT
				sql = "select * from notice_board where location != '전체' order by num desc limit ?, 10";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					NoticeBean bBean = new NoticeBean();
					bBean.setNum(rs.getInt("num"));
					bBean.setLocation(rs.getString("location"));
					bBean.setSubject(rs.getString("subject"));
					bBean.setContent(rs.getString("content"));
					bBean.setWriteDate(rs.getDate("writeDate"));
					
					locationList.add(bBean);
				}
				
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 try{
		 disconnect();
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }
		 
		 return locationList;
	 }
	 
	 // 공지사항 게시판 전체글 개수 가져오는 메소드
	 public int getNoticeCount() {

			int count = 0;
			
			try {
				con = getConnection();
				sql = "select count(*) from notice_board where location = '전체'";
				
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
							
				
			} catch (Exception e) {
				System.out.println("getBoardCount()메소드에서 발생한 예외" + e);
			}finally {
				try {
					disconnect();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}

			return count;
		}
	 
	 // 공지사항 게시판 전체글 리스트 가져오는 메소드
	 public List<NoticeBean> getNoticeList(List<NoticeBean> noticeList, int startRow) {
		 
 
		 
		 try {
				// 커넥션풀로 부터 커넥션 얻기(DB접속)
				con = getConnection();
				// SQL SELECT
				sql = "select * from notice_board where location = '전체' order by num desc limit ?, 10";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					NoticeBean bBean = new NoticeBean();
					bBean.setNum(rs.getInt("num"));
					bBean.setLocation(rs.getString("location"));
					bBean.setSubject(rs.getString("subject"));
					bBean.setContent(rs.getString("content"));
					bBean.setWriteDate(rs.getDate("writeDate"));
					
					noticeList.add(bBean);
				}
				
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 try{
		 disconnect();
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }
		 
		 return noticeList;
	 }
	 
	 // FAQ게시판 검색 글 개수 가져오는 메소드(페이징용)
	 public int getCountsearchList(String searchVal, String selectVal) {

			int count = 0;
			
			try {
				con = getConnection();
				sql = "select count(*) from faq_board where question like ? AND faq_group like ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+searchVal+"%");
				pstmt.setString(2, "%"+selectVal+"%");
				rs = pstmt.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
							
				
			} catch (Exception e) {
				System.out.println("getBoardCount()메소드에서 발생한 예외" + e);
			}finally {
				try {
					disconnect();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}

			return count;
		}// getCountsearchList()메소드의 끝
	 
	 
	 // FAQ게시판 검색 리스트 가져오는 메소드
	 public List<BoardBean> getsearchList(List<BoardBean> list, int startRow, String searchVal, String selectVal) {
		 
		 
		 
		 try {
				// 커넥션풀로 부터 커넥션 얻기(DB접속)
				con = getConnection();
				// SQL SELECT
				sql = "select * from faq_board where question like ? AND faq_group like ? order by hit desc limit ?, 10";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+searchVal+"%");
				pstmt.setString(2, "%"+selectVal+"%");
				pstmt.setInt(3, startRow);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					BoardBean bBean = new BoardBean();
					bBean.setNum(rs.getInt("num"));
					bBean.setFaq_group(rs.getString("faq_group"));
					bBean.setQuestion(rs.getString("question"));
					bBean.setAnswer(rs.getString("answer"));
					bBean.setHit(rs.getInt("hit"));
					
					list.add(bBean);
				}
				
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 try{
		 disconnect();
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }
		return list;
	 }
	 
	 // FAQ게시판 전체글 개수 가져오는 메소드
	 public int getBoardCount() {

			int count = 0;
			
			try {
				con = getConnection();
				sql = "select count(*) from faq_board";
				
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
							
				
			} catch (Exception e) {
				System.out.println("getBoardCount()메소드에서 발생한 예외" + e);
			}finally {
				try {
					disconnect();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}

			return count;
		}// getBoardCount()메소드의 끝
	 
	 // FAQ게시판 전체글 검색해서 가져오기
	 public List<BoardBean> getFQABoard(List<BoardBean> list, int startRow) {
		 
		 
		 
		 try {
				// 커넥션풀로 부터 커넥션 얻기(DB접속)
				con = getConnection();
				// SQL SELECT
				sql = "select * from faq_board order by hit desc limit ?, 10";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					BoardBean bBean = new BoardBean();
					bBean.setNum(rs.getInt("num"));
					bBean.setFaq_group(rs.getString("faq_group"));
					bBean.setQuestion(rs.getString("question"));
					bBean.setAnswer(rs.getString("answer"));
					bBean.setHit(rs.getInt("hit"));
					
					list.add(bBean);
				}
				
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 try{
		 disconnect();
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }
		return list;
	 }

}
