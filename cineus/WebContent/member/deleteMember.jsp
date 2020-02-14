<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<c:set var="mbean" value="${mbean}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
#mar{margin-top: 2%; width: 1100px;}
.center-home {list-style:none;margin:0 auto;padding:0;width:970px;height:28px;font-weight:bold;}
.center-home-div {background-color:#f2f2f2;border-top:1px solid #e1e1e1; margin-top:105px;}
.center-text {color:#1f0da8; margin-top: 8px;}
.center-home-line {height:3px;background-color:#1f0da8; margin-top: 8px;}
.btn-primary2 {background-color: #1F0DA8; border-color: #1F0DA8; color: #FFF; !important;}
</style>
<%
	String id = (String)session.getAttribute("id");
%>
<script src="https://code.jquery.com/jquery-Latest.js"></script>
<script type="text/javascript">

//회원탈퇴
function deleteMember(){
	var Did = $("#Did").val();
	var deletePassword = $("#deletePassword").val();
	var Cdelete = $("#Cdelete").val();

	$.ajax(
			{
				type:"post", 
				async:false, 
				url:"${pageContext.request.contextPath}/members/memberDelete.me", 
				dataType:"text", 
				data:{
					Did : Did,
					deletePassword : deletePassword,
					Cdelete : Cdelete
				}, 
				success:function(Delete){ 
					
					if(Delete == "null"){ //로그인한 아이디와 입력한 비밀번호가 불일치
						$('#dPResult').html("<font color='red'>비밀번호가 일치하지 않습니다.</font>");					
					}else{ //로그인한 아이디와 입력한 비밀번호가 일치
						alert("회원탈퇴가 완료되었습니다.");
						location.href = "${pageContext.request.contextPath}/main.jsp";
					}
				},
				error:function(data,textStatus){
					alert("에러가 발생 했습니다.");
				}
			}
		  );
	
}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴</title>
	<!-- 헤더가 들어가는 곳 -->
	<jsp:include page="../inc/header.jsp"/>
	<!-- </head>
		 <body> -->
		 

	<div class="center-home-div">
		<ul class="container center-home">
			<h5 class="center-text font-weight-bold">회원탈퇴</h5>
		</ul>
		<hr class="center-home-line">
	</div>

	<div class="container" id="mar">
		<h5 style="color: #1f0da8;">[주의] CINEUS 회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</h5>
		<hr style="background-color: #1f0da8; height: 1px;">
		<dl>
			<dt class="text-dark" style="margin-bottom: 10px;">1. 30일간 회원 재가입이 불가능합니다.</dt>
			<dd><i class="fa fa-angle-right"></i> 회원 탈퇴 후, 30일 경과 후 재가입할 수 있습니다.</dd>
		</dl>
		<hr>
		<dl>
			<dt class="text-dark" style="margin-bottom: 10px;">2. 탈퇴 후 삭제 내역 <span>(회원 탈퇴하시면 회원정보와 개인 보유 포인트 등 정보가 삭제되며 데이터는 복구되지 않습니다.)</span></dt>
			<dd><i class="fa fa-angle-right"></i> CINEUS 멤버십 포인트 및 적립/차감 내역</dd>
			<dd><i class="fa fa-angle-right"></i> 관람권 및 쿠폰</dd>
			<dd><i class="fa fa-angle-right"></i> 영화 관람 내역</dd>
			<dd><i class="fa fa-angle-right"></i> 간편 로그인 연동 정보</dd> 
		</dl>
		<hr>
		<dl>
			<dt class="text-dark" style="margin-bottom: 10px;">3. 고객님께서 불편하셨던 점, 아쉬웠던 점을 알려주시면 앞으로 더 나은 모습으로 찾아 뵙겠습니다.</dt>
			<dd><input type="radio"><label><span style="vertical-align: middle; display: inline-block; width: 18px; height: 18px; position: relative;" aria-checked="false" aria-disabled="false"><input type="radio" class="icheck" name="retireType" value="1" checked="" style="position: absolute; top: 0px; left: 0px; display: block; width: 16px; height: 16px; padding: 0px; margin: 0px; background: rgb(255, 255, 255); z-index: 0; border: 0px; opacity: 1;"><ins class="iCheck-helper" style="position:absolute; width:16px; height:16px; top:0px; left:0px; background-color:#fff; z-index:0"></ins></span> 서비스 장애가 잦아서</label></dd>
			<dd><input type="radio"><label><span style="vertical-align: middle; display: inline-block; width: 18px; height: 18px; position: relative;" aria-checked="false" aria-disabled="false"><input type="radio" class="icheck" name="retireType" value="2" style="position: absolute; top: 0px; left: 0px; display: block; width: 16px; height: 16px; padding: 0px; margin: 0px; background: rgb(255, 255, 255); z-index: 0; border: 0px; opacity: 1;"><ins class="iCheck-helper" style="position:absolute; width:16px; height:16px; top:0px; left:0px; background-color:#fff; z-index:0"></ins></span> 이벤트 및 무료서비스 혜택이 적어서</label></dd>
			<dd><input type="radio"><label><span style="vertical-align: middle; display: inline-block; width: 18px; height: 18px; position: relative;" aria-checked="false" aria-disabled="false"><input type="radio" class="icheck" name="retireType" value="3" style="position: absolute; top: 0px; left: 0px; display: block; width: 16px; height: 16px; padding: 0px; margin: 0px; background: rgb(255, 255, 255); z-index: 0; border: 0px; opacity: 1;"><ins class="iCheck-helper" style="position:absolute; width:16px; height:16px; top:0px; left:0px; background-color:#fff; z-index:0"></ins></span> 불만 및 불편사항에 대한 고객응대가 나빠서</label></dd>
			<dd><input type="radio"><label><span style="vertical-align: middle; display: inline-block; width: 18px; height: 18px; position: relative;" aria-checked="false" aria-disabled="false"><input type="radio" class="icheck" name="retireType" value="4" style="position: absolute; top: 0px; left: 0px; display: block; width: 16px; height: 16px; padding: 0px; margin: 0px; background: rgb(255, 255, 255); z-index: 0; border: 0px; opacity: 1;"><ins class="iCheck-helper" style="position:absolute; width:16px; height:16px; top:0px; left:0px; background-color:#fff; z-index:0"></ins></span> 영화관람시 시설 및 가격등의 불만 때문에</label></dd>
			<dd><input type="radio"><label><span style="vertical-align: middle; display: inline-block; width: 18px; height: 18px; position: relative;" aria-checked="false" aria-disabled="false"><input type="radio" class="icheck" name="retireType" value="5" style="position: absolute; top: 0px; left: 0px; display: block; width: 16px; height: 16px; padding: 0px; margin: 0px; background: rgb(255, 255, 255); z-index: 0; border: 0px; opacity: 1;"><ins class="iCheck-helper" style="position:absolute; width:16px; height:16px; top:0px; left:0px; background-color:#fff; z-index:0"></ins></span> 이용빈도가 낮고 개인정보 유출이 우려되어</label></dd>
			<dd><input type="radio"><label><span style="vertical-align: middle; display: inline-block; width: 18px; height: 18px; position: relative;" aria-checked="false" aria-disabled="false"><input type="radio" class="icheck" name="retireType" value="6" style="position: absolute; top: 0px; left: 0px; display: block; width: 16px; height: 16px; padding: 0px; margin: 0px; background: rgb(255, 255, 255); z-index: 0; border: 0px; opacity: 1;"><ins class="iCheck-helper" style="position:absolute; width:16px; height:16px; top:0px; left:0px; background-color:#fff; z-index:0"></ins></span> 탈퇴 후 재가입을 위해</label></dd>
			<dd><input type="radio"><label><span style="vertical-align: middle; display: inline-block; width: 18px; height: 18px; position: relative;" aria-checked="false" aria-disabled="false"><input type="radio" class="icheck mr9" name="retireType" value="7" style="position: absolute; top: 0px; left: 0px; display: block; width: 16px; height: 16px; padding: 0px; margin: 0px; background: rgb(255, 255, 255); z-index: 0; border: 0px; opacity: 1;"><ins class="iCheck-helper" style="position:absolute; width:16px; height:16px; top:0px; left:0px; background-color:#fff; z-index:0"></ins></span> 기타</label> <input type="text" name="retireReason" maxlength="50" style="width: 500px;"></dd>
		</dl>
		<hr>
		<div class="form-group">
			<dl>
				<dt class="text-dark" style="margin-bottom: 10px;">4. 회원님의 비밀번호를 입력하시고 [회원탈퇴] 버튼을 클릭해주세요.</dt>
				<dd style="width: 500px;">
					<label style="margin-right: 15px;">비밀번호</label>
					<input type="password" id="deletePassword" name="deletePassword">
					<div class="float-right">
						<div id="dPResult" class="font-weight-bold"></div>
					</div>
				</dd>
			</dl>
			<hr style="background-color:#e1e1e1; height: 1px;"> 
			<input type="hidden" id="Did" value="${id}">
			<input type="hidden" id="Cdelete" name="Cdelete" value="${mbean.customer_delete}">
			<div class="text-center">
				<input type="button" style="width: 137px; height: 52px;" class="btn btn-secondary" onclick="history.go(-1)" value="취소">
				<input type="button" style="width: 137px; height: 52px;" class="btn btn-primary2" onclick="deleteMember();" value="회원탈퇴">
			</div>
        </div>
	</div>
	
	<!-- 푸터 들어가는 곳 -->
    <jsp:include page="../inc/bottom.jsp"/>
</body>
</html>