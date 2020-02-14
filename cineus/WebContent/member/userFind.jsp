<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-Latest.js"></script>
<script type="text/javascript">

//아이디 찾기
function idFind(){
	var findName = $("#findName").val();
	var findTel = $("#findTel").val();
	var findEmail = $("#findEmail").val();

	$.ajax(
			{
				type:"post", 
				async:false, 
				url:"${pageContext.request.contextPath}/members/idFind.me", 
				dataType:"text", 
				data:{
					findName : findName,
					findTel : findTel,
					findEmail : findEmail
				}, 
				success:function(findId){ 
					
					if(findId == "null"){
						$('#idFindResult').html("<font color='red'>회원 정보가 존재하지 않습니다.</font>");					
					}else{
						$('#idFindResult').html("찾으시는 아이디는 <font color='green'>" + findId + "</font>입니다.");
					}
				},
				error:function(data,textStatus){
					alert("에러가 발생 했습니다.");
				}
			}
		  );
	
}


//비밀번호 찾기
function pwFind(){
	var findpwName = $("#findpwName").val();
	var findpwId = $("#findpwId").val();
	var findpwEmail = $("#findpwEmail").val();

	$.ajax(
			{
				type:"post", 
				async:false, 
				url:"${pageContext.request.contextPath}/members/pwFind.me", 
				dataType:"text", 
				data:{
					findpwName : findpwName,
					findpwId : findpwId,
					findpwEmail : findpwEmail
				}, 
				success:function(findPw){ 
					
					if(findPw == "null"){
						$('#pwFindResult').html("<font color='red'>회원 정보가 존재하지 않습니다.</font>");					
					}else{
						$('#pwFindResult').html("<font color='green'>비밀번호가 이메일로 전송되었습니다.</font>");						
					}
					
				},
				error:function(data,textStatus){
					alert("에러가 발생 했습니다.");
				}
			}
		  );
	
}
</script>

<style type="text/css">
#mar{width: 970px; margin: 0 auto; overflow-x: auto; min-height: 680px;}
.btn-primary2 {background-color: #1F0DA8; border-color: #1F0DA8; color: #FFF; !important;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID/PW 찾기</title>
	<!-- 헤더가 들어가는 곳 -->
	<jsp:include page="/inc/header.jsp"/>
	<!-- 헤더가 들어가는 곳 -->
    <!-- </head>
		 <body> -->
<div class="container" id="mar" style="margin-top: 100px;">
	<div style="margin: 70px auto; position: relative;">
		<div style="color: #666; font-size: 20px;" class="font-weight-bold">아이디 / 비밀번호 찾기</div>
		<div style="border: 1px solid #e1e1e1; padding: 25px 25px 25px 25px;">
			<p style="font-size: 13px;">
				아이핀을 이용하여 회원에 가입하신 경우에는 회사가 회원님의 주민등록번호를 보유하고 있지 않은 관계로, 아이핀 등록기관의
				실명확인 및 본인인증 서비스와 연계하여 아이디 및 패스워드 찾기 서비스가 제공되오니 참고하여 주시기 바랍니다. (실명확인
				및 본인인증서비스 제공 기관 : 나이스신용평가정보㈜)<br>본인인증 시 제공되는 정보는 해당 인증기관에서 직접
				수집 하며, 인증 이외의 용도로 이용 또는 저장하지 않습니다.
			</p>
			<p style="font-size: 13px; margin-bottom: 0px;">
				* 이용안내 <span>고객센터 > 1:1</span>문의 또는 <span>ARS 1544-0070</span>
				(09:00~21:00)
			</p>
		</div>
	</div>
	<div>
		<div class="form-group float-left" style="width: 440px;">
			<div class="input-group">
				<div style="color: #666; font-size: 20px;" class="font-weight-bold">아이디 찾기</div>
					<form style="padding: 25px 25px 25px 25px;">
						<div class="inputs">
							<label style="width: 133px;" class="text-dark">이름</label>
							<input type="text" id="findName" name="findName" style="width: 199px;" maxlength="5" required />
						</div>
						<div class="inputs">
							<label style="width: 133px;" class="text-dark">연락처</label>
							<input type="tel" id="findTel" name="findTel" style="width: 199px;" maxlength="11" required />
						</div>
						<div class="inputs">
							<label style="width: 133px;" class="text-dark">이메일</label>
							<input type="email" id="findEmail" name="findEmail" style="width: 199px;" maxlength="30" required />
						</div>
						<div class="inputs">
						</div>
						<hr>
						<div>
							<div class="float-left">
								<div id="idFindResult" class="float-left font-weight-bold"></div>
							</div>
							<div>
								<input type="button" class="float-right btn-primary2" style="width: 66px;" onclick="idFind();" value="확인">
							</div>
						</div>
					</form>
			</div>
		</div>
		
		<div class="form-group float-right" style="width: 440px;">
			<div class="input-group">
				<div style="color: #666; font-size: 20px;" class="font-weight-bold">비밀번호 찾기</div>
				<div style="padding: 25px 25px 25px 25px;">
					<div class="inputs">
						<label style="width: 133px;" class="text-dark">이름</label>
						<input type="text" id="findpwName" style="width: 199px;" maxlength="30" required />
					</div>
					<div class="inputs">
						<label style="width: 133px;" class="text-dark">아이디</label>
						<input type="text" id="findpwId" style="width: 199px;" maxlength="30" required />
					</div>
					<div class="inputs">
						<label style="width: 133px;" class="text-dark">이메일</label>
						<input type="email" id="findpwEmail" style="width: 199px;" maxlength="30" required />
					</div>
					<hr>
					<div>
						<div class="float-left">
							<div id="pwFindResult" class="float-left font-weight-bold"></div>
						</div>
						<div>
							<input type="button" class="float-right btn-primary2" style="width: 66px;" onclick="pwFind();" value="확인">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



</div>

<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->
</body>
</html>