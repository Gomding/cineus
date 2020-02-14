<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>   
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="context" value="${pageContext.request.contextPath}" />

<%request.setCharacterEncoding("UTF-8");
%>    
<%response.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8"); %>
<html>
<head>
<style type="text/css">
#container{
	font-color:black;
	font-size:16px;
	max-width:1100px;
}
#container b{
	font-weight:700;
}
#left table, #right table{
	width:100%;
}
#left{
	padding-left:0px;
}
#right{
	padding-right:0px;
}
.btn-primary2 {background-color: #1F0DA8; border-color: #1F0DA8; color: #FFF; !important;}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	
	
	 <!-- 타이머 -->
 <script> 
        //set minutes 
        var mins = 1; 
  		var myTimer=null;
        //calculate the seconds 
        var secs = mins * 60; 
  
        //countdown function is evoked when page is loaded 
        function countdown() { 
        	myTimer=setTimeout('Decrement()', 60); 
        } 
        function countdownStop(){
        	clearInterval(myTimer);
        }
  
        //Decrement function decrement the value. 
        function Decrement() { 
        	if(sessionStorage.getItem('identification_complete')==='true'){
        		return;
        	}
        		
        		if(document.getElementById) { 
                minutes = document.getElementById("minutes"); 
                seconds = document.getElementById("seconds"); 
  
                //if less than a minute remaining 
                //Display only seconds value. 
                if (seconds < 59) { 
                    seconds.value = secs; 
                } 
  
                //Display both minutes and seconds 
                //getminutes and getseconds is used to 
                //get minutes and seconds 
                else { 
                    minutes.value = getminutes(); 
                    seconds.value = getseconds(); 
                } 
                //when less than a minute remaining 
                //colour of the minutes and seconds 
                //changes to red 
                if (mins < 1) { 
                    minutes.style.color = "red"; 
                    seconds.style.color = "red"; 
                } 
                //if seconds becomes zero, 
                //then page alert time up 
                if (mins < 0) { 
                    alert('시간초과 - 처음부터 다시 진행하세요.');
                    sessionStorage.removeItem('identification_number');
	                sessionStorage.removeItem('identification_complete');
                    minutes.value = 0; 
                    seconds.value = 0;
                    
                    location.href="${context}/reservation/getPayPage.do";
                    /* location.href="${context}/views/customer/nonmember-login.jsp"; */
                   
                } 
                //if seconds > 0 then seconds is decremented 
                else { 
                    secs--; 
                    setTimeout('Decrement()', 1000); 
                } 
            }
        } 
  
        function getminutes() { 
            //minutes is seconds divided by 60, rounded down 
            mins = Math.floor(secs / 60); 
            return mins; 
        } 
  
        function getseconds() { 
            //take minutes remaining (as seconds) away  
            //from total seconds remaining 
            return secs - Math.round(mins * 60); 
        } 
        
</script>
 <!-- 타이머 끝-->
 
 
 <%
String i_schedule_id=request.getParameter("i_schedule_id");
String i_movie_id=request.getParameter("i_movie_id");
String i_title=request.getParameter("i_title");
String i_theater_name=request.getParameter("i_theater_name");
String i_screen_id=request.getParameter("i_screen_id");
String i_schedule_date=request.getParameter("i_schedule_date");
String i_start_at=request.getParameter("i_start_at");
String i_end_at_accurate=request.getParameter("i_end_at_accurate");
String i_theater_id=request.getParameter("i_theater_id");


%>

	
  
<title>비회원 로그인</title>
	<!-- 헤더가 들어가는 곳 -->
	<jsp:include page="/inc/header.jsp"/>
	<!-- 헤더가 들어가는 곳 -->
    <!-- </head>
		 <body> -->
	<br><br><br><br>
<div class="container" id="container">
	<div class="row">
		<div class="col col-6" id="left">
			<form id="f_identify" action="${context}/reservation/getPayPage.do" method="post">
				<table>
					<tr>
						<td>이름</td>
						<td colspan="2"><input type="text" class='form-control form-control-sm _identify' name="i_name" id="i_name" placeholder="이름"></td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td colspan="2"><input type="text" class='form-control form-control-sm _identify' name="i_birth" id="i_birth" placeholder="생년월일 8자리"></td>
					</tr>
					<tr>
						<td>휴대폰번호</td>
						<td><input type="text" class='form-control form-control-sm _identify' name="i_phone" id="i_phone" placeholder="-없이 입력"></td>
						<td><button type="button" class="btn btn-block btn-sm" id="btn_identify" disabled>인증요청</button></td>
						<script>
							$("#btn_identify").on("click",function(){
								$.ajax({
									  url:'${context}/CineusMessage/SendIdentificationMsg.do',
									  type:'post',
										data: {'name' : $("#i_name").val(), 
											'birth': $("#i_birth").val(),
											'phone': $("#i_phone").val()
										},
										/* dataType: "json", */
										error:function(jqXHR, textStatus, errorThrown){
											alert("오류발생 : 다시 시도하세요.");
										},
									 	 success: function(data){
							                alert("인증번호가 발송되었습니다. 1분안에 인증을 완료하세요.");
							                countdown();
							             // Remove saved data from sessionStorage
							                sessionStorage.removeItem('identification_number');
							                sessionStorage.removeItem('identification_complete');
							             // Save data to sessionStorage
							                sessionStorage.setItem('identification_number', data);
							             //	sessionStorage.setItem('itentification_time', new Date().getTime());
							             // ㄴ일단 자바스크립트에 맡긴다.
							             
							             // Get saved data from sessionStorage
							                //sessionStorage.getItem('identification_number');
							                $("#btn_identify_confirm").prop("disabled",false);
									 	}
								});
							});
						</script>
						
					</tr>
					<tr>
						<td>인증번호</td>
						<td><input type="text" class='form-control form-control-sm' id="i_identify_num"></td>    
						<td><button type="button" class="btn btn-block btn-sm" id="btn_identify_confirm" disabled>확인</button></td>
						<script>
							
							
							$("#btn_identify_confirm").on("click",function(){
								
								if($("#i_identify_num").val()==sessionStorage.getItem('identification_number')){
									//clearInterval(myTimer); /* countdownStop(); 왜 안되지?? */
									
									sessionStorage.setItem('identification_complete',true);
									alert("인증이 완료되었습니다.");
									
									$("._identify").prop("readonly",true);
									$(this).prop("disabled",true);
									$("#btn_identify").prop("disabled",true);
									$("#btn_identify_confirm").prop("disabled",true);
									$("#btn_identify_num").prop("disabled",true);
									$("#i_identify_num").prop("disabled",true);
								}
								else{
									alert("인증번호가 틀렸습니다.");
								}
							});
						</script>
					<tr>
						<td></td>
						<td colspan="2">
							남은 시간 
			       			 <input id="minutes" type="text" style="width: 10px; 
			          		   border: none; font-size: 16px;  
			          		  font-weight: bold; color: black;background-color:white;" disabled> :  
			       			 <input id="seconds" type="text" style="width: 20px; 
			                  border: none; font-size: 16px; 
			                   font-weight: bold; color: black;background-color:white;" disabled>
						
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td colspan="2"><input type="password" placeholder="비밀번호(숫자 4자리)" class='form-control form-control-sm' name="i_pass_1" id="i_pass_1"  maxlength="4" ></td>
					</tr>
					<tr>
						<td>비밀번호확인</td>
						<td colspan="2"><input type="password" placeholder="비밀번호(숫자 4자리 확인)" class='form-control form-control-sm' id="i_pass_2"  maxlength="4" ></td>
					</tr>
					<tr>
						<td>
						</td>
						<td colspan="2" id="red_message" style="color:red;">
						</td>
					</tr>
				</table>
				
					<input type="hidden" name="i_schedule_id" value="<%=i_schedule_id%>">
		  		  <input type="hidden" name="i_movie_id" value="<%=i_movie_id%>">
		  		  <input type="hidden" name="i_title" value="<%=i_title%>">
		  		  <input type="hidden" name="i_theater_name" value="<%=i_theater_name%>">
		  		  <input type="hidden" name="i_screen_id" value="<%=i_screen_id%>">
		  		  <input type="hidden" name="i_schedule_date" value="<%=i_schedule_date%>">
		  		  <input type="hidden" name="i_start_at" value="<%=i_start_at%>">
		   		 <input type="hidden" name="i_end_at_accurate" value="<%=i_end_at_accurate%>">
		   		 <input type="hidden" name="i_theater_id" value="<%=i_theater_id%>">
				 <%
				 for(int i=1 ; i<=8 ; i++){ //티켓 최대 개수 8개
					 	String tmp=request.getParameter("i_seat_"+i);
						if(tmp=="null")
							break;
						else{
							%>
							<input type="hidden" name="i_seat_<%=i%>" value="<%=tmp%>">
							<%
						}
					}
				 %>
				
				
			</form> <!-- form 끝 -->
			
		</div>
		<div class="col col-6" id="right">
			<div style="border:solid #ccc 1px; border-radius:10px;">
				<table class="table">
					<tr class="border_bottom">
						<td><b>비회원예매 개인정보 처리방침</b></td>
					</tr>
					<tr>
						<td>
							<b>수집목적</b> 비회원예매 서비스 제공 / 이용자식별 / 구매 및 결제<br>
							<b>수집항목</b> 이름, 생년월일, 휴대폰번호, 비밀번호<br>
							<b>보유기간</b> 관람 또는 취소 후 7일 이내<br>
						</td>
					</tr>
					<tr>
						<td>
							<div class="form-check-inline">
								<label class="form-check-label">
									<input type="radio" class="form-check-input" name="i_agree" value="1">동의
								</label>
							</div>
							<div class="form-check-inline">
								<label class="form-check-label">
									<input type="radio" class="form-check-input" name="i_agree" value="2">미동의
								</label>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							* 정보수집에 동의를 거부할 수 있으며, 동의하지 않을 경우 비회원 예매서비스를 이용하실 수 없습니다.
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div><!-- .row -->
	<div class="row">
		<div class="col col-3">
		</div>
		<div class="col col-3 mt-5">
			<button class="btn btn-block" id="btn_back">뒤로가기</button>
			<script>
				$("#btn_back").on("click",function(){
					window.history.back();
				});
			</script>
		</div>
		<div class="col col-3 mt-5">
			<button class="btn btn-primary2 btn-block" id="i_submit" disabled>확인</button>
		</div>
		<div class="col col-3">
		</div>
	</div>
</div><!-- .container 끝 --> 	 

	<br><br><br><br>
	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->
	
	  
	  <script type="text/javascript" src="${context}/js/jquery.splendid.textchange.js"></script>
	  <script>
		  $("._identify").on("textchange",function(){
		  	  var val1=$("#i_name").val().trim();
		  	  var val2=$("#i_birth").val().trim();
		  	  var val3=$("#i_phone").val().trim();
			  if(val1!="" && val2!="" && val3!=""){
				//일단 전화번호만 확인한다.
				  var regExp = /^\d{3}(\d{3,4})\d{4}$/; 
				  if(regExp.test(val3)){
				  	$("#btn_identify").prop("disabled",false);
				  	$("#red_message").text("");
				  }
				  else{
					  $("#red_message").text("휴대폰 번호를 정확하게 입력하세요.");
				  }
			  }
			  else{
				  $("#btn_identify").prop("disabled",true);
			  }
		  });
		  $("#i_birth").on("textchange",function(){
			  var val1=$(this).val().trim();
			  var regExp=/\d{8}/;
			  if(regExp.test(val1)){
				  	$("#red_message").text("");
			  }
			  else{
			  		$("#red_message").text("생년월일을 정확하게 입력하세요.");
			  }
		  });
		  $("#i_pass_1").on("textchange",function(){
			  var val1=$(this).val().trim();
			  var regExp=/\d{4}/;
			  if(regExp.test(val1)){
				  	$("#red_message").text("");
			  }
			  else{
			  		$("#red_message").text("비밀번호를 정확하게 입력하세요.");
			  }
		  });
		  $("#i_pass_2").on("textchange",function(){
			  var val1=$("#i_pass_1").val().trim();
			  var val2=$(this).val().trim();
			  if(val1===val2){
				  	$("#red_message").text("");
				  	if(val2.length==4 && 
				  			sessionStorage.getItem('identification_complete')==='true' &&
				  			$('input[name="i_agree"]:checked').val()==="1"){
				  		$("#i_submit").prop("disabled",false);
				  	}
				  	else{
				  		$("#i_submit").prop("disabled",true);
				  	}
			  }
			  else{
			  		$("#red_message").text("비밀번호가 다릅니다.");
			  		$("#i_submit").prop("disabled",true);
			  }
		  });
		  $('input[name="i_agree"]').on("click",function(){
			  var val1=$("#i_pass_1").val().trim();
			  var val2=$("#i_pass_2").val().trim();
			  if(val1===val2 
					  && val2.length==4 && 
				  			sessionStorage.getItem('identification_complete')==='true' &&
				  			$('input[name="i_agree"]:checked').val()==="1"){
				  		$("#i_submit").prop("disabled",false);
			  }
			  else{
			  		$("#i_submit").prop("disabled",true);
			  }
		  });
		  
		  $("#i_submit").on("click",function(){
			  sessionStorage.removeItem('identification_number');
              sessionStorage.removeItem('identification_complete');
              
              var result=alert("티켓발권을 위한 입력정보를 확인해 주세요. 이름 : "+$("#i_name").val()
            		  +", 생년월일 : "+$("#i_birth").val()+", 휴대폰번호 : "
            		  +$("#i_phone").val());
             
              
            	  /********회원가입 처리 **************/
					$.ajax({
						url:'${context}/nonmember/join_ajax.do',
						type:'post',
						async:false,
						data:$("#f_identify").serialize(),
						contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
						error:function(jqXHR, textStatus, errorThrown){
							alert(errorThrown);
						},
						success:function(data){
							if(data=="true"){
								alert("등록 성공");
								$("#f_identify").submit();
							}
							else{ 
								alert("등록 실패. 처음부터 다시 진행하세요.");
								location.href="${context}/schedule/getSchedule_movie.do";
							}
						}//success
					});  //ajax
            
					
              // 처음에는 confirm 으로 확인/취소 가능하게 했는데
              // 취소했을 때 예매정보처리가 귀찮아서 그냥 없앰 
	   });
	</script>

</body>
</html>