package Nonmember;

import java.sql.Timestamp;
import java.time.ZoneId;
import java.time.ZonedDateTime;

/*nonmember_ID varchar(30) PK 
 * nonmember_name varchar(20)
nonmember_pw varchar(4)  네자리 숫자만 들어오지만, customer랑 맞춰주려고 Stringㅇ로 만들었다
nonmember_tel int(11)    이건 String으로 만들고 싶지만, customer랑 맞추기 위해(혹시 모르니깐)
nonmember_birth int(11)  6자리 숫자
reg_date datetime*/

public class NonmemberDTO {
	String nonmember_ID;
	String nonmember_name;
	String nonmember_pw; 
	int nonmember_tel;
	int nonmember_birth;
	Timestamp reg_date;
	
	
	public NonmemberDTO(String nonmember_ID, String nonmember_name, String nonmember_pw, int nonmember_tel,
			int nonmember_birth, Timestamp reg_date) {
		this.nonmember_ID = nonmember_ID;
		this.nonmember_name = nonmember_name;
		this.nonmember_pw = nonmember_pw;
		this.nonmember_tel = nonmember_tel;
		this.nonmember_birth = nonmember_birth;
		//this.reg_date=reg_date;
		setReg_date(reg_date);
	}


	public NonmemberDTO(String nonmember_name, String nonmember_pw, int nonmember_tel, int nonmember_birth) {
		this.nonmember_name = nonmember_name;
		this.nonmember_pw = nonmember_pw;
		this.nonmember_tel = nonmember_tel;
		this.nonmember_birth = nonmember_birth;
	}


	public String getNonmember_ID() {
		return nonmember_ID;
	}


	public void setNonmember_ID(String nonmember_ID) {
		this.nonmember_ID = nonmember_ID;
	}


	public String getNonmember_name() {
		return nonmember_name;
	}


	public void setNonmember_name(String nonmember_name) {
		this.nonmember_name = nonmember_name;
	}


	public String getNonmember_pw() {
		return nonmember_pw;
	}


	public void setNonmember_pw(String nonmember_pw) {
		this.nonmember_pw = nonmember_pw;
	}


	public int getNonmember_tel() {
		return nonmember_tel;
	}


	public void setNonmember_tel(int nonmember_tel) {
		this.nonmember_tel = nonmember_tel;
	}


	public int getNonmember_birth() {
		return nonmember_birth;
	}


	public void setNonmember_birth(int nonmember_birth) {
		this.nonmember_birth = nonmember_birth;
	}


	public Timestamp getReg_date() {
		return reg_date;
	}


	public void setReg_date(Timestamp reg_date) {
		ZoneId seoulZoneId = ZoneId.of("Asia/Seoul");
		reg_date=Timestamp.valueOf(ZonedDateTime.now(seoulZoneId).toLocalDateTime());
		//this.reg_date = reg_date;
	}
	
}
