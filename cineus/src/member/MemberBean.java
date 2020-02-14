package member;

public class MemberBean {

	private String customer_id; 
	private String customer_pw; 
	private String customer_name; 
	private String customer_email;
	private String customer_tel; 
	private String customer_postcode;
	private String customer_address;
	private String customer_detailAddress;
	private String customer_extraAddress;
	private String customer_grade;
	private String customer_delete;
	
	public MemberBean(){}
	
	public MemberBean(
			String customer_id, String customer_pw, String customer_name,
			String customer_email, String customer_tel, String customer_postcode,
			String customer_address, String customer_detailAddress, String customer_extraAddress,
			String customer_grade, String customer_delete
					 )
	{
			this.customer_id = customer_id;
			this.customer_pw = customer_pw;
			this.customer_name = customer_name;
			this.customer_email = customer_email;
			this.customer_tel = customer_tel;
			this.customer_postcode = customer_postcode;
			this.customer_address = customer_address;
			this.customer_detailAddress = customer_detailAddress;
			this.customer_extraAddress = customer_extraAddress;
			this.customer_grade = customer_grade;
			this.customer_delete = customer_delete;
	}
	
	
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
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
	public String getCustomer_email() {
		return customer_email;
	}
	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}
	public String getCustomer_tel() {
		return customer_tel;
	}
	public void setCustomer_tel(String customer_tel) {
		this.customer_tel = customer_tel;
	}
	public String getCustomer_postcode() {
		return customer_postcode;
	}
	public void setCustomer_postcode(String customer_postcode) {
		this.customer_postcode = customer_postcode;
	}
	public String getCustomer_address() {
		return customer_address;
	}
	public void setCustomer_address(String customer_address) {
		this.customer_address = customer_address;
	}
	public String getCustomer_detailAddress() {
		return customer_detailAddress;
	}
	public void setCustomer_detailAddress(String customer_detailAddress) {
		this.customer_detailAddress = customer_detailAddress;
	}
	public String getCustomer_extraAddress() {
		return customer_extraAddress;
	}
	public void setCustomer_extraAddress(String customer_extraAddress) {
		this.customer_extraAddress = customer_extraAddress;
	}
	public String getCustomer_grade() {
		return customer_grade;
	}
	public void setCustomer_grade(String customer_grade) {
		this.customer_grade = customer_grade;
	}
	public String getCustomer_delete() {
		return customer_delete;
	}
	public void setCustomer_delete(String customer_delete) {
		this.customer_delete = customer_delete;
	}
	
	@Override
	public String toString() {
		return "MemberBean [customer_id=" + customer_id + ", customer_pw=" + customer_pw + ", customer_name="
				+ customer_name + ", customer_email=" + customer_email + ", customer_tel=" + customer_tel
				+ ", customer_postcode=" + customer_postcode + ", customer_address=" + customer_address
				+ ", customer_detailAddress=" + customer_detailAddress + ", customer_extraAddress="
				+ customer_extraAddress + ", customer_grade=" + customer_grade + ", customer_delete=" + customer_delete + "]";
	}
	
}
