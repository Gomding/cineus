<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

	<link rel="stylesheet" type="text/css" href="${context}/css/common.css">
	<link rel="stylesheet" type="text/css" href="${context}/css/card.css">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

	<link rel="stylesheet" type="text/css" href="${context}/css/common.css">
	<link rel="stylesheet" type="text/css" href="${context}/css/admin.css">
	
	<style>
	.card-desc a:hover{
		color:white;
	}
	.card-desc a{
		text-decoration:none;
	}
	</style>
</head>
<body>
	 <div class="container-fluid">
	 	<!-- 메뉴  -->
		<jsp:include page="/views/common/menu.jsp" />
		<!-- 메뉴 끝 -->
		
		<!-- 어드민 메뉴 -->
		<div class="sidenav">
			<br><br><br>
			<a href="${context}/customer/mypage.do">MyPage 메인</a><hr>
			  <a href="${context}/customer/getMovieLikeList.do">보고싶어</a><hr>
		</div>
		<!-- 어드민 메뉴 끝 -->
		
		<div class="main">
			<!-- 마이페이지 내용 시작 -->
			
				<!-- 영화 목록 보여주기 -->
	<!-- details card section starts from here -->
			<section class="details-card">
				<c:choose>
					<c:when test="${empty list}">
						<br><br>
						<h6><strong>${id}님이 보고싶어 누른 영화가 없습니다.</strong></h6>
					</c:when>
				<c:otherwise>
					<div class="container">
						<h6><strong>${id}님이 ${list.size()}편의 영화를 보고싶어에 등록했습니다.</strong></h6>
					</div>
				    <div class="container">
				        <!-- <div class="row"> -->
				        <!-- 최신영화 순으로 보여준다. -->
				        <c:forEach var="m" items="${list}" varStatus="loop"> 	
				        	<c:if test="${loop.index%4==0}">
				        		<div class="row">
				        	</c:if>
					            <div class="col-md-3">
					                <div class="card-content">
					                    <div class="card-img">
					                        <img src="${context}/img/movie/${m.movie_ID}.jpg" alt="">
					                        <%-- <span><h4>${loop.index+1}</h4></span> --%>
					                    </div>
					                    <div class="card-desc">
					                        <h3>${m.title}</h3>
					                        	<a href="${context}/movie/getMovieInfo.do?movie_ID=${m.movie_ID}" class="btn-card">상세정보</a> &nbsp;
					                            <a href="#" class="btn-card">예매하기</a>   
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
				
				
	 		<!-- 마이페이지 내용 끝 -->
	 	</div> <!-- main 끝 -->
	 </div> <!-- container-fluid 끝 -->
</body>
</html>