package Reservation;

import java.sql.Date;

public class TicketDTO {
	
//	reservation_payment_id 			int(11) AI PK 				// 티켓 번호 (예매번호)
//	reservation_payment_date 		varchar(30)					// 영화관람 날짜
//	reservation_payment_film 		varchar(50)					// 영화 이름
//	reservation_payment_movie_id 	int							// 영화 포스터 아이디
//	reservation_payment_showtimes 	varchar(50)					// 영화 상영시간 (시작시간 - 끝나는 시간)
//	reservation_payment_theater_name varchar(20)				// 영화관 이름 (강남 메가박스)
//	reservation_payment_screen_id 	int(11)						// 몇관(1관, 2관, 3관)
//	reservation_payment_schedule_id int(11)						// 시간표 ID
//	reservation_payment_seats 		varchar(100)				// 예약한 좌석 번호
//	reservation_payment_headCount 	int(11)						// 총 인원수
//	reservation_payment_ticketPrice int(11)						// 총 가격
//	reservation_payment_method 		varchar(20)					// 결제수단
//	reservation_payment_cardCompany varchar(20)					// 카드결제 회사
//	reservation_payment_cardNum 	varchar(50)					// 카드 번호
//	reservation_payment_telnum 		varchar(30) 				// 휴대폰결제시 전화번호
//	reservation_payment_check 		varchar(20) default '미결제'	// 결제여부체크
// 	reservation_payment_writeDate 	datetime default current_timestamp // 결제했던 날짜(결제한 날짜)
//	customer_id 					varchar(50)								// 예매한 고객 아이디

	private int reservation_payment_id;
	
	private String reservation_payment_date;

	private String reservation_payment_film;

	private int reservation_payment_movie_id;
	
	private String reservation_payment_showtimes;

	private String reservation_payment_theater_name;

	private int reservation_payment_screen_id;

	private int reservation_payment_schedule_id;
	
	private String reservation_payment_seats;

	private int reservation_payment_headCount;
	
	private int reservation_payment_ticketPrice;
	
	private String reservation_payment_method;
	
	private String reservation_payment_payCompany;
	
	private String reservation_payment_cardNum;
	
	private String reservation_payment_telnum;
	
	private String reservation_payment_check;
	
	private Date reservation_payment_writeDate;
	
	private String customer_id;

	public int getReservation_payment_id() {
		return reservation_payment_id;
	}

	public void setReservation_payment_id(int reservation_payment_id) {
		this.reservation_payment_id = reservation_payment_id;
	}

	public String getReservation_payment_date() {
		return reservation_payment_date;
	}

	public void setReservation_payment_date(String reservation_payment_date) {
		this.reservation_payment_date = reservation_payment_date;
	}

	public String getReservation_payment_film() {
		return reservation_payment_film;
	}

	public void setReservation_payment_film(String reservation_payment_film) {
		this.reservation_payment_film = reservation_payment_film;
	}

	public int getReservation_payment_movie_id() {
		return reservation_payment_movie_id;
	}

	public void setReservation_payment_movie_id(int reservation_payment_movie_id) {
		this.reservation_payment_movie_id = reservation_payment_movie_id;
	}

	public String getReservation_payment_showtimes() {
		return reservation_payment_showtimes;
	}

	public void setReservation_payment_showtimes(String reservation_payment_showtimes) {
		this.reservation_payment_showtimes = reservation_payment_showtimes;
	}

	public String getReservation_payment_theater_name() {
		return reservation_payment_theater_name;
	}

	public void setReservation_payment_theater_name(String reservation_payment_theater_name) {
		this.reservation_payment_theater_name = reservation_payment_theater_name;
	}

	public int getReservation_payment_screen_id() {
		return reservation_payment_screen_id;
	}

	public void setReservation_payment_screen_id(int reservation_payment_screen_id) {
		this.reservation_payment_screen_id = reservation_payment_screen_id;
	}

	public int getReservation_payment_schedule_id() {
		return reservation_payment_schedule_id;
	}

	public void setReservation_payment_schedule_id(int reservation_payment_schedule_id) {
		this.reservation_payment_schedule_id = reservation_payment_schedule_id;
	}

	public String getReservation_payment_seats() {
		return reservation_payment_seats;
	}

	public void setReservation_payment_seats(String reservation_payment_seats) {
		this.reservation_payment_seats = reservation_payment_seats;
	}

	public int getReservation_payment_headCount() {
		return reservation_payment_headCount;
	}

	public void setReservation_payment_headCount(int reservation_payment_headCount) {
		this.reservation_payment_headCount = reservation_payment_headCount;
	}

	public int getReservation_payment_ticketPrice() {
		return reservation_payment_ticketPrice;
	}

	public void setReservation_payment_ticketPrice(int reservation_payment_ticketPrice) {
		this.reservation_payment_ticketPrice = reservation_payment_ticketPrice;
	}

	public String getReservation_payment_method() {
		return reservation_payment_method;
	}

	public void setReservation_payment_method(String reservation_payment_method) {
		this.reservation_payment_method = reservation_payment_method;
	}

	public String getReservation_payment_payCompany() {
		return reservation_payment_payCompany;
	}

	public void setReservation_payment_payCompany(String reservation_payment_payCompany) {
		this.reservation_payment_payCompany = reservation_payment_payCompany;
	}

	public String getReservation_payment_cardNum() {
		return reservation_payment_cardNum;
	}

	public void setReservation_payment_cardNum(String reservation_payment_cardNum) {
		this.reservation_payment_cardNum = reservation_payment_cardNum;
	}

	public String getReservation_payment_telnum() {
		return reservation_payment_telnum;
	}

	public void setReservation_payment_telnum(String reservation_payment_telnum) {
		this.reservation_payment_telnum = reservation_payment_telnum;
	}

	public String getReservation_payment_check() {
		return reservation_payment_check;
	}

	public void setReservation_payment_check(String reservation_payment_check) {
		this.reservation_payment_check = reservation_payment_check;
	}

	public Date getReservation_payment_writeDate() {
		return reservation_payment_writeDate;
	}

	public void setReservation_payment_writeDate(Date reservation_payment_writeDate) {
		this.reservation_payment_writeDate = reservation_payment_writeDate;
	}

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	
	
	}
