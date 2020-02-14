<%@page import="java.time.ZoneId"%>
<%@page import="movie.MovieDTO"%>
<%@page import="java.time.Duration"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="context" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>CINEUS</title>
 
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
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
    border-bottom:3px #1f0da8 solid;
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

	<!-- 헤더가 들어가는 곳 -->
	<jsp:include page="/inc/header.jsp"/>
	<!-- 헤더가 들어가는 곳 -->
    <!-- </head>
		 <body> -->

	<script>
		$("#menu2 *").css("color","#111").css("borderColor","#111");
		$("#menu2 .btn_menu_all").css("backgroundColor","#fff").css("borderColor","#111");
	</script>
	
 
 <!-- 서브메뉴바 -->
 <div class="content-wrap">
	<div class="center-home-div">
		<ul class="center-home  nav list-inline" id="submenu">
			<li class = "center-home-inner list-inline-item">
				<a class = "center-text" id="submenu1" href="#">최신개봉작</a>
			<li>
			<li class = "center-home-inner list-inline-item">
				<a class = "center-text" id="submenu2" href="#">상영예정작</a>
			<li>
			<!-- <li class = "center-home-inner list-inline-item">
				<a class = "center-text" id="submenu3" href="#">♥보고싶어</a>
			<li> -->
		</ul>
	</div>
</div>
<!-- 서브메뉴바 끝-->


 <div class="container-fluid" id="container-fluid">
	
	
		<!-- 서브메뉴바// -->
<!-- <div id="temp_menu">
	<nav class="navbar navbar-expand-sm bg-light">
	  <ul class="navbar-nav" id="condition">
	    <li class="nav-item">
	      <a class="nav-link" href="javascript:void(0);">최신개봉작</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="javascript:void(0);">상영예정작</a>
	    </li>
	  </ul>&nbsp;&nbsp;|&nbsp;&nbsp; 
	  <ul class="navbar-nav" id="option">
	    <li class="nav-item">
	      <a class="nav-link" href="javascript:void(0);">개봉일순</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="javascript:void(0);">가나다순</a>
	    </li>
	  </ul>
	</nav>
</div>	 -->
	
	
	<br>
	
	<form id="movieListForm" action="${context}/movie/getMoviesList.do" method="post">
		<input type="hidden" name="h_condition" id="h_condition">
		<input type="hidden" name="h_option" id="h_option">
		
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
					                        <c:if test="${loop.index<10}"> <!-- 빨간네모. 10까지만 표시한다. -->
					                        	<span><h4>${loop.index+1}</h4></span>
					                        </c:if>
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
			
			<!-- 더보기 버튼 -->
			<div class="container" id="more_list_div">
				<input type="button" class="btn btn-primary2 btn-block" id="more_list_btn" value="더보기 + ">
			</div>
	</form> <!-- #movieListForm 끝 -->
	
</div> <!-- .container-fluid 끝 -->
<br><br><br><br>


<!-- 카드에 표시되는 내용 수정 -->
<!-- <script>
var limit=12;
$(".card-content .title").each(function(){
	if($(this).text().length>=limit){
		$(this).text($(this).text().substr(0,limit)+"...");
	}
});


</script> -->

<script>
function fn_hide_more_btn(){
	//더보기 버튼 숨기기
	if($(".card-content").length%12!=0){
		$("#more_list_btn").hide();
	};
}

fn_hide_more_btn();
</script>

<script>
	/* 더보기 버튼을 눌렀을 때 */
	$("#more_list_btn").on("click",function(){
		/* alert("클릭!"); */
		/* 12개(3줄)씩 더 보여준다 */
		/* var curr_list_len="${list.size()}"; */
		var curr_list_len=$(".card-content").length;
		var h_condition=$("#h_condition").val();
		var h_option=$("#h_option").val();
		$.ajax({
			url:'${context}/movie/getMoviesListMore.do',
			type:'post',
			data: {'curr_list_len' : curr_list_len, 'h_condition':h_condition, 'h_option':h_option},
			dataType: "json",
			error:function(jqXHR, textStatus, errorThrown){
				alert(errorThrown);
			},
			success: function(data){
	        	$el=$("#movies_wrapper"); //이미지들을 display할 영역
	        	var str="";
				for(var i=0; i<data.length ; i++){
			 		var card_id=curr_list_len+i;
			 		
			 		str="<div class='col-md-3'>"
			 			 	+"<div class='card-content' id='"+card_id+"'>"
				            +"<div class='card-img'>"
				            +"<img src='${context}/images/movie/"+data[i].movie_ID+".jpg'>"
				            +"</div>"
				            +"<div class='card-desc'>"
				            +"<div class='title'>"+data[i].title+"</div>"
				            +"<div class='date'>"+data[i].start_date+"</div>"
				       		+"<div class='container btn-container'>"
					       +"<div class='row'>"
					       +"<div class='col col-md-6'>"
					       +"<a class='btn' href='${context}/movie/getMovieInfo.do?movie_ID="+data[i].movie_ID+"'>상세정보</a>"
				           +"</div>"
				           +"<div class='col col-md-6'>"
				           +"<a class='btn' href='${context}/schedule/getSchedule_movie.do?movie_ID="+data[i].movie_ID+"'>예매하기</a>"
				        	+"</div>"
				        	+"</div>"
				            +"</div>"
				            +"</div>"
				            +"</div><!-- card-content 끝 -->"
				            +"</div> <!-- col 끝 -->";
				   $el.append(str);
				   if(card_id%4==3 || i==data.length-1) $("#movies_wrapper > .col-md-3").wrapAll("<div class='row'></div>");
				   
				   var $pos=$("#"+card_id+" .date");
	            	var start_date=$pos.text();
	                var date = moment(start_date);
	                var now = moment();
	                if (now > date) {
	                   // date is past
	                	$pos.text("");
	                } else {
	                   // date is future
	                   var duration = moment.duration(date.diff(now));
						var days = Math.floor(duration.asDays());		
						$pos.append("&nbsp;&nbsp;&nbsp;&nbsp;<span class='btn_dday'>D-"+days+"</span>");
	                }
	                
			 	}//for 끝
				fn_hide_more_btn();
			}/* success 끝 */
		}); /* ajax 끝 */
	});
</script>



	<!-- 메뉴 초기값 설정 -->
	<!-- ///////////////// -->
	<c:if test="${list_condition!=2}"> 
		<script>
			$("#submenu #submenu1").css("color","#503396");
			$("#h_condition").val("1");
		</script>
	</c:if>
	<c:if test="${list_condition==2}">
		<script>
			$("#submenu #submenu2").css("color","#503396");
			$("#h_condition").val("2");
		</script>
	</c:if>
	<!-- ///////////////// -->
	<c:if test="${list_option!=2}"> 
		<script>
			$("#option li a").eq(0).css("font-weight","bold");
			$("#h_option").val("1");
		</script>
	</c:if>
	<c:if test="${list_option==2}">
		<script>
			$("#option li a").eq(1).css("font-weight","bold");
			$("#h_option").val("2");
		</script>
	</c:if>
	
	
	
<script>	
	/* 메뉴를 눌렀을 때 */
	$("#submenu #submenu1").on("click",function(){
		$("#h_condition").val("1");
		$("#movieListForm").submit();
	});
	$("#submenu #submenu2").on("click",function(){
		$("#h_condition").val("2");
		$("#movieListForm").submit();
	});
	$("#option a").eq(0).on("click",function(){
		$("#h_option").val("1");
		$("#movieListForm").submit();
	});
	$("#option a").eq(1).on("click",function(){
		$("#h_option").val("2");
		$("#movieListForm").submit();
	});
</script>

	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->
</body>
</html>