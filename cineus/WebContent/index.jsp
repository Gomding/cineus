<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="context" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${context}/css/common.css">
<link rel="stylesheet" type="text/css" href="${context}/css/card.css">
<style type="text/css">
body{font-size: 0}

/* 탭메뉴 */
#pills-tabContent .col-md-3{
	padding-right: 0px;
	padding-left: 0px;
}
#pills-tab.nav-pills .nav-link.active, #pills-tab.nav-pills .show>.nav-link {
	 color:white;
	 background-color:#666;
	 border-radius:0px;
 }
#pills-tab a{
	font-size:16px;
	color:gray;
	border:1px solid #666;
	border-radius:0px;
	font-weight:bold;
	width:200px;
	text-align:center;
}
.btn_dday{
	background-color:#1f0da8;
	color:white;
	padding : 4px 10px;
	border-radius: 0px;
	font-size:16px;
	fonnt-weight:500;
}
/* 탭메뉴 끝 */
.div_more a{
	font-size:16px;
	font-weight:bold;
	color:#666;
}
.div_more2 a{
	font-size:30px;
	font-weight:bold;
	color:#666;
	display:block;
    line-height: 1.2;
}
/* 공지사항 씨네찬스 고객센터 등 */
.post-entry-1{
	color:black;
}
.cs_div .cs_icon{
	width:70px;
	height:70px;
	display:block;
    margin:auto;
    opacity: 0.3;
}
.cs_div table td{
	padding-top:1rem;
	padding-bottom:0.75rem;
	text-align:center;
	cursor: pointer;
}
.cs_div span{
	color:#777;
	display:block;
	margin-top: 14px;
	font-weight:bold;
}

</style>
  <title>CINEUS</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">  
  
	<!-- 헤더가 들어가는 곳 -->
	<jsp:include page="/inc/header.jsp"/>
	<!-- 헤더가 들어가는 곳 -->
    <!-- </head>
		 <body> -->
<div class="owl-carousel hero-slide owl-style">
	<div class="hero-2">
		<a href="#"><img src="images/carousel/Untitled-1.jpg"></a>
	</div>
	<div class="hero-2">
		<a href="#"><img src="images/carousel/Untitled-2.jpg"></a>
	</div>
	<div class="hero-2">
		<a href="#"><img
			src="images/carousel/140877-1A78-477C-8AE2-2E15987C43E3.jpg"></a>
	</div>
</div>
    
    

    <div class="site-section" style="padding-top:3em; padding-bottom:3em;">
      <div class="container" style="max-width:1100px;">
      
	      <ul class="nav nav-pills mb-3 justify-content-center" id="pills-tab" role="tablist">
			  <li class="nav-item">
			    <a class="nav-link active" id="pills-tab-1" data-toggle="pill" href="#pills-1" role="tab" aria-controls="pills-1" aria-selected="true">최신개봉작</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" id="pills-tab-2" data-toggle="pill" href="#pills-2" role="tab" aria-controls="pills-2" aria-selected="false">상영예정작</a>
			  </li>
		 </ul>
		 <div class="tab-content" id="pills-tabContent">
		 	 <div class="tab-pane fade show active" id="pills-1" role="tabpanel" aria-labelledby="pills-tab-1">
		 	 	<div class="row mb-2">
		 	 		<div class="col text-right pr-0 div_more">
		 	 			<a href="${context}/movie/getMoviesList.do">+ 더보기</a>
		 	 		</div>
		 	 	</div>
		 	 </div>
		 	 <div class="tab-pane fade" id="pills-2" role="tabpanel" aria-labelledby="pills-tab-2">
		 	 	<div class="row mb-2">
		 	 		<div class="col text-right pr-0 div_more">
		 	 			<a href="${context}/movie/getMoviesList.do?h_condition=2">+ 더보기</a>
		 	 		</div>
		 	 	</div>
		 	 </div>
		  </div>
      
      </div> <!-- container 끝 -->
    </div>

    <div class="hero-2" style="background-image: url('images/carousel/theater-1477670_1920.jpg');">
     <div class="container">
        <div class="row justify-content-center text-center align-items-center">
          <div class="col-md-8">
            <span class="sub-title">GRAND OPENING</span>
            <h4><span class="sub-title">2020. 2</span></h4>
            <h3><span class="sub-title">새롭게 시작하는 CINEUS를 만나보세요!</span></h3>
          </div>
        </div>
      </div>
    </div>

    <!-- <div class="site-section bg-light">
      <div class="container">
       
      </div>
    </div> -->
  

    <div class="site-section bg-light pt-5">
      <div class="container" style="max-width:1100px;">
        <!-- <div class="row mb-5">
          <div class="col-12 section-title text-center mb-5">
            <h2 class="d-block"></h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi, perspiciatis!</p>
            <p><a href="#">View All Products <span class="icon-long-arrow-right"></span></a></p>
          </div>
        </div> -->
        <div class="row">
          <div class="col-lg-4 mb-10 col-md-6 ml-0 pl-0 pr-4">
            <div class="post-entry-1">
              <div class="row">
              	<div class="col col-md-8 text-left"><h2>공지사항</h2></div>
              	<div class="col col-md-4 text-right div_more2">
		 	  		<a href="${context}/customerboard/noticecenter.do">+</a>
		 	  	</div>
		 	  </div>
              <table class="table table-sm table_notice5" style="font-size:16px;color:black;">
              	
              </table>
            </div>
          </div>
          <div class="col-lg-4 mb-4 mb-lg-0 col-md-6 pr-4">
            <div class="post-entry-1">
              <div class="row">
              	<div class="col col-md-8 text-left"><h2>씨네찬스</h2></div>
              	<div class="col col-md-4 text-right div_more2">
		 	  		<a href="${context}/stores/storeList.do">+</a>
		 	  	</div>
		 	  	<table class="table table-sm table_cinechance" style="font-size:16px;color:black;">
		 	  	</table>
		 	  </div>
            </div>
          </div>
          <div class="col-lg-4 mb-4 mb-lg-0 col-md-6 mr-0 pr-0 cs_div">
            <div class="post-entry-1">
              <h2>고객센터</h2>
              <table class="table table-sm table-bordered" style="height:300px;font-size:16px;color:black;">
              	<tr>
              		<td style="width:50%;height:50%;">
              			<img class="cs_icon" src="${context}/images/flaticon/047-conversation.png">
						<span>1:1문의</span>
					</td>
              		<td style="width:50%;">
              			<img class="cs_icon" src="${context}/images/flaticon/038-list.png">
              			<span>단체관람/대관문의</span>
					</td>
              	</tr>
              	<tr>
              		<td style="width:50%;height:50%;">
              			<img class="cs_icon" src="${context}/images/flaticon/025-question-2.png">
              			<span>자주 묻는 질문</span>
              		</td>
              		<td>
              			<img class="cs_icon" src="${context}/images/flaticon/039-question.png">
              			<span>분실물 문의/접수</span>
              		</td>
              	</tr>
              </table>
            </div>
          </div>
        </div>
        <br><br><br><br>
      </div>
    </div>
    
	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->
	
	
	<!-- 이 페이지의 동적컨텐츠는 ajax로 불러온다. -->
	<script>
		$.ajax({
			url:'${context}/movie/getMoviesListForIndex.do',
			type:'post',
			dataType: "json",
			error:function(jqXHR, textStatus, errorThrown){
				alert(errorThrown);
			},
			success: function(data){
	        	$el=$("#pills-1"); //이미지들을 display할 영역
				for(var i=0; i<data.length ; i++){ //data.length는 8이다.
			 		var card_id=i+1; //1~8
			 		//var card_idx=i%4+1; //1~4 1~4
			 		var str="<div class='col-md-3'>"
			 			 	+"<div class='card-content' id='"+card_id+"'>"
				            +"<div class='card-img'>"
				            +"<img src='${context}/images/movie/"+data[i].movie_ID+".jpg'>"
				            +"</div>"
				            +"<div class='card-desc'>"
				            +"<div class='title text-truncate'>"+data[i].title+"</div>"
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
				   if(card_id>4){
					   $el=$("#pills-2");
				   }
				   $el.append(str);
				   /* if(card_id%4==0) $el.children(".col-md-3").wrapAll("<div class='row'></div>"); */
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
				$("#pills-1").children(".col-md-3").wrapAll("<div class='row'></div>");
				$("#pills-2").children(".col-md-3").wrapAll("<div class='row'></div>");
			}/* success 끝 */
		}); /* ajax 끝 */
	</script>
	
	<script>
		$.ajax({
			url:'${context}/customerboard/getNoticeListTop5ajax.do',
			type:'post',
			dataType: "json",
			error:function(jqXHR, textStatus, errorThrown){
				alert(errorThrown);
			},
			success: function(data){
	        	$el=$(".table_notice5"); //이미지들을 display할 영역
	        	if(data.length==0){
	        		$el.append("<tr><td>공지사항이 없습니다.</td></tr>");
	        	}
				for(var i=0; i<data.length ; i++){ //data.length는 5이다.
			 		var str="<tr>"
			 			 	+"<td style='padding-left:0px;'>"+data[i].writeDate
			 			 	+"<br><a style='color:black;' href='${context}/customerboard/readNotice.do?num="+data[i].num+"' title='공지사항 상세보기'>"+data[i].subject+"</a>"
			 			 	+"</td>"
			 			 	+"</tr>";
				   $el.append(str);
			 	}//for 끝
			}/* success 끝 */
		}); /* ajax 끝 */
	</script>
	<script>
		$.ajax({
			url:'${context}/stores/getCineChanceAjax.do',
			type:'post',
			dataType: "json",
			error:function(jqXHR, textStatus, errorThrown){
				alert(errorThrown);
			},
			success: function(data){
	        	$el=$(".table_cinechance"); //이미지들을 display할 영역
	        	if(data.length==0){
	        		$el.append("<tr><td>씨네찬스가 없습니다.</td></tr>");
	        	}
				for(var i=0; i<data.length ; i++){ 
			 		var str="<tr>"
			 			 	+"<td style='padding-left:0px;'>"
			 			 	+"<a style='color:black;' href='${context}/stores/viewStore.do?item_code="+data[i].item_code+"'>"
			 			 	+data[i].item_name
			 			 	+"</a></td>"
			 			 	+"</tr>";
				   $el.append(str);
			 	}//for 끝
			}/* success 끝 */
		}); /* ajax 끝 */
	</script>
	
	
	<script>
	
	$(".cs_div table td").on("click",function(){
		var index=$(this).parent().index()*2+$(this).index();
		if(index==0){
			/* alert("준비중입니다."); */
			window.location.href = "${context}/customerboard/1on1center.do";
		}
		else if(index==1){
			window.location.href = "${context}/customerboard/myRent.do";
		}
		else if(index==2){
			window.location.href = "${context}/customerboard/FAQcenter.do";
		}else if(index==3){
			window.location.href = "${context}/customerboard/mylostarticle.do";
		}
	});
	</script>
	
	<!-- 네이버 로그인시 index.home을 콜백url로 저장하였기 때문에 여기다가 적음. -->	
	<script type="text/javascript">
	  var naver_id_login = new naver_id_login("uOJVRpduguQNBEwrLJXV", "http://192.168.2.19:8090/test/index.home");
	  // 네이버 사용자 프로필 조회
	  naver_id_login.get_naver_userprofile("naverSignInCallback()");
	  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	  function naverSignInCallback() {
		  var Nid = naver_id_login.getProfileData('id');
		  var Nemail = naver_id_login.getProfileData('email');
		  var Nnickname = naver_id_login.getProfileData('nickname');
	
		  $.ajax(
	   			{
	   				type:"post", 
	   				async:false, 
	   				url:"${pageContext.request.contextPath}/members/Naverlogin.me", 
	   				dataType:"text", 
	   				data:{
	   					Nid : Nid,
	   					Nemail : Nemail,
	   					Nnickname : Nnickname
	   				}, 
	   				success:function(data){
	   					location.href = "${pageContext.request.contextPath}/index.home";
	   				},
	   				error:function(data,textStatus){
	   					alert("에러가 발생 했습니다.");
	   				}
	   			}
	   		  );
		  
	  }
	</script>





<!-- 팝업 -->

<script>
	$(document).ready(function(){
		
		// 저장된 쿠키값이 Y가 아니라면 팝업창을 생성
		if ($.cookie("nopopup") != "Y") {
			$(".pop_lay").css('display','block');
		}else{
            $(".pop_lay").css('display','none');
        }
		
		// 저장된 쿠키 "nopopup" 값을 "Y"로 변경하고 페이지를 리로드
		$("#clear_option").click(function(){
			
			// 링크의 페이지 이동 속성 강제 차단
			event.preventDefault(); 
			// 쿠키값을 "N"으로 변경
			$.cookie("nopopup", "N");
			// 페이지 리로드
			window.location.reload();
		});
	});
  </script>	
<div class="pop_lay">
            <p>
	            <a href="${pageContext.request.contextPath}/movie/getMovieInfo.do?movie_ID=20197803">
	            	<img src="${pageContext.request.contextPath}/images/frozen.jpg" style="width: 360px; height: 520px;">
	            </a>
            </p>
            <div class="footer">
                <input type="checkbox" id="nopopup">
                <label for="nopopup" class="font-weight-bold" style="color: white;">다시 보지 않기</label>
                <a href="#" id="close" class="font-weight-bold" style="color: white;">X</a>
            </div>  
</div>
     <script>
        $(document).ready(function(){

            // 닫기 버튼 클릭시
            $("#close").click(function(){
                // 링크의 페이지 이동 속성 강제 차단
                event.preventDefault();

                if ($('#nopopup').is(":checked")){
                    // 쿠키값을 "Y"로 하여 하루동안 저장시킴
                    $.cookie("nopopup", "Y", {
                        expires : 1
                    });
                }

                // 팝업창 닫기
                $(".pop_lay").css('display','none');
            });
            
        });
     </script>		

<!-- 팝업 끝 -->

<!-- 네이버 로그인시 index.home을 콜백url로 저장하였기 때문에 여기다가 적음. -->	
<script type="text/javascript">
  var naver_id_login = new naver_id_login("uOJVRpduguQNBEwrLJXV", "http://192.168.2.19:8090/test/index.home");
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	  var Nid = naver_id_login.getProfileData('id');
	  var Nemail = naver_id_login.getProfileData('email');
	  var Nnickname = naver_id_login.getProfileData('nickname');

	  $.ajax(
   			{
   				type:"post", 
   				async:false, 
   				url:"${pageContext.request.contextPath}/members/Naverlogin.me", 
   				dataType:"text", 
   				data:{
   					Nid : Nid,
   					Nemail : Nemail,
   					Nnickname : Nnickname
   				}, 
   				success:function(data){
   					location.href = "${pageContext.request.contextPath}/index.home";
   				},
   				error:function(data,textStatus){
   					alert("에러가 발생 했습니다.");
   				}
   			}
   		  );
	  
  }
</script>

</body>
</html>