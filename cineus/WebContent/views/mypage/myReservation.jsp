<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="ticket" value = "${ticket }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제완료</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script src = "https://code.jquery.com/jquery-latest.js"></script>

	<style>
		.left-ticket{
		   
			width:230px;
			height:310px;
			background-color:#868686;
   			display: inline-block;
   			border-right: 4px dashed black;
		    
		}
		.right-ticket{
			width:520px;
			height:310px;
			background-color:#656565;
  			  display: inline-block;
  			position:fixed;
		}
		.ticket-container {
			margin-top: 180px;
   			margin-left: 18%;
   			
   			height: 300px;
    		position: static;
		}
		.num_title p{
			color:white;
			text-align:center;
			margin-bottom:5px;
		}
		.num_title {
			display: block;
   		 	margin-top: 10px;
   			 position: relative;
		
		}
		.film_title {
			display: block;
   		 	margin-top: 15px;
   			 position: relative;
		}
		.ticket-num {
			display:block;
			color:white;
			text-align:center;
			margin:0px;
			color: #27b5ec;
			height:40px;
   			font-size: 30px;
		}
		.film_title p {
		    color: #27b5ec;
   			font-size: 27px;
   			padding-left:30px;
		}
		.info_ticket {
			list-style:none;
			color:white;
		}
		.info_ticket li {
			width:80px;
			list-style:none;
			float:left;
			margin:0px;
		}
		
		.info_ticket em {
			float:left;
			width:400px;
			margin:0px;
			display:block;
		}
		
	
	</style>

	<!-- 헤더가 들어가는 곳 -->
	<jsp:include page="/inc/header.jsp"/>
	<!-- 헤더가 들어가는 곳 -->
	
	
	<div class = "container" style = "min-height:404px;">
		<div class = "ticket-container">
		<div class = "left-ticket">
			<span class = "num_title"><b><p>티켓 예매번호</p></b></span>
			<span class = "ticket-num"><b><p>1${ticket.reservation_payment_id}</p></b></span>
			<div class="card-img">
				<img src="${context}/images/movie/${ticket.reservation_payment_movie_id }.jpg" width="145px" height="200px" style = "margin-left:45px;margin-top:20px;" alt="">
			 <%-- <span><h4>${loop.index+1}</h4></span> --%>
			</div>
			
		</div>
		<div class = "right-ticket">
			<span class = "film_title"><b><p>예매가 완료됐습니다!</p></b></span>
			<span class = "info_ticket">
				<ul>
					<li>예매영화</li><em>${ticket.reservation_payment_film }</em>
					<li>영화관</li>  <em>${ticket.reservation_payment_theater_name }</em>
					<li>관람일시 </li><em>${ticket.reservation_payment_date }</em>
					<li>관람인원 </li><em>${ticket.reservation_payment_headCount }</em>
					<li>좌번석호 </li><em>${ticket.reservation_payment_seats }</em>
					<li>결제수단  </li><em>${ticket.reservation_payment_method }</em>
					<li>결제일시 </li><em>${ticket.reservation_payment_writeDate }</em>
				</ul>
			
			
			
			</span>
			
			
		</div>
		</div>
	</div>
	
	
	
	
	
	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->
</body>
</html>