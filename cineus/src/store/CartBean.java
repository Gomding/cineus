package store;

import java.sql.Timestamp;

public class CartBean {//장바구니 cart 테이블
	
	//DB에 컬럼 있는 변수
	private int cart_code;//장바구니 코드(Auto Increment)
	private String customer_id;//회원id
	private int item_code;//상품코드
	private int cart_qty;//상품개수
	private int cart_status;//장바구니 결제상태(디폴트 0 : 미결제 1 : 결제완료)
	private Timestamp cart_date;//장바구니 담은 일자(디폴트 now())
	
	//DB에 컬럼 없는 변수
	private String item_name;//상품명
	private String item_image;//상품사진
	private int sale_price;//상품단가

	public CartBean() {
		
	}

	//DB에 있는 거만(cart_code)제외
	public CartBean(String customer_id, int item_code, int cart_qty, int cart_status, Timestamp cart_date) {
		super();
		this.customer_id = customer_id;
		this.item_code = item_code;
		this.cart_qty = cart_qty;
		this.cart_status = cart_status;
	}

	//전체 변수
	public CartBean(int cart_code, String customer_id, int item_code, int cart_qty, int cart_status, String item_name, String item_image, int sale_price) {
		super();
		this.customer_id = customer_id;
		this.item_code = item_code;
		this.cart_qty = cart_qty;
		this.item_name = item_name;
		this.item_image = item_image;
		this.sale_price = sale_price;
	}

	//getter, setter
	public int getCart_code() {
		return cart_code;
	}
	
	public void setCart_code(int cart_code) {
		this.cart_code = cart_code;
	}
	
	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
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
	
	public int getCart_status() {
		return cart_status;
	}

	public void setCart_status(int cart_status) {
		this.cart_status = cart_status;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getItem_image() {
		return item_image;
	}

	public void setItem_image(String item_image) {
		this.item_image = item_image;
	}

	public int getSale_price() {
		return sale_price;
	}

	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}

	public Timestamp getCart_date() {
		return cart_date;
	}

	public void setCart_date(Timestamp cart_date) {
		this.cart_date = cart_date;
	}
	
}
