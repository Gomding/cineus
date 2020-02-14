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

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  
  
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
.btn-primary2:hover{color:white;}
</style>
  
<title>비회원 로그인</title>
	<!-- 헤더가 들어가는 곳 -->
	<jsp:include page="/inc/header.jsp"/>
	<!-- 헤더가 들어가는 곳 -->
    <!-- </head>
		 <body> -->
	<br><br><br><br><br><br>
<div class="container mt-5 mb-4" id="container">
	<div class="row">
		<div class="col col-3 pr-0"></div>
		<div class="col col-6" id="left">
			<form id="f_identify" action="${context}/nonmember/login.do" method="post">
				<table>
					<!-- <tr>
						<td>이름</td>
						<td><input type="text" class='form-control form-control-sm _identify' name="i_name" id="i_name" placeholder="이름"></td>
					</tr>-->
					<tr>
						<td>생년월일</td>
						<td><input type="text" class='form-control form-control-sm _identify' name="i_birth" id="i_birth" placeholder="생년월일 8자리"></td>
					</tr>
					<tr>
						<td>휴대폰번호</td>
						<td><input type="text" class='form-control form-control-sm _identify' name="i_phone" id="i_phone" placeholder="-없이 입력"></td>
					</tr>
					
					<tr>
						<td>비밀번호</td>
						<td><input type="password" placeholder="비밀번호(숫자 4자리)" class='form-control form-control-sm _identify' name="i_pass" id="i_pass"  maxlength="4" ></td>
					</tr>
					<tr>
						<td>
						</td>
						<td id="red_message" style="color:red;">
						</td>
					</tr>
					
				</table>
				<div class="row pl-3 pr-3 pt-3 pb-4">
					※ 비회원 정보 오 입력 시 예매 내역 확인/취소 및 티켓 발권이 어려울 수 있으니 다시 한번 확인해 주시기 바랍니다.</td>
				</div>
				<div class="row">
					<!-- <div class="col col-6">
						<button class="btn btn-block" id="btn_back">뒤로가기</button>
						<script>
								$("#btn_back").on("click",function(){
									window.history.back();
								});
							</script>
					</div> -->
					<div class="col col-12">
						<button type="submit" class="btn btn-primary2 btn-block" id="i_submit" disabled>확인</button>
						
					</div>
				
				</div>
			</form> <!-- form 끝 -->
		</div><!--.col-->
	</div><!-- .row -->
</div><!-- .container 끝 --> 	 

	<br><br><br><br><br><br><br>
	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->
	
	  
	  <script type="text/javascript" src="${context}/js/jquery.splendid.textchange.js"></script>
	  <script>
		  $("._identify").on("textchange",function(){
		  	  /* var val1=$("#i_name").val().trim(); */
		  	  var val2=$("#i_birth").val().trim();
		  	  var val3=$("#i_phone").val().trim();
		  	  var val4=$("#i_pass").val().trim();
			  if(val2!="" && val3!="" && val4!=""){
				//일단 전화번호만 확인한다.
				  var regExp = /^\d{3}(\d{3,4})\d{4}$/; 
				  if(regExp.test(val3)){
				  	$("#i_submit").prop("disabled",false);
				  	$("#red_message").text("");
				  }
				  else{
					  $("#red_message").text("휴대폰 번호를 정확하게 입력하세요.");
				  }
			  }
			  else{
				  $("#i_submit").prop("disabled",true);
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
		  $("#i_pass").on("textchange",function(){
			  var val1=$(this).val().trim(); 
			  var regExp=/\d{4}/;
			  if(regExp.test(val1)){
				  	$("#red_message").text("");
			  }
			  else{
			  		$("#red_message").text("비밀번호를 정확하게 입력하세요.");
			  }
		  });
		  
	</script>

</body>
</html>