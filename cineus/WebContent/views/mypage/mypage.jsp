<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

	<link rel="stylesheet" type="text/css" href="${context}/css/common.css">
	<link rel="stylesheet" type="text/css" href="${context}/css/admin.css">
</head>
<body>
	 <div class="container-fluid">
	 	<!-- 메뉴  -->
		<jsp:include page="/views/common/menu.jsp" />
		<!-- 메뉴 끝 -->
		
		<!-- 어드민 메뉴 -->
		<div class="sidenav">
			<br><br><br>
			<a href="${context}/customer/mypage.do">MyPage 메인</a><hr>
			  <a href="${context}/customer/getMovieLikeList.do">보고싶어</a><hr>
		</div>
		<!-- 어드민 메뉴 끝 -->
		
		<div class="main">
			<!-- 마이페이지 내용 시작 -->
			마이페이지입니다.
	 		<!-- 마이페이지 내용 끝 -->
	 	</div> <!-- main 끝 -->
	 </div> <!-- container-fluid 끝 -->
</body>
</html>