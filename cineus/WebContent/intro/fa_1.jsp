<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="mbean" value="${requestScope.mbean}" />
<c:set var="context" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${context}/css/demo.css">
<link rel="stylesheet" href="${context}/css/navigation-icons.css">
<link rel="stylesheet" href="${context}/css/slicknav/slicknav.min.css">

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

<style>
.tb03 th{background-color: #F6FAF9; width: 120px; text-align: left;
}
.btn-primary2 {background-color: #1F0DA8; border-color: #1F0DA8; color: #FFF; !important;}
.center-home {list-style:none;margin:0 auto;padding:0;width:970px;height:28px;font-weight:bold;}
.center-home-div {background-color:#f2f2f2;border-top:1px solid #e1e1e1; margin-top:105px;}
.center-text {color:#1f0da8; margin-top: 8px;}
.center-home-line {height:3px;background-color:#1f0da8; margin-top: 8px;}
</style>



<!-- 헤더가 들어가는 곳 -->
	<jsp:include page="/inc/header.jsp"/>
	<!-- 헤더가 들어가는 곳 -->
    <!-- </head>
		 <body> -->
<div class="center-home-div">
	<ul class="container center-home">
		<h5 class="center-text font-weight-bold">나의 시네어스</h5>
	</ul>
	<hr class="center-home-line">
</div>
<br><br>
<!-- 마이페이지 메뉴 -->
<jsp:include page="/intro/myMenu.jsp"/>

<div id="fa_1" tabindex="-1" class="sub">
		<div class="sub_bg" style="margin-right: 410px; margin-top: 30px;"> <br><br>
			<div class="snb_area" style="margin-left: 46%; margin-bottom: 30px;">
				<h1>
					<span class="text-dark font-weight-bold">My Page</span>
				</h1>
			</div> 

			<div class="subcont null" style="margin-left: 46%;">
				<div class="subtitle" style="width: 540px;">
					<div id="printBody">
							<table class="tb02 table" summary="아이디, 이름, 이메일, 연락처, 주소, 회원정보에 관한 정보를 제공하는 표">
								
								<tbody class="tb03"> 
										<tr>
											<th>아 이 디</th>
											<td>${mbean.customer_id}</td>
										</tr>
										<tr>
											<th>이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</th>
											<td>${mbean.customer_name}</td>
										</tr>
										<tr>
											<th>이 메 일</th>
											<td>${mbean.customer_email}</td>
										</tr>
										<tr>
											<th>연 락 처</th>
											<td>0${mbean.customer_tel}</td>
										</tr>
										<tr>
											<th>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</th>
											<td>${mbean.customer_address}&nbsp;${mbean.customer_extraAddress}&nbsp;${mbean.customer_detailAddress}</td>
										</tr>
										<tr>
											<th>회원등급</th>
											<td>${mbean.customer_grade}</td>
										</tr>
										
								</tbody>
						</table>
					</div>
	
					<div class="form-group text-center" style="margin-top: 40px;">
		              <input type="button" style="width: 137px; height: 52px;" onclick=location.href="${pageContext.request.contextPath}/members/EditMember.me" value="정보수정" class="btn btn-primary2"></input> 
		              <input type="button" style="width: 137px; height: 52px;" onclick=location.href="${pageContext.request.contextPath}/members/deleteMember.me" value="회원탈퇴" class="btn btn-primary2"></input>
		            </div>	
				</div>
				
			</div>
		</div>
		<br><br>
		<br><br><br><br>
</div>
	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->	
</body>
</html>