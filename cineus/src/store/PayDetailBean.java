package store;

public class PayDetailBean {//paydetail결제상세 테이블

	private int payde_code;//결제상세코드(Auto Increment)
	private String pay_code;//결제코드(pay 테이블에서 가져옴)
	private int item_code;//상품코드(cart 테이블에서 가져옴)
	private int cart_qty;//상품수량(cart 테이블에서 가져옴)
	
	//card결제카드 테이블로 따로 나뉨!!!
	private String card_num;//카드번호
	private int card_month;//카드월
	private int card_year;//카드년
	private int card_pw;//카드비밀번호
	private int card_birth;//생년월일
	private int pay_ins;//할부
	
	public PayDetailBean() {//기본 생성자
		
	}

	public int getPayde_code() {
		return payde_code;
	}

	public void setPayde_code(int payde_code) {
		this.payde_code = payde_code;
	}

	public String getPay_code() {
		return pay_code;
	}

	public void setPay_code(String pay_code) {
		this.pay_code = pay_code;
	}

	public int getItem_code() {
		return item_code;
	}

	public void setItem_code(int item_code) {
		this.item_code = item_code;
	}

	public int getCart_qty() {
		return cart_qty;
	}

	public void setCart_qty(int cart_qty) {
		this.cart_qty = cart_qty;
	}

	public String getCard_num() {
		return card_num;
	}

	public void setCard_num(String card_num) {
		this.card_num = card_num;
	}

	public int getCard_month() {
		return card_month;
	}

	public void setCard_month(int card_month) {
		this.card_month = card_month;
	}

	public int getCard_year() {
		return card_year;
	}

	public void setCard_year(int card_year) {
		this.card_year = card_year;
	}

	public int getCard_pw() {
		return card_pw;
	}

	public void setCard_pw(int card_pw) {
		this.card_pw = card_pw;
	}

	public int getCard_birth() {
		return card_birth;
	}

	public void setCard_birth(int card_birth) {
		this.card_birth = card_birth;
	}

	public int getPay_ins() {
		return pay_ins;
	}

	public void setPay_ins(int pay_ins) {
		this.pay_ins = pay_ins;
	}
	
}
