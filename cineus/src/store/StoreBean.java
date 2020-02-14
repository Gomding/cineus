package store;

public class StoreBean {//상품 : item테이블

	private int item_code; 
	private String item_type; 
	private String item_name; 
	private String item_detail; 
	private String place; 
	private String exp; 
	private int price; 
	private int sale_price; 
	private String item_image; 
	private int item_status;//기본값 0: 판매중, 1: 판매종료
	
	public StoreBean() {
		
	}
	//상품상태 제외한 생성자
	public StoreBean(int item_code, String item_type, String item_name, String item_detail, String place, String exp,
			int price, int sale_price, String item_image) {
		super();
		this.item_code = item_code;
		this.item_type = item_type;
		this.item_name = item_name;
		this.item_detail = item_detail;
		this.place = place;
		this.exp = exp;
		this.price = price;
		this.sale_price = sale_price;
		this.item_image = item_image;
	}

	public int getItem_code() {
		return item_code;
	}

	public void setItem_code(int item_code) {
		this.item_code = item_code;
	}

	public String getItem_type() {
		return item_type;
	}

	public void setItem_type(String item_type) {
		this.item_type = item_type;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getItem_detail() {
		return item_detail;
	}

	public void setItem_detail(String item_detail) {
		this.item_detail = item_detail;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getExp() {
		return exp;
	}

	public void setExp(String exp) {
		this.exp = exp;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getSale_price() {
		return sale_price;
	}

	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}

	public String getItem_image() {
		return item_image;
	}

	public void setItem_image(String item_image) {
		this.item_image = item_image;
	}

	public int getItem_status() {
		return item_status;
	}

	public void setItem_status(int item_status) {
		this.item_status = item_status;
	}
	
	
	
}
