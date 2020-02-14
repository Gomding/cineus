package store;

import java.sql.Timestamp;

public class CouponBean {

	//DB에 컬럼 있는 변수
	private String cp_code;//쿠폰코드(직접 생성해서 입력)
	private int item_code;//상품코드(paydetail 테이블에서 가져옴)
	private String pay_code;//결제코드(paydetail 테이블에서 가져옴)
	private Timestamp cp_date;//발행일(디폴트 now())
	private int cp_status;//쿠폰상태(0 : 미사용 / 1 : 사용 / 2 : 결제확인용 표시)
	private String customer_id;//회원ID(수정삭제용으로 추가해둠)
	
	//DB에 컬럼 없는 변수(마이페이지 스토어 구매내역에서 사용)
	private String item_name;//상품명
	
	public CouponBean() {

	}

	//DB에 있는 거만
	public CouponBean(String cp_code, int item_code, String pay_code, Timestamp cp_date, int cp_status, String customer_id) {
		this.cp_code = cp_code;
		this.item_code = item_code;
		this.pay_code = pay_code;
		this.cp_date = cp_date;
		this.cp_status = cp_status;
		this.customer_id = customer_id;
	}

	public String getCp_code() {
		return cp_code;
	}

	public void setCp_code(String cp_code) {
		this.cp_code = cp_code;
	}

	public int getItem_code() {
		return item_code;
	}

	public void setItem_code(int item_code) {
		this.item_code = item_code;
	}

	public String getPay_code() {
		return pay_code;
	}

	public void setPay_code(String pay_code) {
		this.pay_code = pay_code;
	}

	public Timestamp getCp_date() {
		return cp_date;
	}

	public void setCp_date(Timestamp cp_date) {
		this.cp_date = cp_date;
	}

	public int getCp_status() {
		return cp_status;
	}

	public void setCp_status(int cp_status) {
		this.cp_status = cp_status;
	}

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

}
