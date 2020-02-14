package store;

import java.sql.Timestamp;

public class PayBean {//pay결제 테이블

	//DB에 컬럼 있는 변수
	private String pay_code;//결제코드(직접 생성해서 입력)
	private String customer_id;//회원ID
	private String pay_type;//결제수단
	private int pay_price;//총결제금액
	private Timestamp pay_date;//결제일
	private Timestamp cancel_date;//취소일(결제상태가 취소완료가 된 날짜)
	private int pay_status;//결제상태(디폴트 0 : 결제 / 1 : 취소신청 / 2 : 취소완료)
	
	//DB에 컬럼 없는 변수(마이페이지 스토어 구매내역에서 사용)	
	private int totalCoupon;//총 발급된 쿠폰 개수(실제 존재하지 않고 column alias로 만듦)
	private int usableCoupon;//총 발급된 쿠폰 중 사용가능한 쿠폰 개수(실제 존재하지 않고 column alias로 만듦)
	
	public PayBean() {//기본생성자
		
	}

	//DB에 있는 거만
	public PayBean(String pay_code, String customer_id, String pay_type, int pay_price, Timestamp pay_date,
			int pay_status) {//취소일 제외 생성자
		this.pay_code = pay_code;
		this.customer_id = customer_id;
		this.pay_type = pay_type;
		this.pay_price = pay_price;
		this.pay_date = pay_date;
		this.pay_status = pay_status;
	}

	public String getPay_code() {
		return pay_code;
	}

	public void setPay_code(String pay_code) {
		this.pay_code = pay_code;
	}

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}

	public String getPay_type() {
		return pay_type;
	}

	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}

	public int getPay_price() {
		return pay_price;
	}

	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}

	public Timestamp getPay_date() {
		return pay_date;
	}

	public void setPay_date(Timestamp pay_date) {
		this.pay_date = pay_date;
	}

	public Timestamp getCancel_date() {
		return cancel_date;
	}

	public void setCancel_date(Timestamp cancel_date) {
		this.cancel_date = cancel_date;
	}

	public int getPay_status() {
		return pay_status;
	}

	public void setPay_status(int pay_status) {
		this.pay_status = pay_status;
	}

	public int getTotalCoupon() {
		return totalCoupon;
	}

	public void setTotalCoupon(int totalCoupon) {
		this.totalCoupon = totalCoupon;
	}

	public int getUsableCoupon() {
		return usableCoupon;
	}

	public void setUsableCoupon(int usableCoupon) {
		this.usableCoupon = usableCoupon;
	}


}
