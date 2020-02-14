<%@page import="faqboard.BoardDAO"%>
<%@page import="faqboard.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<c:set var="pageNum" value = "${pageNum}"/>						<%-- 현재글번호 --%>
<c:set var="noticeContent" value = "${lostArticleContent}"/>			<%-- 현재선택글 --%>


<%

	request.setCharacterEncoding("UTF-8");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src = "https://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript" src="/js/bootstrap-datepicker.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!--  header.jsp에 이미 </head> 와 <body>가 있음 -->	
<!-- </head> -->
<!-- <body> -->

<!-- 헤더 들어가는곳 -->
<jsp:include page="/inc/header.jsp"/>
<!-- 헤더 들어가는곳 -->
  	<link rel="stylesheet" href="${contextPath}/customboard/style.css">


<div class="content-wrap">
	<div class="center-home-div">
		<ul class="center-home">
			<li class = "center-home-inner">
				<a class = "center-text" href="${contextPath}/customerboard/customcenter.do" >고객센터</a>
			<li>
		</ul>
		<hr class="center-home-line">
	</div>
</div>
<div class = "container-board width-fixed">
	<div class = "customer-tab cu30">
		<ul>
			<li><a href = "${contextPath}/customerboard/FAQcenter.do" class = "ct5">자주묻는질문</a></li>
			<li><a href = "${contextPath}/customerboard/noticecenter.do" class = "ct5">공지사항</a></li>
			<li><a href = "${contextPath}/customerboard/1on1center.do" class = "ct5">1:1문의</a></li>
			<li><a href = "${contextPath}/customerboard/groupRent_center.do" class = "ct5">단체관람/대관문의</a></li>
			<li style = "border-right:1px solid #d9d9d9;"><a href= "${contextPath}/customerboard/lostArticle_center.do" class = "ct5">분실물문의/접수</a></li>
			<li class = "ct5" id = "phone-number">시네어스 고객센터<br><h4>Cineus center</h4><hr><h3>1234-5678</h3></li>
		</ul>
	</div>
	<h2 class = "cu30"><span class = "sub-title customer st2">분실물 문의</span></h2>
	<div id = "centerNoticeDetail">
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
							<p><strong><strong>관람영화</strong> ${lostArticleContent.lost_article_film}</strong>|</p>
							<p><strong><strong>관람날짜</strong> ${lostArticleContent.lost_article_date}</strong>|</p>
							<p><strong><strong>관람시간</strong> ${lostArticleContent.lost_article_time}</strong></p>
						</td>
					</tr>
					<tr>
						<th scope = "row" id = "th-lostArticle-filminfo">영화정보</th>
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
			<div class = "rep_container-board">
				ㄴ ${lostArticleContent.lost_article_rep_content}<br>
			</div>
		</c:if>
		<div class = "clearfix cu10">
			<button type = "button" class = "board_list pull_left" onclick = "showMenu()">목록</button>
		</div><!-- clearfix (목록버튼)의 끝 -->
		
	</div><!-- centerNoticeDetail의 끝 -->
</div>


		
		<script type = "text/javascript">
		function getParameterByName(name) {
	  	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	  	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	  	        results = regex.exec(location.search);
	  	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	  	}
		
		var searchVal = getParameterByName("searchVal");
		var selectVal = getParameterByName("selectVal");
		var cinemaSelectVal = getParameterByName("cinemaSelectVal");
		var repSelectVal = getParameterByName("repSelectVal");
		var pageNum = getParameterByName("pageNum");
		
		if(searchVal == null) { searchVal = "" }
		if(selectVal == null) { selectVal = "" }
		if(cinemaSelectVal == null) { cinemaSelectVal = "" }
		
			
			// 검색파라미터 있을시 검색파라미터도 가져
			// pageNum까지 들고와서목록으로 넘어가야함!
			function showMenu(){
				var cinemalocation = $("#cinemalocation").html();
				
				
				location.href = "${contextPath}/customerboard/lostArticle_center.do?selectVal=" + selectVal + "&cinemaSelectVal=" + cinemaSelectVal + "&searchVal=" + searchVal + "&repSelectVal=" + repSelectVal + "&pageNum=" + pageNum;
		  			return false;
				
			}
		</script>

</body>
</html>