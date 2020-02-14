<%@page import="faqboard.BoardDAO"%>
<%@page import="faqboard.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<c:set var="pageNum" value = "${pageNum}"/>
<c:set var="noticeList" value = "${noticeList}"/>
<c:set var="pageCount" value = "${pageCount}"/>
<c:set var="startPage" value = "${startPage}"/>
<c:set var="endPage" value = "${endPage}"/>
<c:set var="locationList" value = "${loactionList}"/>
<c:set var="locationPageCount" value = "${locationPageCount}"/>
<c:set var="locationEndPage" value = "${locationEndPage}"/>


<%

	request.setCharacterEncoding("UTF-8");


	String searchValue = request.getParameter("searchVal");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/bootstrap-datepicker.js"></script>
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
			<li style = "border-right:1px solid #d9d9d9;"><a href = "${contextPath}/customerboard/lostArticle_center.do" class = "ct5">분실물문의/접수</a></li>
			<li class = "ct5" id = "phone-number" style = "">시네어스 고객센터<br><h4>Cineus center</h4><hr><h3>1234-5678</h3></li>
		</ul>
	</div>
	<h2 class = "cu30"><span class = "sub-title customer st2">공지사항, 시네어스의 최신소식을 알려드립니다.</span></h2>
	<div id = "centerNoticeList" class = "tab-wrap customer-tab-wrap">
		<ul class = "nav nav-tabs cu20">
			<li class = "active" id = "allNotice"><a href = "${contextPath}/customerboard/noticecenter.do">전체공지</a></li>
			<li class = "" id = "locationNotice"><a href = "${contextPath}/customerboard/locationnotice.do">영화관공지</a></li>
		</ul>
	<div class = "tab-content">
	<!-- 전체영화관 공지사항 시작-->
	<div class = "tab-pane active" id = "allNoticeList">
	<div class = "search-wrap">

		<input type = "text" id = "searchbar" placeholder = "검색어를 입력하세요" value = "">
		<button id = "search" onclick = "searchAllNotice()"><i id = "search_img"></i></button>
	
	</div>
	<div class = "FAQlist" id = "accordion">
		<div class = "header-board">
			<span class = "hd1">NO</span>
			<span class = "hd2">지역/영화관</span>
			<span class = "hd3" style = "width:570px;">질문</span>
			<span class = "hd4">작성일</span>
		</div>

			<c:forEach   var="bean" items = "${noticeList}" varStatus = "i">
				<div class = "panel">
				<a class = "showdown title other"  href = "${contextPath }/customerboard/readNotice.do?num=${bean.num}&pageNum=${pageNum}&searchVal=${param.searchVal}&location=${bean.location}">
					<span class = "hd1" style = "visibility:visible">${bean.num}</span>
					<span class = "hd2">${bean.location}</span>
					<span class = "hd3" style = "width:570px;">${bean.subject}</span>
					<span class = "hd4">${bean.writeDate}</span>
				</a>
				</div>
			</c:forEach>
		
	</div>
	
	<ul class = "custom-pagination mt25">
		
	<c:if test="${empty param.searchVal}">
		<c:forEach   var="pageNum" begin = "${startPage}" end = "${endPage}" step = "1" varStatus = "i">
			<li><a name = "list${i.count }" href = "${contextPath }/customerboard/noticecenter.do?pageNum=${i.count }" onclick = "setPage(this);">${i.count}</a></li>
		</c:forEach>
	</c:if>
	<c:if test="${not empty param.searchVal}">
		<c:forEach   var="pageNum" begin = "${startPage}" end = "${endPage}" step = "1" varStatus = "i">
			<li><a name = "list${i.count }" href = "${contextPath}/customerboard/allNoticeSearch.do?searchVal=${param.searchVal}&pageNum=${i.count}" onclick = "setPage(this);">${i.count }</a></li>
		</c:forEach>
	</c:if>
	</ul>
	</div>
	<!-- 전체영화관 공지사항 끝 -->
	<!-- 지역영화관 공지사항 시작 -->
	<div class = "tab-pane" id = "cinemaNoticeList">
	<div class = "search-wrap">
		<select class = "select" id = "locationSelect" onchange = "optionChange()" style = "right:368px;">
			<option id = "0">지역선택</option>
			<option id = "1">서울</option>
			<option id = "2">경기</option>
			<option id = "3">인천</option>
			<option id = "4">대전/충청/세종</option>
			<option id = "5">부산/대구/경상</option>
			<option id = "6">광주/전라</option>
			<option id = "7">강원</option>
			<option id = "8">제주</option>
		</select>
		<select class = "select" id = "cinemaSelect">
			<option id = "0">영화관선택</option>
		</select>
		<input type = "text" id = "locationSearchbar" placeholder = "검색어를 입력하세요" value = "">
		<button id = "locationSearch" onclick = "searchLocationNotice()"><i id = "locationSearch_img"></i></button>
	
	</div>
	<div class = "FAQlist" id = "accordion">
		<div class = "header-board">
			<span class = "hd1">NO</span>
			<span class = "hd2">지역/영화관</span>
			<span class = "hd3" style = "width:570px;">질문</span>
			<span class = "hd4">작성일</span>
		</div>

			<c:forEach   var="bean" items = "${locationList}" varStatus = "i">
				<div class = "panel">
				<a class = "showdown title other"  href = "${contextPath }/customerboard/readNotice.do?num=${bean.num}&pageNum=${pageNum}&location=${bean.location}&searchVal=${param.searchVal}&selectVal=${param.selectVal}&cinemaSelectVal=${param.cinemaSelectVal}">
					<span class = "hd1" style = "visibility:visible">${bean.num}</span>
					<span class = "hd2">${bean.location}</span>
					<span class = "hd3" style = "width:570px;">${bean.subject}</span>
					<span class = "hd4">${bean.writeDate }</span>
				</a>
				</div>
			</c:forEach>
		
	</div>
	
	<ul class = "custom-pagination mt25">
		
	<c:if test="${empty param.searchVal && empty param.selectVal && empty param.cinemaSelectVal}">
		<c:forEach   var="pageNum" begin = "${startPage}" end = "${locationEndPage}" step = "1" varStatus = "i">
			<li><a name = "list${i.count }" href = "${contextPath }/customerboard/locationnotice.do?pageNum=${i.count }" onclick = "setPage(this);">${i.count}</a></li>
		</c:forEach>
	</c:if>
	<c:if test="${not empty param.searchVal || not empty param.selectVal || not empty param.cinemaSelectVal}">
		<c:forEach   var="pageNum" begin = "${startPage}" end = "${locationEndPage}" step = "1" varStatus = "i">
			<li><a name = "list${i.count }" href = "${contextPath}/customerboard/locationSearch.do?selectVal=${param.selectVal}&searchVal=${param.searchVal}&cinemaSelectVal=${param.cinemaSelectVal}&pageNum=${i.count}" onclick = "setPage(this);">${i.count }</a></li>
		</c:forEach>
	</c:if>
	</ul>
	</div>
	<!-- 지역영화관 공지사항 끝 -->
	</div>
</div>
</div>


<%String pageNum = request.getParameter("pageNum"); %>


	<script type="text/javascript">
		var pageNum = <%=pageNum%>;
		
			if(pageNum == null){
				document.getElementsByName("list1")[0].setAttribute('class', 'active');
				document.getElementsByName("list1")[1].setAttribute('class', 'active');
			}

			document.getElementsByName("list" + pageNum)[0].setAttribute('class', 'active');
			document.getElementsByName("list" + pageNum)[1].setAttribute('class', 'active');
			
			// 전체 공지게시판의 검색 함수
	  		function searchAllNotice() {
	  			
	  			var searchVal = document.getElementById("searchbar").value; // 검색창에 입력한 값
	  			
	  			location.href = "${contextPath}/customerboard/allNoticeSearch.do?searchVal=" + searchVal + "&pageNum=1";
	  			return false;
	  		}
	  		
	  		// 영화관 공지게시판의 검색 함수
			function searchLocationNotice() {
	  			
	  			var select = document.getElementById("locationSelect");
	  			var selectVal = select.options[select.selectedIndex].text; // select 옵션값
	  			var cinemaSelect = document.getElementById("cinemaSelect");
	  			var cinemaSelectVal = cinemaSelect.options[cinemaSelect.selectedIndex].text;
	  			var searchVal = document.getElementById("locationSearchbar").value; // 검색창에 입력한 값
	  			
	  			if(selectVal == "지역선택") {
	  				selectVal = "";
	  			}
	  			if(cinemaSelectVal == "영화관선택") {
	  				cinemaSelectVal = "";
	  			}
	  			
	  			location.href = "${contextPath}/customerboard/locationSearch.do?selectVal=" + selectVal + "&cinemaSelectVal=" + cinemaSelectVal + "&searchVal=" + searchVal + "&pageNum=1";
	  			return false;
	  		}
	  		

	  	</script> 
	  	
	  	<script type="text/javascript"> 
	
	  	function getParameterByName(name) {
	  	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	  	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	  	        results = regex.exec(location.search);
	  	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	  	}
		
	  	document.getElementById("searchbar").value = getParameterByName("searchVal");
		document.getElementById("locationSearchbar").value = getParameterByName("searchVal");
		
		</script>
		
		<script type = "text/javascript">
		function getParameterByName(name) {
	  	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	  	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	  	        results = regex.exec(location.search);
	  	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	  	}
		
		var selectVal = getParameterByName("selectVal");
		var cinemaSelectVal = getParameterByName("cinemaSelectVal");
		
		if (selectVal == "서울") {
			document.getElementById("1").setAttribute('selected', 'selected');
		}else if(selectVal == "경기") {
			document.getElementById("2").setAttribute('selected', 'selected');
		}else if(selectVal == "인천") {
			document.getElementById("3").setAttribute('selected', 'selected');
		}else if(selectVal == "대전/충청/세종") {
			document.getElementById("4").setAttribute('selected', 'selected');
		}else if(selectVal == "부산/대구/경상") {
			document.getElementById("5").setAttribute('selected', 'selected');
		}else if(selectVal == "광주/전라") {
			document.getElementById("6").setAttribute('selected', 'selected');
		}else if(selectVal == "강원") {
			document.getElementById("7").setAttribute('selected', 'selected');
		}else if(selectVal == "제주") {
			document.getElementById("8").setAttribute('selected', 'selected');
		}
		
		
		</script>
		
		<script type="text/javascript">
			
			var pathname = $(location).attr('pathname');
			if(pathname == "/cineus/customerboard/locationnotice.do") {
				$('#locationNotice').addClass('active');
				$('#allNotice').removeClass('active');
				$('#cinemaNoticeList').addClass('active');
				$('#allNoticeList').removeClass('active');
			}else if(pathname == "/cineus/customerboard/locationSearch.do") {
				$('#locationNotice').addClass('active');
				$('#allNotice').removeClass('active');
				$('#cinemaNoticeList').addClass('active');
				$('#allNoticeList').removeClass('active');
			}
		
		</script>
		
		<script type="text/javascript">

			function optionChange(){
				
				var seoul = ["영화관선택", "강남", "강남대로", "강동", "군자", "동대문", "마곡", "목동", "상봉",
					"상암월드컵경기장", "센트럴", "송파파크하비오", "신촌",
					"은평", "이수", "창동", "코엑스", "화곡", "ARTNINE"];
				var gyoung_gi = ["영화관선택", "김포", "남양주", "동탄", "백석", "별내", "분당", "수원", "수원남문", "시흥배곧",
					"안산중앙", "양주", "영통", "의정부민락", "일산", "일산벨라시타", "킨텍스",
					"파주금폰", "파주운정", "파주출판도시", "평택", "하남스타필드"];
				var incheon = ["영화관선택", "검단", "송도", "인천논현", "청라"];
				var daejeon = ["영화관선택", "공주", "대전", "세종", "제천", "진천", "천안", "충주"];
				var gyoungsang = ["영화관선택", "거창", "경산하양", "경주", "구미", "김천", "덕천", "동대구", "문경",
					"부산극장", "부산대", "북대구(칠곡)", "사천", "양산", "울산",
					"창원", "해운대(장산)"];
				var jeonla = ["영화관선택", "광주상무", "광주하남", "남원", "목포", "목포하당(포르모)", "송천",
					"순천", "여수", "전대(광주)", "전주(객사)", "첨단"];
				var gangwon = ["영화관선택", "남춘천", "속초", "원주", "원주센트럴"];
				var jeju = ["영화관선택", "제주"];
				var nomal = ["영화관선택"];
				
				var selectItem = $("#locationSelect option:selected").val();
				
				 
				var changeItem = new Array();
				  
				if(selectItem == "서울"){
				  changeItem = seoul;
				}
				else if(selectItem == "경기"){
				  changeItem = gyoung_gi;
				}
				else if(selectItem == "인천"){
				  changeItem =  incheon;
				}
				else if(selectItem == "대전/충청/세종"){
					  changeItem = daejeon;
				}
				else if(selectItem == "부산/대구/경상"){
					  changeItem =  gyoungsang;
				}
				else if(selectItem == "광주/전라"){
					  changeItem =  jeonla;
				}
				else if(selectItem == "강원"){
					  changeItem =  gangwon;
				}
				else if(selectItem == "제주"){
					  changeItem =  jeju;
				}else {
					changeItem = nomal;
				}
				 
				$('#cinemaSelect').empty();
				
				for(var count = 0; count < changeItem.length; count++){                
				                var option = $("<option>"+changeItem[count]+"</option>");
				                $('#cinemaSelect').append(option);
				}
				
			}
		</script>
		
		<script type="text/javascript">
		

		var seoul = ["강남", "강남대로", "강동", "군자", "동대문", "마곡", "목동", "상봉",
			"상암월드컵경기장", "센트럴", "송파파크하비오", "신촌",
			"은평", "이수", "창동", "코엑스", "화곡", "ARTNINE"];
		var gyoung_gi = ["김포", "남양주", "동탄", "백석", "별내", "분당", "수원", "수원남문", "시흥배곧",
			"안산중앙", "양주", "영통", "의정부민락", "일산", "일산벨라시타", "킨텍스",
			"파주금폰", "파주운정", "파주출판도시", "평택", "하남스타필드"];
		var incheon = ["검단", "송도", "인천논현", "청라"];
		var daejeon = ["공주", "대전", "세종", "제천", "진천", "천안", "충주"];
		var gyoungsang = ["거창", "경산하양", "경주", "구미", "김천", "덕천", "동대구", "문경",
			"부산극장", "부산대", "북대구(칠곡)", "사천", "양산", "울산",
			"창원", "해운대(장산)"];
		var jeonla = ["광주상무", "광주하남", "남원", "목포", "목포하당(포르모)", "송천",
			"순천", "여수", "전대(광주)", "전주(객사)", "첨단"];
		var gangwon = ["남춘천", "속초", "원주", "원주센트럴"];
		var jeju = ["제주"];
		
		var selectItem = $("#locationSelect option:selected").val();
		
		 
		var changeItem = new Array();
		  
		if(selectItem == "서울"){
		  changeItem = seoul;
		}
		else if(selectItem == "경기"){
		  changeItem = gyoung_gi;
		}
		else if(selectItem == "인천"){
		  changeItem =  incheon;
		}
		else if(selectItem == "대전/충청/세종"){
			  changeItem = daejeon;
		}
		else if(selectItem == "부산/대구/경상"){
			  changeItem =  gyoungsang;
		}
		else if(selectItem == "광주/전라"){
			  changeItem =  jeonla;
		}
		else if(selectItem == "강원"){
			  changeItem =  gangwon;
		}
		else if(selectItem == "제주"){
			  changeItem =  jeju;
		}
		 
		$('#cinemaSelect').empty();
		$('#cinemaSelect').append($("<option>영화관선택</option>"));
		
		for(var count = 0; count < changeItem.length; count++){                
		                var option = $("<option>"+changeItem[count]+"</option>");
		                $('#cinemaSelect').append(option);
		}

		
		</script>

</body>
</html>