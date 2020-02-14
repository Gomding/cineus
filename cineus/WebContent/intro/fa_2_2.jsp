<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
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
<link href="${context}/css/fa_2_2.css" rel="stylesheet">
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
	<!-- vip zone -->
	<div class="section no7 vipzone" id="fa_2" style="margin-left: 520px; margin-top: 100px;">
		<div class="w1">
		 	<h2 style="color:#1f0da8">VIP ZONE</h2>
			 <div class="div_wrap">
			 	<div class="active" id="tab1" style="margin-left: 100px;">
			 		<a href="${context}/members/fa_2_1.me" title="2019년 VIP 회원안내 보기">2019년 VIP 회원안내</a>
			 	</div>
			 	<div id="tab2">
			 		<a href="${context}/members/fa_2_2.me" title="2019년 VIP 혜택소개 보기">2019년 혜택소개</a>
			 	</div>
			 </div>
		</div> 
		 <div>
		 	<h3 class="large mb0">2019년 VIP 혜택 소개</h3>
		 	<div id="tab" class="tab-pane active">
		 		<h5>멤버십 할인</h5>
		 		<table class="icon_list bx" style="list-style:none;">
		 			<div class="mb20">
		 				"시네어스 멤버십 할인을 이용하여 영화 관람 시 할인을 받을 수 있습니다."
		 				<p class="help">2019년 멤버십 할인은 2018년 영화 관람 횟수에 따라 등급이 결정 되며 등급에 따라 할인율이 달라집니다.</p>
		 				<p class="help">멤버십 할인 조건은 로그인 후 내 정보에서 확인 하실 수 있습니다</p>
		 				<p class="help">멤버십 할인은 어스스토어에서는 사용이 불가합니다.</p>
		 			</div>
		 			<div style="padding:0;background: none">
		 				<div class="data_table border caption2 mt10" style="width: 100%; border: 1px solid #444444; border-collapse: collapse;">
		 					<caption class="blind">등급, 실버, 골드, 다이아몬드의 영화 할인 내용 설명</caption>
		 					<colgroup>
		 						<col width = "5%">
		 						<col width = "22%">
		 						<col width = "22%">
		 						<col width = "22%">
		 						<col width = "22%">
		 					</colgroup>
		 					<thead>
		 						<tr class="fz15" style="border: 1px solid #444444;">
		 							<th scope="col" id="vip_goob" style="border: 1px solid #444444;">등급</th>
		 							<th class="th_border" scope="col" id="vip_a" style="border: 1px solid #444444;">일반</th>
		 							<th class="th_border" scope="col" id="vip_b" style="border: 1px solid #444444;">실버</th>
		 							<th class="th_border" scope="col" id="vip_c" style="border: 1px solid #444444;">골드</th>
		 							<th class="th_border" scope="col" id="vip_d" style="border: 1px solid #444444;">다이야몬드</th>
		 						</tr>
		 					</thead>
		 					<tbody>
		 						<tr style="border: 1px solid #444444;">
		 							<th scope="row" id="vip_movie">
		 								<strong>
		 									영화
		 									할인
		 								</strong>
		 								
		 								<td headers="vip_movie vip_a vip" style="border: 1px solid #444444;">
		 									<a>
		 										일반 등급 할인
		 									</a>
		 										<br>
		 									<a>
		 										할인 없음
		 									</a>
		 								</td>
		 								
		 								<td headers="vip_movie vip_b vip" style="border: 1px solid #444444;">
		 									<a>
		 										실버 등급 할인
		 									</a>
		 										<br>
		 									<a>
		 											10% 할인
		 									</a>
		 								</td>
		 								<td headers="vip_movie vip_c vip_premium" style="border: 1px solid #444444;">
		 									<a>
		 										골드 등급 할인
		 									</a>
		 										<br>
		 									<a>
		 										20% 할인
		 									</a>
		 								</td>
		 								<td headers="vip_movie vip_d vvip" style="border: 1px solid #444444;">
		 									<a>
		 										다이아 등급 할인
		 									</a>
		 										<br>
		 									<a>
		 										30% 할인
		 									</a>
		 								</td>
		 						</tr>
		 					</tbody>
		 				</div>
		 				
		 			</div>
		 		</table>
		 	</div>
		 	</div> <!-- t2 끝 -->
		</div>
	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->	
</body>
</html>