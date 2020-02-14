<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="payList" value="${requestScope.payList }"/>
<c:set var="couponList" value="${requestScope.couponList }"/>

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">
	.collapse-row.collapsed + tr {display: none;}
	.myStoreContainer {margin: 100px auto;}
</style>

<style type="text/css">
.center-home {list-style:none;margin:0 auto;padding:0;width:970px;height:28px;font-weight:bold;}
.center-home-div {background-color:#f2f2f2;border-top:1px solid #e1e1e1; margin-top:105px;}
.center-text {color:#1f0da8; margin-top: 8px;}
.center-home-line {height:3px;background-color:#1f0da8; margin-top: 8px;}
.btn-primary2 {background-color: #1F0DA8; border-color: #1F0DA8; color: #FFF; !important;}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지-스토어구매내역</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${contextPath}/css/demo.css">
<link rel="stylesheet" href="${contextPath}/css/navigation-icons.css">
<link rel="stylesheet" href="${contextPath}/css/slicknav/slicknav.min.css">

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<!-- 아이콘 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- 아이콘 폰트어썸 -->

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

<%-- <br>
<nav class="menu-navigation-icons">
    <a href="${contextPath}/members/fa_1.me" class="menu-magenta" id="fa1"><i class="fa fa-user"></i><span>회원정보</span></a>
    <a href="${contextPath}/members/fa_2_1.me" class="menu-blue" id="fa2"><i class="fa fa-trophy"></i><span>멤버십 확인</span></a>
    <a href="${contextPath}/members/fa_3.me" class="menu-green" id="fa3"><i class="fa fa-ticket"></i><span>예매 취소</span></a>
    <a href="${contextPath}/stores/fa_4.me" class="menu-yellow" id="fa4"><i class="fa fa-shopping-cart"></i><span>스토어 구매내역</span></a>
    <a href="${contextPath}/members/fa_5.me" class="menu-red" id="fa5"><i class="fa fa-video-camera"></i><span>나의 무비스토리</span></a>
    <a href="${contextPath}/members/fa_6.me" class="menu-pink" id="fa6"><i class="fa fa-envelope-o"></i><span>나의 문의 내역</span></a>
</nav> --%>

<br>
<!-- 마이페이지 메뉴 -->
<jsp:include page="/intro/myMenu.jsp"/>

	
		<div class="container myStoreContainer">
		<h2>나의 쿠폰</h2>	     
	        <!--table-->
	       <table class="table">

 <c:choose>
 	<c:when test="${empty couponList }">
 			<tr><td colspan="4">보유한 쿠폰이 없습니다.</td></tr>
 	</c:when>
 	<c:otherwise>
	       <thead>
	            <tr class="mytr1">
	                <th>구매일</th>
	                <th>상품명</th>
	                <th>쿠폰번호</th>
	                <th>사용여부</th>
	            </tr>
	        </thead>
	        <tbody>
 		<c:forEach var="cpList" items="${couponList }">
	 		<tr class="">
	       	<!--first example-->
	           <td><fmt:formatDate value="${cpList.cp_date }" pattern="yyyy-MM-dd"/></td>
	           <td>${cpList.item_name }</td>
	           <td>${cpList.cp_code }</td>	           
					<c:choose>
						<c:when test="${cpList.cp_status eq 0 }">
							<td style="color: green"><c:out value="미사용"/></td>
						</c:when>
						<c:otherwise>
							<td style="color: red"><c:out value="사용완료"/></td>
						</c:otherwise>
					</c:choose>	           	          
	       </tr>
       </c:forEach>
 	</c:otherwise>
 </c:choose> 
	        </tbody>
	    </table>		
		<h2>스토어 결제 내역</h2>	     
	        <!--table-->
	       <table class="table">
<c:choose> 
	<c:when test="${empty payList }">
				<tr><td colspan="7">결제 내역이 없습니다.</td></tr>
	</c:when>
	<c:otherwise> 
	       <thead>
	            <tr class="mytr1">
	                <th>구매일</th>
	                <th>결제번호</th>
	                <th>사용여부</th>
	                <th>구매수량</th>
	                <th>결제내역</th>
	                <th>쿠폰정보</th>
	                <th>취소여부</th>
	            </tr>
	        </thead>
	        <tbody>
		<c:forEach var="pList" items="${payList }" varStatus="i">     
			 <tr class="">
			 	<!--first example-->
			     <td><fmt:formatDate value="${pList.pay_date }" pattern="yyyy-MM-dd"/></td>
			     <td>${pList.pay_code }</td>
			     <td>${pList.usableCoupon }/${pList.totalCoupon }</td>
			     <td>${pList.totalCoupon }</td>
			     <td>${pList.pay_type } (<fmt:formatNumber type="number" maxFractionDigits="3" value="${pList.pay_price }"/> 원)</td>
			     <td><span>자세히보기</span></td>
			     <td><a href="${contextPath }/stores/deletePayStore.do?pay_code=${pList.pay_code }" class="pListA">취소하기</a></td>
			 </tr>
			 
			 <script type="text/javascript">
				//쿠폰 사용했으면 결제취소 못하게 하기
				$(".pListA").click(function() {						
					if (${pList.totalCoupon ne pList.usableCoupon}) {				
						$(".pListA").attr("href", "${contextPath }/stores/fa_4.me");
						alert("사용한 상품은 환불이 불가합니다.");
					}
				});
			</script>
		</c:forEach>
	</c:otherwise>
</c:choose>		        
	        </tbody>
	    </table>
	    
	    <div class="infoDiv">
	    	<p><i class="fas fa-chevron-right" style="color: #01738b;"></i> 스토어 상품은 부분 환불이 불가합니다.<br>(ex. 3개의 쿠폰을 한 번에 구매하신 경우, 3개 모두 취소만 가능하며, 그 중 사용하신 쿠폰이 있는 경우 환불이 불가합니다.)</p>
	    </div>
        
	</div>	
	
	<br><br>

	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->	
	
</body>
</html>