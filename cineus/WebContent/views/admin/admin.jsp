<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="context" value="${pageContext.request.contextPath}" />

<html lang="ko">

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

	<link rel="stylesheet" type="text/css" href="${context}/css/common.css">
	<link rel="stylesheet" type="text/css" href="${context}/css/admin.css">
	
<head>
	<meta charset="UTF-8" />
	<title>CINEUS</title>
</head>
<body>

	 <div class="container mt-5" style="font-size:14px;">
	 
	 
	 <!-- 공통 -->
	 <a href="${context}/index.home"><img src="${context}/images/logo_s.png"></a>
	 	<h5>관리자메뉴</h5>
	 	
	 	<nav class="navbar navbar-expand-lg navbar-light bg-light" style="font-size:14px;">
		 	<div class="collapse navbar-collapse" id="navbarText">
			 	<ul class="navbar-nav mr-auto">
			 		<li class="nav-item active"><a  class="nav-link"  href="${context}/views/admin/admin.jsp">문자발송</a></li>
			 		<li class="nav-item"><a class="nav-link" >회원관리</a></li>
			 		<li class="nav-item"><a class="nav-link"  href="${context}/views/admin/admin_schedule.jsp">영화시간표</a></li>
			 		<li class="nav-item"><a class="nav-link" >영화스케쥴등록</a></li>
			 	</ul>
		 	</div>
	 	</nav>
	 <!-- 공통 -->
	 
	 
	 	
	 	<c:redirect url = "/customer/getAllCustomerList.do"/>
	 	
	 	
		
	 </div> <!-- container-fluid 끝 -->
	 
	 <script>
	 </script>
</body>
</html>
