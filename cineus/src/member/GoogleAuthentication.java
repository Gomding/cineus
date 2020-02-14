package member;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthentication extends Authenticator {
	PasswordAuthentication passAuth;
	
	public GoogleAuthentication() {
		passAuth = new PasswordAuthentication("mealkit534", "cksyeaajqktlkqqb");
	}
	
	public PasswordAuthentication getPasswordAuthentication(){
		return passAuth;
	}
}