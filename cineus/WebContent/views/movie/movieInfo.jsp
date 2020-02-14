<%@page import="java.util.ArrayList"%>
<%@page import="movie.ReviewDAO"%>
<%@page import="movie.ReviewBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>CINEUS</title>


  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
 

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<link rel="stylesheet" type="text/css" href="${context}/css/common.css">
	
	<!-- 갤러리 -->
	<link rel="stylesheet" type="text/css" href="${context}/css/gallery_style.css">
	<style>
		table{
			text-align: left;
		}
		td:nth-child(1) {
 			width:40%;
		}
		table img{
			width:90%;
			height:auto
		}
		
		.btn-primary2{
background-color: #1f0DA8;
color:white;
}
.btn-primary2:hover{
color:white;
}
.info .row{
color:black;
    line-height: 30px;
    font-size:14px;
    /* letter-spacing: -1px; */
}
.info .row{
margin-bottom:40px;
/* border-top: 1px gray solid; */
}	
.larger{
	font-size:16px;
	font-weight:bold;
}
#btn_go_to_list, #btn_reserve{
padding : 10px 10px;
}
#btn_go_to_list{
margin-right: 10px;
}
#btn_reserve{
}
#container-fluid{
	max-width:1100px;
	padding-left: 0;
	padding-right: 0;
}

.starR{
	background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
	background-size: auto 100%;
	width: 30px;
	height: 30px;
	display: inline-block;
	text-indent: -9999px;
	cursor: pointer;
}

.starR.on{background-position:0 0;}

.review_con {
	float: left;
}


.review_con img {
	height: 70px;
	width: 70px;
	margin-left: 100px;
}

.re1 {
	float: left;
	margin-right: 30px;
	margin-left: 30px;
}

.re2 {
	wi
}

.review_con2 {
	height: 80px;
	width: 600px;
	border-radius: 10px 10px 10px 10px;
	/* margin-left: 120px;
	margin-right: 80px; */
	display: table-cell;
	vertical-align: middle;
	background-color: #f8f8fa;
}

.review_del {
	
	position: absolute;
}

.review_pag ul {
	list-style:none;
	float:left;
	display:inline;
}

.review_pag ul li {
	float: left;
}

.review_pag ul li a {
	float:left;
	padding: 6px;
	margin-right:50px;
	width:30px;
	color:#000;
	font:bold 12px tahoma;
	border:1px solid #eee;
	text-align:center;
	text-decoration:none;
}

.review_pag ul li a:hover, .review_pag ul li a:focus {
	color:#fff;
	border:1px solid #f40;
	background-color:#f40;
}

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

 <br><br><br>
 
 
 <div class="container-fluid" id="container-fluid">
	<div class="container info">
		<div class="row">
	<!-- 영화 상세정보 보여주기 -->
			<div class="col col-md-4" style="padding-left:0">
				<%-- <img src="${context}/images/movie/${m.movie_ID}.jpg" id="img_info" alt=""  data-toggle="lightbox">
				<span>포스터 크게보기</span>  보류--%>
				<%-- <a href="#" onclick="image_popup(${m.movie_ID})"> --%>
   				 	<img src="${context}/images/movie/${m.movie_ID}.jpg" class="img-fluid">
				<!-- </a> -->
			</div>
			<div class="col col-md-8" style="padding-right:0">
				<h3>${m.title}</h3>
				${m.title_en}
				<hr>
				<div class="row" >
					<div class="col col-md-8">
							제작연도 : ${m.product_year}년<br>
							러닝타임 : ${m.show_time}분<br>
							개봉일 : ${m.start_date}<br>
						<c:if test="${m.end_date ne null}">
							상영종료일 : ${m.end_date}
						</c:if>
					</div>
					<div class="col col-md-4">
						<button class="btn btn-primary2 col-sm" id="btn_reserve">예매하기</button>
					</div>
					<br><br><br><br><br><br>
				</div>
				<hr style="margin-top:200px">
				<div class="row" >
					<div class="col col-md-6">
					</div>
					<div class="col col-md-3">
						<button class="btn btn-outline-dark btn-block" id="btn_like" ><i class="fa fa-heart"></i>
							<span id="num_like">${m_like}</span>
						</button>
					</div>
					<div class="col col-md-3">
						<button class="btn btn-outline-dark btn-block" id="btn_schedule" >
							상영시간표
						</button>	
					</div>
				</div>
			</div> <!-- 오른쪽 col 끝 -->
		</div> <!-- row끝 -->
		
		<div class="row">
			<span class="larger">줄거리</span>
			<br>
			${m.plot}
		</div>
	<c:if test="${m.trailer ne null}">
		<div class="row" >
			<span class="larger">동영상</span>
		</div>
		<div class="row">
			<iframe src="${m.trailer}" frameborder='no' scrolling='no' marginwidth='0' marginheight='0' WIDTH='544' HEIGHT='306' allow='autoplay' allowfullscreen ></iframe>
		</div>
	</c:if>
	
		<div class="row" id="row_for_images">
			<span class="larger">사진</span>
		</div>
		<div class="row">
			<div id="div_for_images"></div>
		</div>
		<br><br><br><br><br><br><br>
	</div> <!-- container 끝 -->
	
	<!------------------------------ 한줄평 ---------------------------->
	<form action="${context}/movie/insertReview.do">
		<div class="container pl-0 pr-0 mb-5 pb-5">
			<div class="row">
				<h5>한줄평</h5>
			</div>
			<div class="row mb-5">
				<div class="col col-3">
					<div class="starRev">
						<span class="starR on">별1</span>
						<span class="starR">별2</span>
						<span class="starR">별3</span>
						<span class="starR">별4</span>
						<span class="starR">별5</span>
					</div>
				</div>
				<div class="col col-7">
					<input type="hidden" name="movie_ID" value="${m.movie_ID}">
					<input type="hidden" name="review_name" value="<%=(String)session.getAttribute("id")%>">
					<input type="hidden" name="review_star" id="review_star" value="1">
					<input type="text" id="contents" name="review_content" style="height: 50px; width:100%">
				</div>
				<div class="col col-2">		
					<input type="submit" class="btn btn-block btn-primary2" id="review_btn" style="height: 50px;" value="등록">
				</div>
			</div><!-- .row 끝 -->
			<div class="row">	
				<c:forEach var="r" items="${review}" varStatus="status">
				<div class="review_con col col-2 pl-0 pr-0">
					<a style="width: 20px; height: 20px;"><img src="../images/user_img.png"></a>
					<p style="margin-left: 118px;"><c:out value="${r.review_name}"/></p>
				</div>
				<div class="review_con2 col col-9">
					<div class="re1">별점: <i class="fas fa-star"></i><c:out value="${r.review_star}"/></div>
					<div class="re2">관람평: <c:out value="${r.review_content}"/></div>
				</div>
				<div class="review_del col col-1 pr-0">
					<c:if test="${id == r.review_name}">
					<input type="button" class="btn btn-outline-dark btn-block" onclick="window.location.href='${context}/movie/deleteReview.do?review_num=${r.review_num}&movie_ID=${r.movie_ID}'" id="review_del" value="삭제">
					</c:if>
				</div>
						<!-- <hr> -->
								
				<c:if test="${id != r.review_name}">
							
				</c:if>
				</c:forEach>
			</div><!-- .row 끝 -->
			<div class="row">
				<div class="col col-4"></div>
				<div class="col col-6 review_pag">
					<c:forEach   var="pageNum" begin = "${startPage}" end = "${endPage}" step = "1" varStatus = "i">
					<ul>
						<li>
							<a name = "list${i.count }" href = "${context}/movie/getMovieInfo.do?movie_ID=${movie_ID}&pageNum=${i.count }">${i.count}</a>
						</li>
					</ul>
					</c:forEach>
				</div>
				<div class="col col-2"></div>
			</div><!-- .row 끝 -->
		</div><!-- .container 끝 -->
	</form>
	<!------------------------------ 한줄평 끝 ---------------------------->
</div> <!-- .container-fluid 끝 -->


<!-- ------------------내용 끝------------------ -->





<%-- <%
String referer = (String)request.getHeader("REFERER");
%> --%>


<!-- 보고싶어 버튼 초기상태 -->
<!-- 보고싶어 on 상태라면 ison 속성을 붙여준다. -->
<c:if test="${m_like_ison eq true}">
	<script>
	$(function () {
		$("#btn_like").prop("ison",true);
		$("#btn_like").css("background-color","#343a40").css("color","white");
	})
	</script>
</c:if>
  <!-- 보고싶어 버튼 초기상태 끝 -->


<script>
	function toggle_like(m_id, c_id){
		$.ajax({
			url:'${context}/movie/movieLikeToggle.do',
			type:'post',
			data: {'m_id' : m_id, 'c_id':c_id},
			/* dataType:'json', */
			/* async: false, */
			error:function(jqXHR, textStatus, errorThrown){
				//alert("좋아요 토글 중 오류 발생");
				alert(errorThrown);
			},
			success:function(data){
				if(data==true){ //보고싶어 토글 성공
				}
				else{ 
				}
			}//success
		});  //ajax
	}
		
	
	
	
</script>


<script>
	<%-- $("#btn_go_to_list").on("click",function(){
		//history.back();  X
		location.href="<%=referer%>";
		
	}) --%>
	
	$("#btn_like").on("click",function(){
		//like 버튼 눌러졌을 때 숫자 업뎃
		var $this=$(this);
		var id="<%=(String)session.getAttribute("id")%>";
		//현재 표시되는 like 개수를 저장해둔다.
		var curr_val=parseInt($("#num_like").text());
		
		if(id!="null" && id!="undefined"){
			//alert("로그인 중입니다.");
			
			//on 상태이면 off 하고 off 상태이면 on 한다
			toggle_like("${m.movie_ID}",id);
			
			if($this.prop("ison")){ //on인 경우 off한다
				//like 개수 업데이트(-1)
				$("#num_like").text(curr_val-1);
				$this.removeProp("ison");
				$this.css("background-color","white").css("color","black"); //초기상태로 돌림
			}
			else{	//off인 경우 on한다
				//like 개수 업데이트(+1)
				$("#num_like").text(curr_val+1);
				
				$this.prop("ison",true);
				$this.css("background-color","#343a40").css("color","white"); //
			}
			
		}
		else{ 
			alert("보고싶어 버튼을 누르려면 먼저 로그인하세요.");
		return;
		}
	})
	
	$("#btn_schedule").on("click",function(){
		window.location.href = "${context}/schedule/getSchedule_movie.do?movie_ID=${m.movie_ID}";
	});
	
	$("#btn_reserve").on("click",function(){
		window.location.href = "${context}/schedule/getSchedule_movie.do?movie_ID=${m.movie_ID}";
	});
</script>




<!-- -------갤러리------- --> 
<script> 
	$.ajax({
		  url:'${context}/movie/getMoviePictures.do',
		  type:'post',
			data: {'path' : '/images/movie/${m.movie_ID}'},
			dataType: "json",
			error:function(jqXHR, textStatus, errorThrown){
				//alert(errorThrown);
				//영화에 사진이 없는 경우에 발생함
			},
		 	 success: function(data){
                $gallery=$("#div_for_images"); //이미지들을 display할 영역
                $("#row_for_images").append("&nbsp;&nbsp;<span style='font-size:16px'>"+data.length+" photos</span>");
                $gallery.append("<ul id='WS-LiSli' class='grid'>");
                $list=$("#WS-LiSli");
		 		 for(var i=0; i<data.length ; i++){
		 			$list.append("<li><img src='${context}/images/movie/${m.movie_ID}/"+data[i]+"'></li>");
		 		 }
		 		$gallery.append("</ul>");
		 	}
	});


</script>
<!-- -------갤러리 끝------- -->
<!-- -------별       점------- -->
<script>
$('.starRev span').click(function(){
	$(this).parent().children('span').removeClass('on');
	$(this).addClass('on').prevAll('span').addClass('on');
	
	//
	$("#review_star").val($(".starR.on").length);
	//
	return false;
});

</script>

 
	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->
</body>
</html>