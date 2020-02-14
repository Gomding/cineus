package faqboard;

import java.sql.Date;

public class LostArticleBean {

	// 분실문 문의 게시판 DB
	private int lost_article_num;
	
	private String lost_article_location;

	private String lost_article_film;
	
	private String lost_article_date;
	
	private String lost_article_time;

	private String lost_article_name;
	
	private String lost_article_telnum;
	
	private String lost_article_email;
	
	private String lost_article_subject;
	
	private String lost_article_content;
	
	private Date lost_article_writeDate;
	
	private String rep_lost_article;

	private String customer_id;
	

	private int lost_article_rep_num;
	
	private String lost_article_rep_content;


	public int getLost_article_num() {
		return lost_article_num;
	}

	public void setLost_article_num(int lost_article_num) {
		this.lost_article_num = lost_article_num;
	}

	public String getLost_article_location() {
		return lost_article_location;
	}

	public void setLost_article_location(String lost_article_location) {
		this.lost_article_location = lost_article_location;
	}

	public String getLost_article_film() {
		return lost_article_film;
	}

	public void setLost_article_film(String lost_article_film) {
		this.lost_article_film = lost_article_film;
	}

	public String getLost_article_date() {
		return lost_article_date;
	}

	public void setLost_article_date(String lost_article_date) {
		this.lost_article_date = lost_article_date;
	}

	public String getLost_article_time() {
		return lost_article_time;
	}

	public void setLost_article_time(String lost_article_time) {
		this.lost_article_time = lost_article_time;
	}

	public String getLost_article_name() {
		return lost_article_name;
	}

	public void setLost_article_name(String lost_article_name) {
		this.lost_article_name = lost_article_name;
	}

	public String getLost_article_telnum() {
		return lost_article_telnum;
	}

	public void setLost_article_telnum(String lost_article_telnum) {
		this.lost_article_telnum = lost_article_telnum;
	}

	public String getLost_article_email() {
		return lost_article_email;
	}

	public void setLost_article_email(String lost_article_email) {
		this.lost_article_email = lost_article_email;
	}

	public String getLost_article_subject() {
		return lost_article_subject;
	}

	public void setLost_article_subject(String lost_article_subject) {
		this.lost_article_subject = lost_article_subject;
	}

	public String getLost_article_content() {
		return lost_article_content;
	}

	public void setLost_article_content(String lost_article_content) {
		this.lost_article_content = lost_article_content;
	}
	

	public String getRep_lost_article() {
		return rep_lost_article;
	}

	public void setRep_lost_article(String rep_lost_article) {
		this.rep_lost_article = rep_lost_article;
	}

	public Date getLost_article_writeDate() {
		return lost_article_writeDate;
	}

	public void setLost_article_writeDate(Date lost_article_writeDate) {
		this.lost_article_writeDate = lost_article_writeDate;
	}

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	

	public int getLost_article_rep_num() {
		return lost_article_rep_num;
	}

	public void setLost_article_rep_num(int lost_article_rep_num) {
		this.lost_article_rep_num = lost_article_rep_num;
	}

	public String getLost_article_rep_content() {
		return lost_article_rep_content;
	}

	public void setLost_article_rep_content(String lost_article_rep_content) {
		this.lost_article_rep_content = lost_article_rep_content;
	}

	
	
	

}
