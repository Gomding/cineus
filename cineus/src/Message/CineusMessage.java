package Message;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Random;

import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
/**
 * Servlet implementation class CineusMessage
 */
@WebServlet("/CineusMessage/*")
public class CineusMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	String api_key = "NCSWUHD2RHQVG9WF";
    String api_secret = "LIL5LNC8VLOI88QXWD0WR0NH1E6ZOYSP";
    String from="01028009271"; //
	
	HttpServletRequest request;
	HttpServletResponse response;
	
	String next_page;	//initial value : null
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.request=req;
		this.response=resp;
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String action=request.getPathInfo().substring(1);
		System.out.println(action);
		
		switch(action){ // all ajax
			case "SendIdentificationMsg.do":
				SendIdentificationMsg();
				break;
		} //switch
	}
	
	//01028009271
	//01054681794
	//01071678343
	//01088260120
	//01027721460
	
	public void SendIdentificationMsg(){
		String name=request.getParameter("name");
		/*String birth=request.getParameter("birth");*/
		String to=request.getParameter("phone");
		String rnum=String.format("%04d",new Random().nextInt(10000));
		/*Declaration : 
		  public int nextInt(int n)
		  Parameters : 
		  	n :  This is the bound on the random number to be returned. Must be positive.
		  Return Value : 
			Returns a random number.
			between 0 (inclusive) and n (exclusive).
		*/
		String text="인증번호는 "+rnum+"입니다.";
		SendMsg(name, to, text);
	    
		try {
			PrintWriter out;
			out = response.getWriter();
			out.write(String.valueOf(rnum));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public void SendMsg(String name, String to, String text){
		
		/*String to="01028009271, 01054681794, 01071678343, 01088260120, 01027721460";
		 * 번호 여러개 넣으면 여러개 간다.
		 * */
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", to); // 수신번호
	    params.put("from", from); // 발신번호
	    params.put("type", "SMS"); // Message type ( SMS, LMS, MMS, ATA )
	    params.put("text", "[CINEUS] "+name+"님 "+text); // 문자내용    
	    params.put("app_version", "JAVA SDK v1.2"); // application name and version
	    
	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	      
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	    
	} /*SendMsg 끝*/
	
	
} //.CineusMessage

