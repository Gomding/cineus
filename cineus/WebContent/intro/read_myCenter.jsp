<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="contextPath" value = "${pageContext.request.contextPath}"/>
<c:set var="groupRentContent" value = "${groupRentContent}"/>
<c:set var="my1on1Content" value = "${my1on1Content}"/>
<c:set var="lostArticleContent" value = "${lostArticleContent}"/>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>나의 문의내역</title>
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
		 

<br><br><br><br>
	<nav class="menu-navigation-icons">
    <a href="${context}/members/fa_1.me" class="menu-magenta" id="fa1"><i class="fa fa-user"></i><span>회원정보</span></a>
    <a href="${context}/members/fa_2_1.me" class="menu-blue" id="fa2"><i class="fa fa-trophy"></i><span>멤버십 확인</span></a>
    <a href="${context}/members/fa_3.me" class="menu-green" id="fa3"><i class="fa fa-ticket"></i><span>예매 취소</span></a>
    <a href="${context}/members/fa_4.me" class="menu-yellow" id="fa4"><i class="fa fa-shopping-cart"></i><span>스토어 구매내역</span></a>
    <a href="${context}/members/fa_5.me" class="menu-red" id="fa5"><i class="fa fa-video-camera"></i><span>나의 무비스토리</span></a>
    <a href="${context}/customerboard/my1on1.do?pageNum=1" class="menu-pink" id="fa6"><i class="fa fa-envelope-o"></i><span>나의 문의 내역</span></a>
</nav>
	
<div class="content-wrap">
	<div class="center-home-div">
		<ul class="center-home">
			<li class = "center-home-inner">
				<a class = "center-text" href="${contextPath}/members/fa_1.me" >나의 시네어스</a>
			<li>
		</ul>
		<hr class="center-home-line">
	</div>
</div>
<div class = "container-board-board width-fixed">
	<h2 class = "cu30"><span class = "sub-title customer st2">나의 문의내역</span></h2>
	<div id = "centerNoticeList" class = "tab-wrap customer-tab-wrap">
		<ul class = "nav nav-tabs cu20">
			<li class = "active" id = "my1on1"><a href = "${contextPath}/customerboard/my1on1.do">1:1문의내역</a></li>
			<li class = "" id = "mygroupRent"><a href = "${contextPath}/customerboard/myRent.do">단체관람/대관 문의내역</a></li>
			<li class = "" id = "mylostarticle"><a href = "${contextPath}/customerboard/mylostarticle.do">분실물 문의내역</a></li>
		</ul>
		<ul class = "icon_list pl25 cu20 mt20" id = "lost_article_help" style = "width:500px;">
			<li>>고객센터를 통해 남기신 1:1 문의내역을 확인하실 수 있습니다.</li>
		</ul>
	
	</div>
	<div id = "centerMy1on1Detail" class = "centerMyContentDetail active">
		<div class = "board-view cu40">
			<table>
				<tbody>
					<tr>
						<th scope = "row" id = "th-lostArticle-title">제목</th>
						<td headers = "th-lostArticle-title" colspan = "3">
							<strong class = "c_purple">${my1on1Content.subject}</strong>
						</td>
					</tr>
					<tr>
						<th scope = "row" id = "th-lostArticle-info">문의사항</th>
						<td headers = "th-lostArticle-info" class = "lostArticle_info" colspan = "3">
							<p><strong><strong>문의지점</strong> ${my1on1Content.location}</strong>|</p>
							<p><strong><strong>문의유형</strong>${my1on1Content.question_type}</strong>|</p>
							<p><strong><strong>답변상태</strong> ${my1on1Content.rep_1on1_board}</strong></p>
						</td>
					</tr>
					<tr>
						<th scope = "row" id = "th-lostArticle-filminfo">영화정보</th>
						<td headers = "th-lostArticle-film" class = "lostArticle_filminfo" colspan = "4">
							<p><strong><strong>${my1on1Content.name}</strong></strong>|</p>
							<p><strong>${my1on1Content.telnum}</strong>|</p>
							<p><strong>${my1on1Content.email}</strong>|</p>
							<p><strong>${my1on1Content.writeDate}</strong></p>
						</td>
					</tr>
				</tbody>
			</table>
			<div class = "contents">
				<p><span class = "content-style">${my1on1Content.content}</span></p>
			</div>
		</div><!-- board-view의 끝  -->
		<c:if test="${!empty my1on1Content.rep_1on1_board_content}">
			<div class = "rep_container-board-board">
				ㄴ ${my1on1Content.rep_1on1_board_content}<br>
			</div>
		</c:if>
		<div class = "clearfix cu10">
			<button type = "button" class = "board_list pull_left" onclick = 'location.href = "${contextPath}/customerboard/my1on1.do?repSelectVal=${param.repSelectVal}&searchVal=${param.searchVal}&pageNum=${param.pageNum}"'>목록</button>
		</div><!-- clearfix (목록버튼)의 끝 -->
		
	</div><!-- centerNoticeDetail의 끝 -->
	<div id = "centerMyRentDetail" class = "centerMyContentDetail">
		<div class = "board-view cu40">
			<table>
				<tbody>
					<tr>
						<th scope = "row" id = "th-lostArticle-title">제목</th>
						<td headers = "th-lostArticle-title" colspan = "3">
							<strong class = "c_purple">${groupRentContent.group_rent_subject}</strong>
						</td>
					</tr>
					<tr>
						<th scope = "row" id = "th-lostArticle-info">문의사항</th>
						<td headers = "th-lostArticle-info" class = "lostArticle_info" colspan = "3">
							<p><strong><strong>문의지점</strong> ${groupRentContent.group_rent_location}</strong>|</p>
							<p><strong><strong>문의유형</strong> 단체관람/대관</strong>|</p>
							<p><strong><strong>답변여부</strong> ${groupRentContent.rep_group_rent}</strong></p>
						</td>
					</tr>
					<tr>
						<th scope = "row" id = "th-lostArticle-filminfo">영화정보</th>
						<td headers = "th-lostArticle-film" class = "lostArticle_filminfo" colspan = "4">
							<p><strong><strong>관람영화</strong> ${groupRentContent.group_rent_film}</strong>|</p>
							<p><strong><strong>관람날짜</strong> ${groupRentContent.group_rent_date}</strong>|</p>
							<p><strong><strong>관람시간</strong> ${groupRentContent.group_rent_time}</strong></p>
						</td>
					</tr>
					<tr>
						<th scope = "row" id = "th-lostArticle-filminfo">회원정보</th>
						<td headers = "th-lostArticle-film" class = "lostArticle_filminfo" colspan = "4">
							<p><strong><strong>${groupRentContent.group_rent_name}</strong></strong>|</p>
							<p><strong>${groupRentContent.group_rent_telnum}</strong>|</p>
							<p><strong>${groupRentContent.group_rent_email}</strong>|</p>
							<p><strong>${groupRentContent.group_rent_writeDate}</strong></p>
						</td>
					</tr>
				</tbody>
			</table>
			<div class = "contents">
				<p><span class = "content-style">${groupRentContent.group_rent_content}</span></p>
			</div>
		</div><!-- board-view의 끝  -->
		<c:if test="${!empty groupRentContent.group_rent_rep_content}">
			<div class = "rep_container-board-board">
				ㄴ ${groupRentContent.group_rent_rep_content}<br>
			</div>
		</c:if>
		<div class = "clearfix cu10">
			<button type = "button" class = "board_list pull_left" onclick = 'location.href = "${contextPath}/customerboard/myRent.do?repSelectVal=${param.repSelectVal}&searchVal=${param.searchVal}&pageNum=${param.pageNum}"'>목록</button>
		</div><!-- clearfix (목록버튼)의 끝 -->
		
	</div><!-- centerNoticeDetail의 끝 -->
	<div id = "centerMyLostArticleDetail" class = "centerMyContentDetail">
		<div class = "board-view cu40">
			<table>
				<tbody>
					<tr>
						<th scope = "row" id = "th-lostArticle-title">제목</th>
						<td headers = "th-lostArticle-title" colspan = "3">
							<strong class = "c_purple">${lostArticleContent.lost_article_subject}</strong>
						</td>
					</tr>
					<tr>
						<th scope = "row" id = "th-lostArticle-info">문의사항</th>
						<td headers = "th-lostArticle-info" class = "lostArticle_info" colspan = "3">
							<p><strong><strong>문의지점</strong> ${lostArticleContent.lost_article_location}</strong>|</p>
							<p><strong><strong>문의유형</strong> 분실물접수</strong>|</p>
							<p><strong><strong>답변여부</strong> ${lostArticleContent.rep_lost_article}</strong></p>
						</td>
					</tr>
					<tr>
						<th scope = "row" id = "th-lostArticle-filminfo">영화정보</th>
						<td headers = "th-lostArticle-film" class = "lostArticle_filminfo" colspan = "4">
							<p><strong><strong>관람영화</strong> ${lostArticleContent.lost_article_film}</strong>|</p>
							<p><strong><strong>관람날짜</strong> ${lostArticleContent.lost_article_date}</strong>|</p>
							<p><strong><strong>관람시간</strong> ${lostArticleContent.lost_article_time}</strong></p>
						</td>
					</tr>
					<tr>
						<th scope = "row" id = "th-lostArticle-filminfo">회원정보</th>
						<td headers = "th-lostArticle-film" class = "lostArticle_filminfo" colspan = "4">
							<p><strong><strong>${lostArticleContent.lost_article_name}</strong></strong>|</p>
							<p><strong>${lostArticleContent.lost_article_telnum}</strong>|</p>
							<p><strong>${lostArticleContent.lost_article_email}</strong>|</p>
							<p><strong>${lostArticleContent.lost_article_writeDate}</strong></p>
						</td>
					</tr>
				</tbody>
			</table>
			<div class = "contents">
				<p><span class = "content-style">${lostArticleContent.lost_article_content}</span></p>
			</div>
		</div><!-- board-view의 끝  -->
		<c:if test="${!empty lostArticleContent.lost_article_rep_content}">
			<div class = "rep_container-board-board">
				ㄴ ${lostArticleContent.lost_article_rep_content}<br>
			</div>
		</c:if>
		<div class = "clearfix cu10">
			<button type = "button" class = "board_list pull_left" onclick = 'location.href = "${contextPath}/customerboard/mylostarticle.do?repSelectVal=${param.repSelectVal}&searchVal=${param.searchVal}&pageNum=${param.pageNum}"'>목록</button>
		</div><!-- clearfix (목록버튼)의 끝 -->
		
	</div><!-- centerNoticeDetail의 끝 -->
</div>



<%String pageNum = request.getParameter("pageNum"); %>


		<script type="text/javascript">
			
			var pathname = $(location).attr('pathname');
			if(pathname == "/cineus/customerboard/read_my1on1.do") {
				$('#my1on1').addClass('active');
				$('#centerMy1on1Detail').addClass('active');
				$('#mygroupRent').removeClass('active');
				$('#centerMyRentDetail').removeClass('active');
				$('#mylostarticle').removeClass('active');
				$('#centerMyLostArticleDetail').removeClass('active');
				$("#lost_article_help li").text(">고객센터를 통해 남기신 1:1 문의내역을 확인하실 수 있습니다.");
				
			}else if(pathname == "/cineus/customerboard/read_myRent.do") {
				$('#my1on1').removeClass('active');
				$('#centerMy1on1Detail').removeClass('active');
				$('#mygroupRent').addClass('active');
				$('#centerMyRentDetail').addClass('active');
				$('#mylostarticle').removeClass('active');
				$('#centerMyLostArticleDetail').removeClass('active');
				$("#lost_article_help li").text(">고객센터를 통해 남기신 단체관람/대관 문의내역을 확인하실 수 있습니다.");
				
			}else if(pathname == "/cineus/customerboard/read_mylostarticle.do") {
				$('#my1on1').removeClass('active');
				$('#centerMy1on1Detail').removeClass('active');
				$('#mygroupRent').removeClass('active');
				$('#centerMyRentDetail').removeClass('active');
				$('#mylostarticle').addClass('active');
				$('#centerMyLostArticleDetail').addClass('active');
				$("#lost_article_help li").text(">고객센터를 통해 남기신 분실물 문의내역을 확인하실 수 있습니다.");
				
			}
		
		</script>
		
		
		

	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->	
	<link rel="stylesheet" href="${contextPath}/customboard/style.css">
</body>
</html>