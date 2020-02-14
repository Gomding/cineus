<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%response.setStatus(HttpServletResponse.SC_OK);%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#goMain{
 	box-shadow:inset 0px 1px 0px 0px #dcecfb;
	background:linear-gradient(to bottom, #bddbfa 5%, #80b5ea 100%);
	background-color:#bddbfa;
	border-radius:6px;
	border:1px solid #84bbf3;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #528ecc;
	height: 44px;
}
</style>
<meta charset="UTF-8">
<title>404에러페이지</title>
</head>
<body>
	<div style="text-align: center; margin-top: 120px;">
		<img src="${pageContext.request.contextPath}/images/404ErrorPage.png" style="width: 600px;">		
	</div>
	<div style="text-align: center;">
		<input type="button" id="goMain" value="메인으로" onclick=location.href="${pageContext.request.contextPath}/index.home">
	</div>
</body>
</html>