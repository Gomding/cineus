<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%request.setCharacterEncoding("UTF-8");%>
<c:set var="context" value="${pageContext.request.contextPath}" />

<link href="https://fonts.googleapis.com/css?family=Cinzel:400,700|Montserrat:400,700|Roboto&display=swap" rel="stylesheet">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link rel="stylesheet" href="${context}/fonts/icomoon/style.css">
<link rel="stylesheet" href="${context}/css/bootstrap.min.css">
<link rel="stylesheet" href="${context}/css/jquery-ui.css">
<link rel="stylesheet" href="${context}/css/owl.carousel.min.css">
<link rel="stylesheet" href="${context}/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${context}/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${context}/css/jquery.fancybox.min.css">
<link rel="stylesheet" href="${context}/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="${context}/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="${context}/css/aos.css">
<link href="${context}/css/jquery.mb.YTPlayer.min.css" media="all" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${context}/css/style.css">
<link rel="stylesheet" href="${context}/css/menu2.css">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
		
<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
 -->
 <link rel="stylesheet" href="${context}/css/main_modal.css" />
 

<style>
#nav_main{
	height:60px;
	line-height:0px;
	border-bottom:2px solid #aaa;
}
/* 이상하게 적용이 안돼서 여기에 적음 */
#nav_main.navbar .container{
	max-width:1100px;
	height:100%;
	padding-left: 0;
	padding-right: 0;
	
}
#nav_main.navbar-default {
    background-color: white;
    border-color: #e7e7e7;
}
#nav_main.navbar-fixed-top {
    top: 0;
    border-width: 0 0 1px;
    position: fixed;
    right: 0;
    left: 0;
    z-index: 1030;
    padding:0;
    margin:0;
}
#nav_main.navbar-fixed-top .navbar-collapse {
    max-height: 60px;
}

/* 이상하게 적용이 안돼서 여기에 적음 끝*/
#nav_main .nav ul{
	padding-bottom: -5px;
	padding-top: 0px;
	margin-top: 0px;
}
#nav_main .nav li{
	font-size: 16px;
	line-height: 60px;
	font-weight: bold;
	width: 110px;
	text-align: center;
}
#nav_main img{
	padding-bottom:2px;
}

#nav_main .nav li{
	border-right: 1px solid #aaa;
}
#nav_main .nav li:first-child{
	border-left: 1px solid #aaa;
}
#nav_main a, 
#nav_main a:link, 
#nav_main a:visited,
#nav_main a:link:active,
#nav_main a:visited:active
 {
  color: black;
  text-decoration: none;
  cursor: pointer;
  display:block;
}
#nav_main .list-inline-item:not(:last-child) {
    margin-right: 0;
}
</style>

</head>


<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">


	<!-- Modal HTML embedded directly into document -->
	<div id="ex1" class="modal">
		<div class="menu_all">
			<div class="cols col1">
				<dl>
					<dt><a href="#" title="예매">예매</a></dt>
					<dd><a href="#" title="예매안내">예매안내</a></dd>
					<dd><a href="#" title="빠른예매">빠른예매</a></dd>
					<dd><a href="#" title="상영시간표">상영시간표</a></dd>
					<dd><a href="#" title="예매 확인/취소">예매 확인/취소</a></dd>
				</dl>
				<dl>
					<dt><a href="#" title="영화">영화</a></dt>
					<dd><a href="#" title="박스오피스">박스오피스</a></dd>
					<dd><a href="#" title="최신개봉작">최신개봉작</a></dd>
					<dd><a href="#" title="상영예정작">상영예정작</a></dd>
					<dd><a href="#" title="보고 싶은 영화">보고 싶은 영화</a></dd>
				</dl>
			</div>
			<div class="cols col2">
				<dl>
					<dt><a href="#" title="영화관">영화관</a></dt>
					<dd><a href="#" title="영화관 찾기">영화관 찾기</a></dd>
				</dl>
				<dl>
					<dt><a href="#" title="스토어">스토어</a></dt>
					<dd><a href="#" title="메가티켓">메가티켓</a></dd>
					<dd><a href="#" title="메가찬스">메가찬스</a></dd>
					<dd><a href="#" title="스패셜굿즈/콤보">스패셜굿즈/콤보</a></dd>
				</dl>
			</div>
			<div class="cols col3">
				<dl>
					<dt><a href="#" title="멤버십">멤버십</a></dt>
					<dd><a href="#" title="멤버십 안내">멤버십 안내</a></dd>
					<dd><a href="#" title="VIP ZONE">VIP ZONE</a></dd>
					<dd><a href="#" title="스페셜 멤버십">스페셜 멤버십</a></dd>
				</dl>
				<dl>
					<dt><a href="#" title="나의 씨네어스">나의 씨네어스</a></dt>
					<dd><a href="#" title="멤버십 정보">멤버십 정보</a></dd>
					<dd><a href="#" title="예매 확인/취소">예매 확인/취소</a></dd>
					<dd><a href="#" title="스토어 구매내역">스토어 구매내역</a></dd>
					<dd><a href="#" title="나의 무비스토리">나의 무비스토리</a></dd>
					<dd><a href="#" title="관람권/VIP쿠폰">관람권/VIP쿠폰</a></dd>
					<dd><a href="#" title="회원정보 수정">회원정보 수정</a></dd>
					<dd><a href="#" title="나의 문의 내역">나의 문의 내역</a></dd>
				</dl>
			</div>
			<div class="cols col4">
				<dl>
					<dt><a href="#" title="고객센터">고객센터</a></dt>
					<dd><a href="#" title="자주 묻는 질문">자주 묻는 질문</a></dd>
					<dd><a href="#" title="공지사항">공지사항</a></dd>
					<dd><a href="#" title="1:1문의">1:1문의</a></dd>
					<dd><a href="#" title="단체관람/대관문의">단체관람/대관문의</a></dd>
					<dd><a href="#" title="씨네어스 온라인 소개">씨네어스 온라인 소개</a></dd>
				</dl>
				<dl>
					<dt><a href="#" title="회원서비스">회원서비스</a></dt>
					<dd><a href="#" title="회원가입">회원가입</a></dd>
					<dd><a href="#" title="아이디/비밀번호 찾기">아이디/비밀번호 찾기</a></dd>
					<dd><a href="#" title="휴면계정 복구신청">휴면계정 복구신청</a></dd>
					<dd><a href="#" title="이용약관">이용약관</a></dd>
					<dd><a href="#" title="개인정보 처리방침">개인정보 처리방침</a></dd>
					<dd><a href="#" title="회원 탈퇴">회원 탈퇴</a></dd>
				</dl>
			</div>
			<div class="cols col5 last">
				<dl>
					<dt><a href="#" title="회사소개">회사소개</a></dt>
					<dd><a href="#" title="씨네어스 소개">씨네어스 소개</a></dd>
					<dd><a href="#" title="제휴/광고/부대사업문의">제휴/광고/부대사업문의</a></dd>
					<dd><a href="#" title="오시는 길">오시는 길</a></dd>
				</dl>
			</div>
		</div> <!-- .menu_all 끝 -->
	</div><!-- .modal 끝 -->
	<!-- 모달 내용 끝 -->
	
	
	
	
	
	
	
		
		
		
		
	
	
  		
	<div class="site-wrap">
		
		<nav class="navbar navbar-default navbar-fixed-top" id="nav_main">
			<div class="container">
					<div class="navbar-header">
						<a href="${context}/index.home" class="site-logo"> 
							<img src="${context}/images/logo_s.png" alt="씨네어스 로고">
						</a>
					</div>
			     	<div id="navbar">
			     			
						<ul class="nav list-inline">
							<li class="list-inline-item"><a href="${context}/movie/getMoviesList.do">영화</a></li>
							
							<li class="list-inline-item"><a href="${context}/schedule/getSchedule_movie.do">예매</a></li>
							
							<li class="list-inline-item"><a href="${context}/theater/getTheatersList.do">영화관</a></li>
							
							<li class="list-inline-item"><a href="${context}/stores/storeList.do">스토어</a></li>
							
			<%
				String id = (String)session.getAttribute("id");
			
				if(id == null){//세션값이 저장되어 있지 않은 경우 로그아웃된 상태
			%>
							<li><a href="${context}/members/login.me">로그인</a></li>
			<%		
				}else{//세션값이 저장되어 있는 경우(로그인 된 상태)
			%>
							<li style="width: 121px;"><a href="${context}/members/fa_1.me">${id}님</a></li>
							<li><a href="${context}/members/logout.me">로그아웃</a></li>
			<%		
				}
			%>
						</ul>
			
					</div> <!--  #navbar-->
			</div> <!--  .container -->
		</nav>
	
	
	
		<!-- *************************************************** -->
		
		<div id="menu2" class="header-btn-wrap"> 
			<button type="button" class="btn_menu_all" ><a href="#ex1" rel="modal:open"><i class="fa fa-bars"></i> 전체메뉴</a></button>
			<div class="btn_social">
				<a class="film_society" href="#"  title="필름 소사이어티 바로가기">필름 소사이어티</a>
				<i class="split"></i>
				<a class="classic_society" href="#"  title="클래식 소사이어티 바로가기">클래식 소사이어티</a>
			</div>
			<div class="btn_theater">
				<span class="membership_link">
					<a class="membership_txt" href="${context}/customerboard/customcenter.do" title="고객센터 바로가기">고객센터</a>
					<i class="split"></i>
					<a class="membership_txt" href="#"  title="멤버십 바로가기">멤버십</a>
					<i class="split"></i>
					<a class="membership_txt" href="#"  title="VIP 바로가기">VIP</a>
				</span>
				<!-- 배경이 투명한 경우 상영시간표 버튼에 class=transparent -->
				<button type="button" class="img_btn header btn_time transparent " >상영시간표</button>
			</div>
		</div>
		<!-- //.menu2-->
		
		
		
		<div class="tmain_container">
		
<script>
 $("#menu2 *").css("color","#111").css("borderColor","#111");
 $("#menu2 .btn_menu_all").css("backgroundColor","#fff").css("borderColor","#111");
</script>
		
