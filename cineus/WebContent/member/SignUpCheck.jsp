<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-Latest.js"></script>
<script type="text/javascript">


//아이디 유효성 확인	
function idCheck(){
	var getCheck= RegExp(/^[가-힣a-zA-Z0-9]{3,12}$/);
	
	if($("#userid").val() == ""){
		$("#idCheck").show();	
		$("#idCheck2").hide();
		$("#idCheck3").hide();
		$("#idCheck4").hide();
	}else if(getCheck.test($("#userid").val()) == false){
		$("#idCheck2").show();	
		$("#idCheck").hide();
		$("#idCheck3").hide();
		$("#idCheck4").hide();
		$("#userid").val("");
	}else{
		$("#idCheck").hide();
		$("#idCheck2").hide();
		$("#idCheck3").hide();
		$("#idCheck4").hide();
	}	
	return false;
};


//아이디 중복 체크
function ucheck(){
	var _uid = $("#userid").val();	

	$.ajax(
			{
				type:"post", 
				async:false, 
				url:"${pageContext.request.contextPath}/members/memberCheck.me", 
				dataType:"text", 
				data:{uid:_uid}, 
				success:function(data,textStatus){ 
					
					if(data == "not_usable"){ //중복
					
						$("#idCheck3").show();
						$("#idCheck4").hide();
						$("#userid").val("");
						
					}else if(data == "usable"){ //사용가능
						 $("#idCheck4").show(); 
						 $("#idCheck3").hide();
					
					}			
					
				},
				error:function(data,textStatus){ //작업중 오류가 발생했을때 수행할 작업을 설정
					alert("에러가 발생 했습니다.");
				}
			}
		  );
	
}



//비밀번호 유효성 확인	
function pwdCheck(){
	var getCheck2= RegExp(/^[a-zA-Z0-9]{8,16}$/);
	if($("#userpwd").val() == ""){
		$("#pwdCheck").show();	
		$("#pwdCheck2").hide();
	}else if(getCheck2.test($("#userpwd").val()) == false){
		$("#pwdCheck2").show();	
		$("#pwdCheck").hide();
		$("#userpwd").val("");
	}else{
		$("#pwdCheck").hide();
		$("#pwdCheck2").hide();
	}	
	return false;	
};


//비밀번호 재확인의 유효성 + 비밀번호와 비밀번호 재확인의 값이 동일한지 확인
function pwdCheck2(){		
	if($("#userpwd2").val() == ""){
		$("#pwdCheckA").show();	
		$("#pwdCheckB").hide();
	}else if($("#userpwd").val() != $("#userpwd2").val()){
		$("#pwdCheckB").show();	
		$("#pwdCheckA").hide();
		$("#userpwd2").val("");
	}else{
		$("#pwdCheckA").hide();
		$("#pwdCheckB").hide();
	}	
	return false;
};


//이름의 유효성 확인
function nameCheck(){
	var getCheck3 = RegExp(/^[가-힣]{2,5}$/);
	if($("#username").val() == ""){
		$("#nameCheck").show();	
		$("#nameCheck2").hide();
	}else if(getCheck3.test($("#username").val()) == false){
		$("#nameCheck2").show();	
		$("#nameCheck").hide();
		$("#username").val("");
	}else{
		$("#nameCheck").hide();
		$("#nameCheck2").hide();
	}	
	return false;
};





//이메일의 유효성 확인
function emailCheck(){
	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	if($("#useremail").val() == ""){
		$("#emailCheck4").show();
		$("#emailCheck").hide();
		$("#emailCheck2").hide();
		$("#emailCheck3").hide();
	}else if(getMail.test($("#useremail").val()) == false){
		$("#emailCheck").show();
		$("#emailCheck2").hide();
		$("#emailCheck3").hide();
		$("#emailCheck4").hide();
		$("#useremail").val("");
	}else if($("#useremail").val() == $("#emailhidden").val()){
		$("#emailCheck2").show();
		$("#emailCheck").hide();
		$("#emailCheck3").hide();
		$("#emailCheck4").hide();
	}else if($("#useremail").val() != $("#emailhidden").val()){
		$("#emailCheck3").show();
		$("#emailCheck").hide();
		$("#emailCheck2").hide();
		$("#emailCheck4").hide();
		return false;
	}
};


//이메일 인증요청
function sendEmail() {
		window.open("authMail.me?to=" + useremail.value, "인증페이지", "width=450, height=150");
	}
	

//연락처 유효성 확인	
function telcheck(){
	var getCheck= RegExp(/^[0-9]{11}$/);
	
	if($("#usertel").val() == ""){
		$("#telCheck").show();	
		$("#telCheck2").hide();
		$("#telCheck3").hide();
		$("#telCheck4").hide();
	}else if(getCheck.test($("#usertel").val()) == false){
		$("#telCheck2").show();	
		$("#telCheck").hide();
		$("#telCheck3").hide();
		$("#telCheck4").hide();
		$("#usertel").val("");
	}else{
		$("#telCheck").hide();
		$("#telCheck2").hide();
		$("#telCheck3").hide();
		$("#telCheck4").hide();
	}	
	return false;
};



//연락처 중복 체크
function utelcheck(){
	var _utel = $("#usertel").val();	

	$.ajax(
			{
				type:"post", 
				async:false, 
				url:"${pageContext.request.contextPath}/members/membertelCheck.me", 
				dataType:"text", 
				data:{utel:_utel}, 
				success:function(data,textStatus){ 
					
					if(data == "not_usable"){ //중복
					
						$("#telCheck3").show();
						$("#telCheck4").hide();
						$("#usertel").val("");
						
					}else if(data == "usable"){ //사용가능
						 $("#telCheck4").show(); 
						 $("#telCheck3").hide();
					
					}			
					
				},
				error:function(data,textStatus){ //작업중 오류가 발생했을때 수행할 작업을 설정
					alert("에러가 발생 했습니다.");
				}
			}
		  );
	
}
</script>