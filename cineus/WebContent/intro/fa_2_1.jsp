<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="context" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.vipzone{
	width : 1000px;
	height:  400px;
}
.w1{
	width : 800px;
	height : 300px;
}
.div_wrap{
	
}
#tab1 {
	margin: 50px 100px 20px 0px;
	padding: 40px 30px;
	border: 1px solid #1f0da8;
	float: left;
	background-color: #1f0da8;
	color: white;
	border : 1px solid #1f0da8;
}

.data_table {
	width: 50%;
	border: 1px solid #444444;
	border-collapse: collapse;
	margin: 50px 0px 0px 400px;
	text-align: center;
}

.help {
	width: 50%;
	margin: 0px 0px 100px 400px;
}


#tab1 > a {
	font-size: 20px;
	text-decoration: none;
	color: white;
}

#tab2 {
	margin: 50px 0px 20px 100px;
	padding: 40px 30px;
	border : 1px solid #1f0da8;
	float: left;
	background-color: white;
	color: #1f0da8;

}

#tab2 > a {
	font-size: 20px;
	text-decoration: none;
}

.center-home {list-style:none;margin:0 auto;padding:0;width:970px;height:28px;font-weight:bold;}
.center-home-div {background-color:#f2f2f2;border-top:1px solid #e1e1e1; margin-top:105px;}
.center-text {color:#1f0da8; margin-top: 8px;}
.center-home-line {height:3px;background-color:#1f0da8; margin-top: 8px;}

</style>
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
	<div class="section no7 vipzone" id="fa_2" style="margin: 100px 500px;">
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
			<div style="margin-left: 100px;">
			 <h3 class="blind">2019년 VIP 회원안내</h3>
			 	<p class="">VIP회원 혜택은 매 선정 시 마다 달리 질 수 있습니다</p>
		 		<button type="button" class="icon my_class" id="btn_my_class" onclick="location.href='fa_1.me'">
		 			나의 회원등급 확인하기
		 		</button>
		 	</div>
		 </div>	
		 <div class="tab-content">
		 	<div id="t1">
		 	
		 	<div id="tab" class="tab-pane active" style="margin-left: 120px;">
		 		
		 		<table class="data_table border v3">
		 			<caption class="blind">
		 				VIP 선정: 구분, 내용, 실버, 골드, 다이아몬드, 선정기간, 자격기간 등의 정보제공
		 			</caption>
		 			<colgroup style="border: 1px solid #444444;">
		 				<col width="28%">
		 				<col>
		 			</colgroup>
		 			<thead style="border: 1px solid #444444;">
		 				<tr style="border: 1px solid #444444; ">
		 					<th scope="col" style="border: 1px solid #444444;">구분</th>
		 					<th class="last" scope="col" style="border: 1px solid #444444;">내용</th>
		 				</tr>
		 			</thead>
		 			<tbody style="border: 1px solid #444444;">
		 				<tr style="border: 1px solid #444444; ">
		 					<th scope="row">
		 						<strong>일반</strong>
		 					</th>
		 					<td class="last" style="border: 1px solid #444444;">
		 						혜택사항 없음
		 					</td>
		 				</tr>
		 				
		 				<tr style="border: 1px solid #444444; ">
		 					<th scope="row">
		 						<strong>실버</strong>
		 					</th>
		 					<td class="last" style="border: 1px solid #444444;">
		 						2018년 서로 다른 영화 10편 이상 유료 관람
		 					</td>
		 				</tr>
		 					
		 				<tr style="border: 1px solid #444444; ">
		 					<th scope="row">
		 						<strong>골드</strong>
		 					</th>
		 					<td class="last" style="border: 1px solid #444444;">
		 						2018년 서로 다른 영화 20편 이상 유료 관람
		 					</td>
		 				</tr>
		 				
		 				<tr style="border: 1px solid #444444; ">
		 					<th scope="row">
		 						<strong>다이아몬드</strong>
		 					</th>
		 					<td class="last" style="border: 1px solid #444444;">
		 						2018년 서로 다른 영화 30편 이상 유료 관람
		 					</td>
		 				</tr>
		 				
		 				<tr style="border: 1px solid #444444; ">
		 					<th scope="row">
		 						<strong>선정 기간</strong>
		 					</th>
		 					<td class="last" style="border: 1px solid #444444;">
		 						2018년 1월 1일 ~ 2018년 12월 31일 (상영일 기준)
		 					</td>
		 					
		 				</tr>
		 				
		 				<tr style="border: 1px solid #444444; ">
		 					<th scope="row">
		 						<strong>자격 기간</strong>
		 					</th>
		 					<td class="last" style="border: 1px solid #444444;">
		 						2019년 3월 5일 ~ 2020년 2월 29일(상여일 기준)
		 					</td>
		 				</tr>
		 			</tbody>
		 		</table>
		 		<p class="help">서로 다른 영화 기준: 선정 기간 내 유료 관람한 서로 다른 영화 편수<br> (동일 영화는 1편으로 산정)</p>
		 	</div>
		 	</div> <!-- t1 끝 -->
		 </div>
	</div>
	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->	
</body>
</html>