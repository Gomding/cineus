<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%	request.setCharacterEncoding("UTF-8"); %>
    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<c:set var="boardList" value = "${boardList}"/>
<c:set var="noticeList" value = "${noticeList}"/>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객센터</title>

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
				<a class = "center-text" href="${contextPath}/customerboard/customcenter.do">고객센터</a>
			<li>
		</ul>
		<hr class="center-home-line">
	</div>
</div>
<div class = "container-board width-fixed">
	<div class="center-menu">
		<div>
			<h2 class = "mb14"><span class="center-title">무엇이 궁금하신가요?</span></h2>
			
			<p class = "center-number">시네어스 고객센터 Customer center / 051-000-0000
				<span class = "center-number-text">무엇이든 물어보살</span>
			</p>
		</div>
	</div>
	<div class = "FAQ">
			<div>
				<div class = "search-label">
				<label id = "faqlabel">FAQ 검색</label>
				</div>
				<input class = "search" placeholder = "    검색어를 입력하세요">
				<button id = "search" onclick = "searchFAQ()" style = "top:24px;right:340px;height:20px;width:20px;"><i id = "search_img"></i></button>
			</div>
	</div>
	<div class = "customer-box-main">
		<div class = "customer-box faqtop5">
			<div class = "box-header" id = "FAQ-content">
					<h4>자주 묻는 질문 BEST 5</h4>
			</div>
			<div class = "box-body">
				<ul id = "centermainFaq" class = "faqtop5">
					<c:forEach   var="bean" items = "${boardList}" begin="0" end="3" step="1" varStatus = "i">
						<li>
							<a class = "showdown title top5"  href = "${contextPath}/customerboard/FAQcenter.do?#pageNum${i.count}">
								<strong>${i.count}</strong>
								<em>${bean.faq_group}</em>
								<span>${bean.question}</span>
							</a>
						</li>
					</c:forEach>
					<c:forEach   var="bean" items = "${boardList}" begin="4" end="4" step="1" varStatus = "i">
						<li style = "border:none;">
							<a class = "showdown title top5"  href = "${contextPath}/customerboard/FAQcenter.do?#pageNum${i.count}">
								<strong>${i.count+4}</strong>
								<em>${bean.faq_group}</em>
								<span>${bean.question}</span>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<button type = "button" class = "move-board" onclick = "location.href = '${contextPath}/customerboard/FAQcenter.do'">더보기+</button>
		</div>
		<div class = "customer-box notice list">
			<div class = "box-header">
				<h4>공지사항</h4>
			</div>
			<div class = "box-body">
				<ul id="centermainNotice" class = "notice">
					<c:forEach var="bean" items = "${noticeList}" varStatus = "i">
						<li>
							<a href = "${contextPath}/customerboard/readNotice.do?num=${bean.num}&pageNum=1&searchVal=''&location=${bean.location}">
								<em>
									<strong>${bean.location}</strong>
									${bean.writeDate}
								</em>
								<span>${bean.subject}</span>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<button type = button class = "move-board" onclick = "location.href = '${contextPath}/customerboard/noticecenter.do'">더보기+</button>
		
		</div>
	</div>
	<div class = "customer-box-main bottom">
		
		
	</div>
</div>

<script type="text/javascript">

	function searchFAQ() {
		
		var selectVal = ""  // select 옵션값
		var searchVal = document.getElementsByClassName("search")[0].value; // 검색창에 입력한 값
		
		location.href = "${contextPath}/customerboard/searchList.do?selectVal=" + selectVal + "&searchVal=" + searchVal;
		return false;
	}
	
</script>
</body>

</html>