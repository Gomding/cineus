package faqboard;

import java.sql.Date;

public class MtmboardBean {
	
	
	
	private int oneonone_id;
	
	private String customer_id;

	private String name;

	private String telnum;

	private String email;
	
	private String location;
	
	private String question_type;
	
	private String subject;
	
	private String content;
	
	private String fileimg;
	
	private Date writeDate;
	
	private String rep_1on1_board_content; // 1대1 게시판 답변 내용
	
	private String rep_1on1_board; // 1대1 게시판 응답 여부

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	
	public int getOneonone_id() {
		return oneonone_id;
	}

	public void setOneonone_id(int oneonone_id) {
		this.oneonone_id = oneonone_id;
	}

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTelnum() {
		return telnum;
	}

	public void setTelnum(String telnum) {
		this.telnum = telnum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getQuestion_type() {
		return question_type;
	}

	public void setQuestion_type(String question_type) {
		this.question_type = question_type;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFileimg() {
		return fileimg;
	}

	public void setFileimg(String fileimg) {
		this.fileimg = fileimg;
	}

	public String getRep_1on1_board_content() {
		return rep_1on1_board_content;
	}

	public void setRep_1on1_board_content(String rep_1on1_board_content) {
		this.rep_1on1_board_content = rep_1on1_board_content;
	}

	public String getRep_1on1_board() {
		return rep_1on1_board;
	}

	public void setRep_1on1_board(String rep_1on1_board) {
		this.rep_1on1_board = rep_1on1_board;
	}
	
	

}
