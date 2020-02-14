<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="contextPath" value = "${pageContext.request.contextPath}"/>
<c:set var="my1on1List" value = "${my1on1List}"/>
<c:set var="myGroupRentList" value = "${myGroupRentList}"/>
<c:set var="myLostArticleList" value = "${myLostArticleList}"/>
<c:set var="pageNum" value = "${pageNum}"/>
<c:set var="pageCount" value = "${pageCount}"/>
<c:set var="startPage" value = "${startPage}"/>
<c:set var="endPage" value = "${endPage}"/>


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
		 

<br><br><br><br>
	
	
<div class="content-wrap">
	<div class="center-home-div" style = "margin-top:0px;">
		<ul class="center-home">
			<li class = "center-home-inner">
				<a class = "center-text" href="${contextPath}/members/fa_1.me" >나의 시네어스</a>
			<li>
		</ul>
		<hr class="center-home-line">
	</div>
</div>

<br><br>
<!-- 마이페이지 메뉴 -->
<jsp:include page="/intro/myMenu.jsp"/>


<div class = "container-board width-fixed">
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
		<button id = "lostarticle_btn" onclick = "location.href = '${contextPath}/customerboard/1on1center.do'" class = "lostarticle_btn">1:1문의하기</button>
		
	<div class = "tab-content">
	<!-- 나의 1:1문의내역 시작-->
	<div class = "tab-pane active" id = "my1on1List">
	<div class = "search-wrap">
		<select name = "rep_1on1_board" class = "select1on1" id = "repSelect" style = "position:relative; right:255px;">
			<option>전체</option>
			<option>미응답</option>
			<option>답변완료</option>
		</select>
		<input type = "text" id = "searchbar" placeholder = "검색어를 입력하세요" value = "${param.searchVal}">
		<button id = "search" style = "top:96px;" onclick = "searchMy1on1()"><i id = "search_img"></i></button>
	
	</div>
	<div class = "FAQlist" id = "accordion">
		<div class = "header-board">
			<span class = "hd1">번호</span>
			<span class = "hd2" style = "width:100px;text-align:center;">지역/영화관</span>
			<span class = "hd3" style = "width:120px;">유형</span>
			<span class = "hd4" style = "width:480px;">제목</span>
			<span class = "hd5 pd0" style = "width:80px;">답변상태</span>
			<span class = "hd6" style = "width:110px;text-align:center;">작성일</span>
		</div>

			<c:forEach   var="bean" items = "${my1on1List}" varStatus = "i">
				<div class = "panel">
				<a class = "showdown title other"  href = "${contextPath}/customerboard/read_my1on1.do?oneonone_id=${bean.oneonone_id}&pageNum=${pageNum}&searchVal=${param.searchVal}&repSelectVal=${param.repSelectVal}">
					<span class = "hd1" style = "visibility:visible">${bean.oneonone_id}</span>
					<span class = "hd2" style = "width:100px;text-align:center;">${bean.location}</span>
					<span class = "hd3" style = "width:120px;text-align:center;">${bean.question_type}</span>
					<span class = "hd4" style = "width:480px;text-align:left;">${bean.subject}</span>
					<span class = "hd5" style = "width:80px;">${bean.rep_1on1_board}</span>
					<span class = "hd6" style = "width:110px;text-align:center;">${bean.writeDate}</span>
				</a>
				</div>
			</c:forEach>
		
	</div>
	
	<ul class = "custom-pagination mt25">
		<c:forEach   var="pageNum" begin = "${startPage}" end = "${endPage}" step = "1" varStatus = "i">
			<li><a name = "list${i.count }" href = "${contextPath}/customerboard/my1on1.do?repSelectVal=${param.repSelectVal}&searchVal=${param.searchVal}&pageNum=${i.count}" onclick = "setPage(this);">${i.count }</a></li>
		</c:forEach>
	</ul>
	</div>
	<!-- 나의 1:1문의 끝 -->
	<!-- 나의 단체관람/대관 문의 시작 -->
	<div class = "tab-pane active" id = "myGroupRentList">
	<div class = "search-wrap">
		<select name = "rep_group_rent" class = "select1on1" id = "repGroupSelect" style = "position:relative; right:255px;">
			<option>전체</option>
			<option>미응답</option>
			<option>답변완료</option>
		</select>
		<input type = "text" id = "groupSearchbar" placeholder = "검색어를 입력하세요" value = "${param.searchVal}">
		<button id = "search" style = "top:96px;" onclick = "searchMyGroupRent()"><i id = "search_img"></i></button>
	
	</div>
	<div class = "FAQlist" id = "accordion">
		<div class = "header-board">
			<span class = "hd1">번호</span>
			<span class = "hd2" style = "width:100px;text-align:center;">지역/영화관</span>
			<span class = "hd3" style = "width:120px;">유형</span>
			<span class = "hd4" style = "width:480px;">제목</span>
			<span class = "hd5 pd0" style = "width:80px;">답변상태</span>
			<span class = "hd6" style = "width:110px;text-align:center;">작성일</span>
		</div>
			<c:forEach   var="bean" items = "${myGroupRentList}" varStatus = "i">
				<div class = "panel">
				<a class = "showdown title other"  href = "${contextPath}/customerboard/read_myRent.do?group_rent_num=${bean.group_rent_num}&pageNum=${pageNum}&searchVal=${param.searchVal}&repSelectVal=${param.repSelectVal}">
					<span class = "hd1" style = "visibility:visible">${bean.group_rent_num}</span>
					<span class = "hd2" style = "width:100px;text-align:center;">${bean.group_rent_location}</span>
					<span class = "hd3" style = "width:120px;text-align:center;">단체관람/대관</span>
					<span class = "hd4" style = "width:480px;text-align:left;">${bean.group_rent_subject}</span>
					<span class = "hd5" style = "width:80px;">${bean.rep_group_rent}</span>
					<span class = "hd6" style = "width:110px;text-align:center;">${bean.group_rent_writeDate}</span>
				</a>
				</div>
			</c:forEach>
		
	</div>
	
	<ul class = "custom-pagination mt25">
		<c:forEach   var="pageNum" begin = "${startPage}" end = "${endPage}" step = "1" varStatus = "i">
			<li><a name = "list${i.count}" href = "${contextPath}/customerboard/myRent.do?repSelectVal=${param.repSelectVal}&searchVal=${param.searchVal}&pageNum=${i.count}" onclick = "setPage(this);">${i.count }</a></li>
		</c:forEach>
	</ul>
	</div>
	<!-- 나의 단체관람/대관 문의 끝 -->
	<!-- 나의 분실문 문의내역 시작 -->
	<div class = "tab-pane active" id = "myLostArticleList">
	<div class = "search-wrap">
		<select name = "rep_lost_article" class = "select1on1" id = "repLostSelect" style = "position:relative; right:255px;">
			<option>전체</option>
			<option>미응답</option>
			<option>답변완료</option>
		</select>
		<input type = "text" id = "lostSearchbar" placeholder = "검색어를 입력하세요" value = "${param.searchVal}">
		<button id = "search" style = "top:96px;" onclick = "searchMyLostArticle()"><i id = "search_img"></i></button>
	
	</div>
	<div class = "FAQlist" id = "accordion">
		<div class = "header-board">
			<span class = "hd1">번호</span>
			<span class = "hd2" style = "width:100px;text-align:center;">지역/영화관</span>
			<span class = "hd3" style = "width:120px;">유형</span>
			<span class = "hd4" style = "width:480px;">제목</span>
			<span class = "hd5 pd0" style = "width:80px;">답변상태</span>
			<span class = "hd6" style = "width:110px;text-align:center;">작성일</span>
		</div>

			<c:forEach   var="bean" items = "${myLostArticleList}" varStatus = "i">
				<div class = "panel">
				<a class = "showdown title other"  href = "${contextPath}/customerboard/read_mylostarticle.do?lost_article_num=${bean.lost_article_num}&pageNum=${pageNum}&searchVal=${param.searchVal}&repSelectVal=${param.repSelectVal}">
					<span class = "hd1" style = "visibility:visible">${bean.lost_article_num}</span>
					<span class = "hd2" style = "width:100px;text-align:center;">${bean.lost_article_location}</span>
					<span class = "hd3" style = "width:120px;text-align:center;">분실물접수</span>
					<span class = "hd4" style = "width:480px;text-align:left;">${bean.lost_article_subject}</span>
					<span class = "hd5" style = "width:80px;">${bean.rep_lost_article}</span>
					<span class = "hd6" style = "width:110px;text-align:center;">${bean.lost_article_writeDate}</span>
				</a>
				</div>
			</c:forEach>
		
	</div>
	
	<ul class = "custom-pagination mt25">
		<c:forEach   var="pageNum" begin = "${startPage}" end = "${endPage}" step = "1" varStatus = "i">
			<li><a name = "list${i.count }" href = "${contextPath}/customerboard/mylostarticle.do?repSelectVal=${param.repSelectVal}&searchVal=${param.searchVal}&pageNum=${i.count}" onclick = "setPage(this);">${i.count }</a></li>
		</c:forEach>
	</ul>
	</div>
	<!-- 나의 분실물 문의내역 끝 -->
	</div>
</div>
</div>

<%String pageNum = request.getParameter("pageNum"); %>


	<script type="text/javascript">
		var pageNum = <%=pageNum%>;
		
			if(pageNum == null){
				document.getElementsByName("list1")[0].setAttribute('class', 'active');
				document.getElementsByName("list1")[1].setAttribute('class', 'active');
				document.getElementsByName("list1")[2].setAttribute('class', 'active');
			}

			document.getElementsByName("list" + pageNum)[0].setAttribute('class', 'active');
			document.getElementsByName("list" + pageNum)[1].setAttribute('class', 'active');
			document.getElementsByName("list" + pageNum)[2].setAttribute('class', 'active');
			
	  		// 영화관 공지게시판의 검색 함수
			function searchMy1on1() {
	  			
	  			var repSelect = document.getElementById("repSelect");
	  			var repSelectVal = repSelect.options[repSelect.selectedIndex].text; // select 옵션값
	  			var searchVal = document.getElementById("searchbar").value; // 검색창에 입력한 값
	  			
	  			if(repSelectVal == "전체") {
	  				repSelectVal = "";
	  			}
	  			
	  			
	  			location.href = "${contextPath}/customerboard/my1on1.do?repSelectVal=" + repSelectVal + "&searchVal=" + searchVal + "&pageNum=1";
	  			return false;
	  		}
	  		
			function searchMyGroupRent() {
	  			
	  			var repSelect = document.getElementById("repGroupSelect");
	  			var repSelectVal = repGroupSelect.options[repGroupSelect.selectedIndex].text; // select 옵션값
	  			var searchVal = document.getElementById("groupSearchbar").value; // 검색창에 입력한 값
	  			
	  			if(repSelectVal == "전체") {
	  				repSelectVal = "";
	  			}
	  			
	  			
	  			location.href = "${contextPath}/customerboard/myRent.do?repSelectVal=" + repSelectVal + "&searchVal=" + searchVal + "&pageNum=1";
	  			return false;
	  		}
	  		
			function searchMyLostArticle() {
	  			
	  			var repSelect = document.getElementById("repLostSelect");
	  			var repSelectVal = repLostSelect.options[repLostSelect.selectedIndex].text; // select 옵션값
	  			var searchVal = document.getElementById("lostSearchbar").value; // 검색창에 입력한 값
	  			
	  			if(repSelectVal == "전체") {
	  				repSelectVal = "";
	  			}
	  			
	  			
	  			location.href = "${contextPath}/customerboard/mylostarticle.do?repSelectVal=" + repSelectVal + "&searchVal=" + searchVal + "&pageNum=1";
	  			return false;
	  		}

	  	</script> 
	  	
		<script type="text/javascript">
			
			var pathname = $(location).attr('pathname');
			if(pathname == "/cineus/customerboard/my1on1.do") {
				$('#my1on1').addClass('active');
				$('#my1on1List').addClass('active');
				$('#mygroupRent').removeClass('active');
				$('#myGroupRentList').removeClass('active');
				$('#mylostarticle').removeClass('active');
				$('#myLostArticleList').removeClass('active');
				$("#lost_article_help li").text(">고객센터를 통해 남기신 1:1 문의내역을 확인하실 수 있습니다.");
				$("#lostarticle_btn").text("1:1문의하기");
				$("#lostarticle_btn").attr("class", "lostarticle_btn");
				$("#lostarticle_btn").attr("onclick", "location.href = '/cineus/customerboard/1on1center.do'");
			}else if(pathname == "/cineus/customerboard/myRent.do") {
				$('#my1on1').removeClass('active');
				$('#my1on1List').removeClass('active');
				$('#mygroupRent').addClass('active');
				$('#myGroupRentList').addClass('active');
				$('#mylostarticle').removeClass('active');
				$('#myLostArticleList').removeClass('active');
				$("#lost_article_help li").text(">고객센터를 통해 남기신 단체관람/대관 문의내역을 확인하실 수 있습니다.");
				$("#lostarticle_btn").text("단체관람/대관 문의하기");
				$("#lostarticle_btn").attr("class", "lostarticle_btn left286");
				$("#lostarticle_btn").attr("onclick", "location.href = '/cineus/customerboard/groupRent_center.do'");
			}else if(pathname == "/cineus/customerboard/mylostarticle.do") {
				$('#my1on1').removeClass('active');
				$('#my1on1List').removeClass('active');
				$('#mygroupRent').removeClass('active');
				$('#myGroupRentList').removeClass('active');
				$('#mylostarticle').addClass('active');
				$('#myLostArticleList').addClass('active');
				$("#lost_article_help li").text(">고객센터를 통해 남기신 분실물 문의내역을 확인하실 수 있습니다.");
				$("#lostarticle_btn").text("분실물 문의하기");
				$("#lostarticle_btn").attr("class", "lostarticle_btn left332");
				$("#lostarticle_btn").attr("onclick", "location.href = '/cineus/customerboard/write_lostArticle.do'");
			}
		
		</script>
		
		
		

	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->	
	<link rel="stylesheet" href="${contextPath}/customboard/style.css">
</body>
</html>