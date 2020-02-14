<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<c:set var="mbean" value="${mbean}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
#mar{margin-top: 3%; width: 500px;}
.center-home {list-style:none;margin:0 auto;padding:0;width:970px;height:28px;font-weight:bold;}
.center-home-div {background-color:#f2f2f2;border-top:1px solid #e1e1e1; margin-top:105px;}
.center-text {color:#1f0da8; margin-top: 8px;}
.center-home-line {height:3px;background-color:#1f0da8; margin-top: 8px;}
.btn-primary2 {background-color: #1F0DA8; border-color: #1F0DA8; color: #FFF; !important;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정</title>
<!-- 우편번호 검색 map.jsp -->
	<jsp:include page="/member/map.jsp"/>

	<!-- 유효성체크 SignUpCheck.jsp 가져오는곳  -->
	<jsp:include page="/member/SignUpCheck.jsp"/>	
	
<%
	String id = (String)session.getAttribute("id");
%>	

	<!-- 헤더가 들어가는 곳 -->
	<jsp:include page="../inc/header.jsp"/>
	<!-- </head>
		 <body> -->
		 
<div class="center-home-div">
	<ul class="container center-home">
		<h5 class="center-text font-weight-bold">회원정보 수정</h5>
	</ul>
	<hr class="center-home-line">
</div>

<div class="container" id="mar">
	<div class="form-group">
          <form action="${pageContext.request.contextPath}/members/MemberEdit.me" method="post" onsubmit="return emailCheck();">
          
    		<label for="id" class="font-weight-bold text-dark">아이디</label>
            <div class="form-group">
              <div class="input-group">
                <input type="text" class="form-control" id="userid" name="userid" value="${id}" style="margin-right: 0px;" readonly>
              </div>
            </div>
            
            
		    <label for="pwd" class="font-weight-bold text-dark">비밀번호</label>
		    <div class="form-group">
		      <div class="input-group">
		        <input type="password" class="form-control" onblur="pwdCheck();" id="userpwd" name="userpwd" style="margin-right: 0px;" required>
		        <div id="pwdCheck" class="text-danger" style="width:100%; display:none;">필수 정보입니다.</div>
		        <div id="pwdCheck2" class="text-danger" style="width:100%; display:none;">비밀번호는  8~16자리의 영문, 숫자를 사용하십시오.</div>
		      </div>
		    </div>
		    
		    
		    <label for="pwd2" class="font-weight-bold text-dark">비밀번호 재확인</label>
		    <div class="form-group">
		      <div class="input-group">
		        <input type="password" class="form-control" onblur="pwdCheck2();" id="userpwd2" name="userpwd2" style="margin-right: 0px;" required>
		        <div id="pwdCheckA" class="text-danger" style="width:100%; display:none;">필수 정보입니다.</div>
		        <div id="pwdCheckB" class="text-danger" style="width:100%; display:none;">비밀번호가 일치하지 않습니다.</div>
		      </div>
		    </div>    
		       
            
            <label for="name" class="font-weight-bold text-dark">이름</label>
		    <div class="form-group">
		      <div class="input-group">
		        <input type="text" class="form-control" onblur="nameCheck();" id="username" name="username" value="${mbean.customer_name}"  style="margin-right: 0px;" required>
		        <div id="nameCheck" class="text-danger" style="width:100%; display:none;">필수 정보입니다.</div>
                <div id="nameCheck2" class="text-danger" style="width:100%; display:none;">이름은  2~5자리의 한글을 사용하십시오.</div>
		      </div>
		    </div>
            
            
            <label for="eaddress" class="font-weight-bold text-dark">이메일 주소</label>
		    <div class="form-group">
		      <div class="input-group">
		        <input type="text" class="form-control" onblur="emailCheck();" value="${mbean.customer_email}" id="useremail" name="useremail" style="margin-right: 0px;" required>
		        <input type="hidden" id="emailhidden" value="${mbean.customer_email}">
		        <span class="input-group-btn">
                  <input type="button" class="btn btn-primary2" onclick="sendEmail();" value="계정인증">
                </span>
                <div id="emailCheck" class="text-danger" style="width:100%; display:none;">이메일 주소를 다시 확인해주세요.</div>
                <div id="emailCheck2" class="text-success" style="width:100%; display: none;">인증이 완료되었습니다.</div>
                <div id="emailCheck3" class="text-danger" style="width:100%; display:none;">이메일 계정 인증을 해주세요.</div>
                <div id="emailCheck4" class="text-danger" style="width:100%; display:none;">필수 정보입니다.</div>
		      </div>
		    </div>
		    
		    
		    <label for="tel" class="font-weight-bold text-dark">연락처</label>
            <div class="form-group">
              <div class="input-group">
                <input type="text" class="form-control" value="${mbean.customer_tel}" onblur="telcheck(); utelcheck();" id="usertel" name="usertel" style="margin-right: 0px;" placeholder="- 없이 입력해 주세요" required>
                <div id="telCheck" class="text-danger" style="width:100%; display:none;">필수 정보입니다.</div>
                <div id="telCheck2" class="text-danger" style="width:100%; display:none;">연락처는 11자리 숫자를 사용해주세요.</div>
                <div id="telCheck3" class="text-danger" style="width:100%; display:none;">이미 사용중인 전화번호입니다.</div>
                <div id="telCheck4" class="text-success" style="width:100%; display:none;">사용 가능한 전화번호입니다.</div>
              </div>
            </div>
            
            
            <label for="address" class="font-weight-bold text-dark">주소</label>
            <div class="form-group">
              <div class="input-group">
                <input type="text" class="form-control" value="${mbean.customer_postcode}" id="sample6_postcode" name="postcode" placeholder="우편번호" style="margin-right: 0px;" required>        
              <div>
		        <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호찾기" class="btn btn-primary2 px-2">
		      </div>
              </div>
            </div>       
            <div class="form-group">
              <div class="input-group">
                <input type="text" class="form-control" value="${mbean.customer_address}" id="sample6_address" name="address" style="margin-right: 0px;" placeholder="주소">               
              </div>
            </div>
            <div class="form-group">
              <div class="input-group">
                <input type="text" class="form-control" value="${mbean.customer_detailAddress}" id="sample6_detailAddress" name="detailAddress" placeholder="상세주소" style="margin-right: 0px;" required>               
              </div>
            </div>
            <div class="form-group">
              <div class="input-group">
                <input type="text" class="form-control" value="${mbean.customer_extraAddress}" id="sample6_extraAddress" name="extraAddress" style="margin-right: 0px;" placeholder="참고항목">               
              </div>
            </div>          
            
            <div class="form-group">
              <div class="input-group">
                <input type="hidden" name="grade" value="일반">
              </div>
            </div>
            
            <div class="form-group">
              <div class="input-group">
                <input type="hidden" name="delete" value="0">
              </div>
            </div>
            
            <div class="form-group text-center">
              <button type="button" style="width: 137px; height: 52px;" class="btn btn-secondary" onclick="history.go(-1)">취소</button> 
              <button type="submit" style="width: 137px; height: 52px;" class="btn btn-primary2">수정</button>
            </div>
          </form>
        </div>
</div>   

  
    <!-- 푸터 들어가는 곳 -->
    <jsp:include page="../inc/bottom.jsp"/>

</body>
</html>