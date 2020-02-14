package Customer;

/*customer_ID	varchar(30)	NO	PRI		
customer_pw	varchar(30)	YES			
customer_name	varchar(20)	YES			
customer_tel	int(11)	YES	*/		

public class CustomerDTO {
	String customer_ID;
	String customer_pw;
	String customer_name;
	int customer_tel;
	//db 만들때 가입일을 빠뜨렸네ㅎ
	
	public CustomerDTO(String customer_ID, String customer_pw, String customer_name, int customer_tel) {
		this.customer_ID = customer_ID;
		this.customer_pw = customer_pw;
		this.customer_name = customer_name;
		this.customer_tel = customer_tel;
	}
	
	public CustomerDTO(){};
	
	//getters and setters
	public String getCustomer_ID() {
		return customer_ID;
	}
	public void setCustomer_ID(String customer_ID) {
		this.customer_ID = customer_ID;
	}
	public String getCustomer_pw() {
		return customer_pw;
	}
	public void setCustomer_pw(String customer_pw) {
		this.customer_pw = customer_pw;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public int getCustomer_tel() {
		return customer_tel;
	}
	public void setCustomer_tel(int customer_tel) {
		this.customer_tel = customer_tel;
	}
	
}
