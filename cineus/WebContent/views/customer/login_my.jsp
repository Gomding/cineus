<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="context" value="${pageContext.request.contextPath}" />


<html>
	<head>
	<title>CINEUS Test</title>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	
		<link rel="stylesheet" type="text/css" href="${context}/css/common.css">
	</head>
	<body>
		 <div class="container-fluid">
		 	<!-- 메뉴  -->
			<jsp:include page="/views/common/menu.jsp" />
			<!-- 메뉴 끝 -->
			<br><br>
			 
			<!-- 로그인 -->
			<div class="d-flex justify-content-center">
			
				<form action="${context}/customer/login.do">
				  <div class="form-group">
				    <label for="id">ID:</label>
				    <input type="text" class="form-control" placeholder="아이디" id="id" name="id">
				  </div>
				  <div class="form-group">
				    <label for="pwd">Password:</label>
				    <input type="password" class="form-control" placeholder="패스워드" id="pw" name="pw">
				  </div>
				  <div class="form-group form-check">
				    <!-- <label class="form-check-label">
				      <input class="form-check-input" type="checkbox"> Remember me
				    </label> -->
				  </div>
				  <button type="submit" class="btn btn-danger">로그인하기</button>
				</form>
				<!-- 로그인 끝-->
			</div>
		</div> <!-- .container-fluid 끝 -->
	</body>
</html>