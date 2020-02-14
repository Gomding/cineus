<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
    
<%request.setCharacterEncoding("UTF-8");
%>    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
#mar{margin-top: 10%; width: 500px; min-height: 584px;}
.btn-primary2 {background-color: #1F0DA8; border-color: #1F0DA8; color: #FFF; !important;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<title>로그인</title>
	<!-- 헤더가 들어가는 곳 -->
	<jsp:include page="/inc/header.jsp"/>
	<!-- 헤더가 들어가는 곳 -->
    <!-- </head>
		 <body> -->
		 
<div class="container" id="mar">

	<div class="form-group">
          <form action="${pageContext.request.contextPath}/members/Memberlogin.me" method="post" id="login">
          
            <div class="form-group">
              <div class="input-group">
                <input type="text" class="form-control" id="loginid" name="id" placeholder="아이디" required>
              </div>
            </div>           
            
		    <div class="form-group">
		      <div class="input-group">
		        <input type="password" class="form-control" id="loginpwd" name="pwd" placeholder="비밀번호" required>
		      </div>
		    </div>

          
			<div class="form-group justify-content-center">
				<button type="submit" class="btn btn-primary2" style="width:460px;">로그인</button>	
			</div>
		    
          </form>
	</div>
	
	<div class="form-group" align="center" id="findIdPw">
			<hr class="float-left" style="width: 460px;">
			<a href="${pageContext.request.contextPath}/members/userFind.me" class="text-dark">ID/PW 찾기</a>
			<span class="bar" aria-hidden="true">&nbsp;|&nbsp;</span>
 			<a href="${pageContext.request.contextPath}/members/SignUp.me" class="text-dark">회원가입</a>
 			<!-- 20200210 jin 추가 -->
 			<span class="bar" aria-hidden="true">&nbsp;|&nbsp;</span>
 			<a href="#" class="text-dark" id="nonmember-more-btn">비회원 예매확인</a>	
 			<script>
 				$("#nonmember-more-btn").on("click",function(){
 					window.location.href = "${context}/views/customer/nonmember-login.jsp";
 				});
 			</script>
 			<!-- 20200210 jin 추가 끝-->				
	</div>
    
    <!-- 카카오톡 로그인 -->
    <div class="form-group" align="center">					
	    <a id="kakao-login-btn"></a>
	</div>		
	<script type='text/javascript'>

	    // 사용할 앱의 JavaScript 키
	    Kakao.init('1bd6935444f3088d5be31ee6a2852920');
	    // 카카오 로그인 버튼을 생성합니다.
	    Kakao.Auth.createLoginButton({
	      container: '#kakao-login-btn',
	      success: function(authObj) {
	        Kakao.API.request({
	            url: '/v1/user/me',
	            success: function(res) {

	             var userID = res.id;      //유저의 카카오톡 고유 id
	             var userEmail = res.kaccount_email;   //유저의 이메일
	             var userNickName = res.properties.nickname; //유저가 등록한 별명
	             
	             $.ajax(
	         			{
	         				type:"post", 
	         				async:false, 
	         				url:"${pageContext.request.contextPath}/members/Kakaologin.me", 
	         				dataType:"text", 
	         				data:{
	         					userNickName : userNickName,
	         					userEmail : userEmail,
	         					userID : userID
	         				}, 
	         				success:function(data){ 		         					
	         					location.href = "${pageContext.request.contextPath}/index.home";
	         				},
	         				error:function(data,textStatus){
	         					alert("에러가 발생 했습니다.");
	         				}
	         			}
	         		  );

	            },
	             fail: function(error) {
	                 alert(JSON.stringify(error));
	                }
	               });
	      },
	      fail: function(err) {
	         alert(JSON.stringify(err));
	      }
	    });

	</script>
	 
  <!-- 네이버아이디로로그인 버튼 노출 영역 -->
  <div class="form-group" align="center">
  	<div id="naver_id_login"></div>
  </div>
  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
  
  <script type="text/javascript">
  	var naver_id_login = new naver_id_login("uOJVRpduguQNBEwrLJXV", "http://192.168.2.19:8090/cineus/index.home");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("green", 3, 50);
  	naver_id_login.setDomain("http://192.168.2.19:8090");
  	naver_id_login.setState(state);
  	//naver_id_login.setPopup(); //팝업 선택 여부
  	naver_id_login.init_naver_id_login();
  </script>

</div> 	 
	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->
</body>
</html>