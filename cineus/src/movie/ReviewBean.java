package movie;

import java.sql.Timestamp;

public class ReviewBean {
	
	private int review_num; //리뷰 번호
	private String review_name; //댓글 작성자(멤버 id를 받아와 사용)\
	private int review_star; //댓글 별점
	private String review_content; //댓글 내용
	private Timestamp review_date; //댓글 작성일
	private int movie_ID; //영화 제목
	
	
	public int getMovie_ID() {
		return movie_ID;
	}
	public void setMovie_ID(int movie_ID) {
		this.movie_ID = movie_ID;
	}
	public int getReview_num() {
		return review_num;
	}
	
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public String getReview_name() {
		return review_name;
	}
	public void setReview_name(String review_name) {
		this.review_name = review_name;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public Timestamp getReview_date() {
		return review_date;
	}
	public void setReview_date(Timestamp review_date) {
		this.review_date = review_date;
	}
	public int getReview_star() {
		return review_star;
	}
	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}
	
	public ReviewBean(int review_num, String review_name, int review_star, String review_content, Timestamp review_date,
			int movie_ID) {
		super();
		this.review_num = review_num;
		this.review_name = review_name;
		this.review_star = review_star;
		this.review_content = review_content;
		this.review_date = review_date;
		this.movie_ID = movie_ID;
	}
	
	public ReviewBean() {
		
	}
	
	
	
}
