<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="context" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${context}/css/demo.css">
<link rel="stylesheet" href="${context}/css/navigation-icons.css">
<link rel="stylesheet" href="${context}/css/slicknav/slicknav.min.css">

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${context}/css/common.css">
	
	<link rel="stylesheet" type="text/css" href="${context}/css/card.css">

<style>
 .container-fluid {
   max-width:1110px;
}
#more_list_div{
padding-left: 0px;
padding-right: 0px;

}
#more_list_btn{
border-radius: 0px;
padding-top: 15px;
padding-bottom: 15px;
font-size:16px;
}
.btn-primary2{
/* background-color: #1f0DA8; 파랑색*/
background-color:#ececec;
/* color:white; */
color:#222;
}
.btn-primary2:hover{
/* color:white; */
border:2px gray solid;
background-color:white;
}
#temp_menu .navbar{
	height:69px;
}
#temp_menu .navbar a{
	color : #007bff;
	font-weight:500;
}
.btn_dday{
	background-color:#1f0da8;
	color:white;
	padding : 4px 10px;
	border-radius: 0px;
	font-size:16px;
	fonnt-weight:500;
}
#container-fluid{
	max-width:1100px;
	padding-right: 0;
	padding-left: 0;
}


/* 서브메뉴 */
.center-home-div {
margin-top: 100px;
    background-color: #f2f2f2;
    border-top: 1px solid #e1e1e1;
    font-size: 16px;
    height:54px;
    /* border-bottom:3px #1f0da8 solid; */
}
.center-home { /* ul */
display: flex;
flex-wrap: wrap;
    list-style: none;
    margin: 0 auto;
    padding: 0;
    width: 1100px;
    height: 54px;
    font-weight: bold;
        display: block;
}
.center-home a{
	font-weight:900;
	display:block;
}
.center-home a, .center-home a:link, .center-home a:visited{
    color: #777;
}
.center-home a:link:active, .center-home a:visited:active, .center-home a:hover{
	color:#503396;
}
.center-home li {
display: list-item;
    line-height: 54px;
    font-weight: bold;
    margin-right:50px;
}
/* 서브메뉴 끝*/
</style>

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


	<div class="container-fluid">
	<br>
			<div id=fa_5>
		<h5>나의 무비스토리</h5>
	</div>
	<!-- 영화 목록 보여주기 -->
	<!-- details card section starts from here -->
			<section class="details-card">
				<c:choose>
					<c:when test="${empty list}">
						<h6><strong>현재 상영중인 영화가 없습니다.</strong></h6>
					</c:when>
				<c:otherwise>
					<%-- <div class="container">
						<h6><strong>현재 ${list.size()}편의 영화가 상영중입니다.</strong></h6>
					</div> --%>
				    <div class="container" id="movies_wrapper">
				        <!-- <div class="row"> -->
				        <!-- 최신영화 순으로 보여준다. -->
				        <c:forEach var="m" items="${list}" varStatus="loop"> 	
				        	<c:if test="${loop.index%4==0}">
				        		<div class="row">
				        	</c:if>
					            <div class="col-md-3">
					                <div class="card-content" id="${loop.index}">
					                    <div class="card-img">
					                        <img src="${context}/images/movie/${m.movie_ID}.jpg" alt="">
					                        
					                    </div>
					                    <div class="card-desc">
					                        <div class="title text-truncate">${m.title}</div>
					                        <div class="date">${m.start_date}</div>
					                        
					                        <script>
					                        	var $pos=$("#"+"${loop.index}"+" .date");
					                        	var start_date=$pos.text();
						                        var date = moment(start_date);
						                        var now = moment();
						                        if (now > date) {
						                           // date is past
						                        	$(".card-desc .date").text("");
						                        } else {
						                           // date is future
						                           var duration = moment.duration(date.diff(now));
													var days = Math.floor(duration.asDays());		
													$pos.append("&nbsp;&nbsp;&nbsp;&nbsp;<span class='btn_dday float-right'>D-"+days+"</span>");
						                        }
					                        </script> 
					                        
					                        
					                        <div class="container btn-container">
					                        	<div class="row">
					                       			<div class="col col-md-6">
					                        			<a class="btn" href="${context}/movie/getMovieInfo.do?movie_ID=${m.movie_ID}">상세정보</a>
					                        		</div>
					                        		<div class="col col-md-6">
					                            		<a class="btn" href="${context}/schedule/getSchedule_movie.do?movie_ID=${m.movie_ID}">예매하기</a>
					                            	</div> 
					                            </div>
					                         </div>
					                    </div>
					                </div><!-- card-content 끝 -->
					            </div> <!-- col 끝 -->
					        <c:if test="${loop.index%4==3}">
				        		</div> <!-- div for a row -->
				        	</c:if>
				         </c:forEach>
				        <!-- </div> --> <!-- row 끝 -->
				    </div> <!-- container 끝 -->
				 </c:otherwise>
				</c:choose>
			</section>
			<!-- details card section starts from here -->
				<!-- 영화 목록 보여주기 끝 -->
			
	</div>
	
	
	
	
	
	
	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->	
</body>
</html>