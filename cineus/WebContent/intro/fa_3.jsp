<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="context" value="${pageContext.request.contextPath}" />


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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


<div class="container" style="margin-top: 50px; min-height: 280px;">
   <h2>예매 확인</h2>        
              <!--table-->
   <table class="table">
      <c:choose> 
         <c:when test="${empty list }">
            <tr><td colspan="7">예매한 영화가 없습니다.</td></tr>
         </c:when>
         <c:otherwise> 
             <thead>
                  <tr class="t1">
                  	<th style="width: 90px;">티켓번호</th>
                  	<th style="width: 110px;">구매일</th>
                      <th style="width: 80px;">아이디</th>
                      <th>영화관</th>
                      <th>영 화</th>
                      <th>영화 상영시간</th>
                      <th style="width: 85px;">총 인원</th>
                      <th>좌 석</th>
                      <th style="width: 110px;">결제 비용</th>
                      <th style="width: 110px;">예매 취소</th>
                  </tr>
              </thead>
             <tbody>
            
            <c:forEach var="rpList" items="${list}" varStatus="i">     
                <tr class="">
                   <!--first example-->
                    <td>${rpList.reservation_payment_id}</td>
                    <td >${rpList.reservation_payment_writeDate}</td>
                    <td>${rpList.customer_id }</td>
                    <td>${rpList.reservation_payment_theater_name}/${rpList.reservation_payment_screen_id}</td>
                    <td>${rpList.reservation_payment_film}</td>
                    <td>${rpList.reservation_payment_showtimes}</td>
                    <td>${rpList.reservation_payment_headCount}</td>
                    <td>${rpList.reservation_payment_seats}</td>
                    <td>${rpList.reservation_payment_ticketPrice}</td>
                    <td><a href="#">예매 취소</a></td>
                </tr>
            </c:forEach>
         </c:otherwise>
      </c:choose>              
     </tbody>
   </table>
</div>
<br><br><br><br><br>


	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->	
</body>
</html>