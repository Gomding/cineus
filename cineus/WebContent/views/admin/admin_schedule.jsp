<%@page import="java.time.temporal.WeekFields"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="context" value="${pageContext.request.contextPath}" />

<html lang="ko">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${context}/css/common.css">
<link rel="stylesheet" type="text/css" href="${context}/css/admin.css">


<head>
<meta charset="UTF-8" />
<title>CINEUS</title>
<style>
.main table {
	font-size: 16px;
}

form{
	width:100%;
}
form select option, form select{
	font-size: 16px;
	height:95%;
}
form select{
	display:none; /* 이거 없고 아래 jquery에서만 제어했을 때는 리로드 될 때마다
				  나열해둔 입력창에 0.1초 정도 보였다가 사라져서 허술해보였음. */
}
form div.col-md-2{
padding-right: 0px;
	padding-left:0px;
	height:30px;
}
form div.col-md-6{
	padding-left:15px;
	padding-right:3px;
	height:30px;
}

.th{
	/* color:white;
	background-color: #343a40; */
}
.cell{
	height:41px;
}
#table th:not(:first-child){
	border-top: 2px solid black;	
	border-bottom: 2px solid black;	
}
#th-time{
	margin:0px;
	padding:0px;
	width:50px;
	border-top:0px;
	border-left:0px;
	border-bottom:0px;
	padding-top:45px;
	font-weight:500;
}

#ul-time{
margin:0px;
	padding:0px;
	width:100%;
	list-style: none;
}
#ul-time li{
	margin: 0 0 19px 0;
}
form select, form option{
	width:100%;
}
/* 테이블과 캔버스를 겹치게 하기 위함 */
#timetable{
	position: relative;
}
#timetable th{
	font-weight:500;
}
#table, #canvas{
	position: absolute;
}
#canvas {
  z-index: 10;
  width:100%;
  height:900px; /* 임의로 충분히 큰 값을 넣어준다.*/
   -webkit-animation-name: ani1; /* Safari 4.0 - 8.0 */
  -webkit-animation-duration: 0.6s; /* Safari 4.0 - 8.0 */
  animation-name: ani1;
  animation-duration: 0.6s;
}
/* Safari 4.0 - 8.0 */
@-webkit-keyframes ani1 {
   from {opacity: 0;}
  to {opacity: 1;}
}

/* Standard syntax */
@keyframes ani1 {
   from {opacity: 0;}
  to {opacity: 1;}
}
/* 테이블과 캔버스를 겹치게 하기 위함 */

/* 캔버스 안 텍스트에 적용함 */
.smallText
    {
        font-size:14px;
        font-family: Sans-Serif;
    }
    .largeText
    {
        font-size:16px;
        font-family: Sans-Serif;
}
/* 캔버스 안 텍스트에 적용함 끝 */

/*datepicker*/
#move_ctrl #text{
	padding-top:4px;
	font-size:16px;
	font-weight:600;
}
/*datepicker 끝*/

/* 상영일정이 없습니다. css와 애니메이션*/
#no-schedule{
	position: absolute;
	left: 50%;
	top: 50%; 
	background-color:white; 
	border:#aaa 1px solid;
	width:400px;
	height:150px;
	transform: translate(-90px, 50px);
	text-align: center;
  -webkit-animation-name: ani2; /* Safari 4.0 - 8.0 */
  -webkit-animation-duration: 0.6s; /* Safari 4.0 - 8.0 */
  animation-name: ani2;
  animation-duration: 0.6s;
}

/* Safari 4.0 - 8.0 */
@-webkit-keyframes ani2 {
   from {transform: translate(-90px, 60px);opacity: 0;}
  to {transform: translate(-90px, 50px);opacity: 1;}
}

/* Standard syntax */
@keyframes ani2 {
   from {transform: translate(-90px, 60px);opacity: 0;}
  to {transform: translate(-90px, 50px);opacity: 1;}
}
/* 상영일정이 없습니다. css와 애니메이션 끝*/

/*클릭하세요 애니메이션*/
#click_plz{
	background-color:white; 
	border:#aaa 1px solid;
	width:400px;
	height:150px;
	text-align: center;
	padding-top:60px;
  -webkit-animation-name: ani3; /* Safari 4.0 - 8.0 */
  -webkit-animation-duration: 0.6s; /* Safari 4.0 - 8.0 */
  animation-name: ani3;
  animation-duration: 0.6s;
}
@-webkit-keyframes ani3 {
   from {transform: translate(0px, 20px);opacity: 0;}
  to {transform: translate(0px, 0px);opacity: 1;}
}

/* Standard syntax */
@keyframes ani3 {
   from {transform: translate(0px, 20px);opacity: 0;}
  to {transform: translate(0px, 0px);opacity: 1;}
}
/*클릭하세요 애니메이션 끝*/

#no-schedule>div{
	display:inline-block;
	padding-top:50px;
}
</style>
</head>
<body>

<!-- 공통 -->
	<div class="container mt-4" style="font-size:16px;">
	<a href="${context}/index.home"><img src="${context}/images/logo_s.png"></a>
	 	<h5>관리자메뉴</h5>
	 	
	 	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		 	<div class="collapse navbar-collapse" id="navbarText">
			 	<ul class="navbar-nav mr-auto">
			 		<li class="nav-item "><a  class="nav-link"  href="${context}/views/admin/admin.jsp">문자발송</a></li>
			 		<li class="nav-item"><a class="nav-link" >회원관리</a></li>
			 		<li class="nav-item active"><a class="nav-link"  href="${context}/views/admin/admin_schedule.jsp">영화시간표</a></li>
			 		<li class="nav-item"><a class="nav-link" >영화스케쥴등록</a></li>
			 	</ul>
		 	</div>
	 	</nav>
	 <!-- 공통 -->
		<div class="main">
			<!-- 어드민 내용 시작 -->
			<!-- <h5>
				<strong>상영 시간표</strong>
			</h5> -->
			<br>
			<!-- 선택 -->
			<form action="${context}/schedule/getSchedule_screen.do"
				method="post" onsubmit="return checkSelect();">
				<div style="width:100%;margin:0;">
					<div class="row" style="height:30px">
						<div class="col-md-2">
						<select class="selectpicker s_location">
							<option value="0">--지역 선택--</option>
							<option value="1">서울</option>
							<option value="2" disabled>경기</option>
							<option value="3" disabled>인천</option>
							<option value="4" disabled>대전/충청/세종</option>
							<option value="5">부산/대구/경상</option>
							<option value="6" disabled>광주/전라</option>
							<option value="7" disabled>강원</option>
							<option value="8" disabled>제주</option>
						</select>
						</div> <!-- .col-sm -->
						<div class="col-md-2">
				<select class="selectpicker s_theater">
					<option value="0">--극장 선택--</option>
					<option value="1">강남</option>
					<option value="2" disabled>강남대로(씨티)</option>
					<option value="3" disabled>강동</option>
					<option value="4" disabled>군자</option>
					<option value="5" disabled>동대문</option>
					<option value="6" disabled>마곡</option>
					<option value="7" disabled>목동</option>
					<option value="8" disabled>상봉</option>
					<option value="9" disabled>상암월드컵경기장</option>
					<option value="10" disabled>센트럴</option>
					<option value="11" disabled>송파파크하비오</option>
					<option value="12" disabled>신촌</option>
					<option value="13" disabled>은평</option>
					<option value="14" disabled>이수</option>
					<option value="15" disabled>창동</option>
					<option value="16" disabled>코엑스</option>
					<option value="17" disabled>화곡</option>
					<option value="18" disabled>ARTNINE</option>
				</select> 
				<select class="selectpicker s_theater"></select> <select
					class="selectpicker s_theater"></select> <select
					class="selectpicker s_theater "></select> <select
					class="selectpicker s_theater ">
					<option value="0">--극장 선택--</option>
					<option value="1" disabled>거창</option>
					<option value="2" disabled>경산하양</option>
					<option value="3" disabled>경주</option>
					<option value="4" disabled>구미</option>
					<option value="5" disabled>김천</option>
					<option value="6" disabled>덕천</option>
					<option value="7" disabled>동대구</option>
					<option value="8" disabled>문경</option>
					<option value="9" disabled>부산극장</option>
					<option value="10">부산대</option>
					<option value="11" disabled>북대구(칠곡)</option>
					<option value="12" disabled>사천</option>
					<option value="13" disabled>양산</option>
					<option value="14" disabled>울산</option>
					<option value="15" disabled>창원</option>
					<option value="16">해운대(장산)</option>
				</select> <select class="selectpicker s_theater "></select> <select
					class="selectpicker s_theater "></select> <select
					class="selectpicker s_theater "></select> 
					</div> <!-- .col-sm -->
					<div class="col-md-2">
				<select class="selectpicker s_screen " id="s_screen1_1">
					<option value="0">--관 선택--</option>
					<option value="1">1관</option>
					<option value="2">2관</option>
				</select> <select class="selectpicker s_screen " id="s_screen5_10">
					<option value="0">--관 선택--</option>
					<option value="1">1관</option>
				</select> <select class="selectpicker s_screen "  id="s_screen5_16">
					<option value="0">--관 선택--</option>
					<option value="1">1관</option>
					<option value="2">2관</option>
					<option value="3">3관</option>
				</select>
				</div>
				<div class="col-md-4">
				<input type="submit"
					class="btn btn-outline-dark" style="font-size: 16px;; padding-top:3px;padding-bottom:3px;margin:0px;width:100%" 
					value="상영 시간표 보기">
					<input type="hidden" id="v_location" name="v_location" value="0"> 
					<input type="hidden" id="v_theater" name="v_theater" value="0"> 
					<input type="hidden" id="v_screen" name="v_screen" value="0">
				</div>
				<div class="col-md-2"></div>
				</div></div>
			</form>
			<br><br>
			<!-- ---------------------------------------------------------------------- -->
			
			
			
			<c:if test="${s_list eq null}">
				<br><br><br>
				<div class="row justify-content-center align-items-center ">
					<div id="click_plz"  >
					검색 조건을 선택한 후 <strong>[상영시간표보기]</strong>를 클릭하세요.
					</div>
				</div>
			</c:if>
			<c:if test="${s_list ne null}">
								
				            <div class="container" style="max-width: 100%;">
				            	<div class="row">
				            	<!-- 극장이름, 스크린아이디 표시 -->
									<div class="text-center col-md-12">
										<h5><strong><c:out value="${theater_info.name}"/> <c:out value="${screen_idx}"/>관</strong></h5>
									</div>
								</div>
								<div class="row">
					                <div class="text-center col-md-2" style="padding-right:0px;margin-right:0px;">
					                	<!-- 이동버튼과 input박스  표시 -->
					                   <div class="d-flex justify-content-between" id="move_ctrl" >
						                    <div class="mb-0 p-2 fa fa-chevron-left" id="prev" style="cursor: pointer;">
						                    </div>
						                    <div id="text"></div>
						                    <div class="mb-0 p-2 fa fa-chevron-right" id="next" style="cursor: pointer;">
						                    </div>
					                    </div>
					                 </div>
					                 <!-- '이번주 일정으로' 들어감 -->
					                 <div class="col-md-2">
					                    <a href="#" class="trigger_submit float-left"  data-toggle="tooltip" data-html="true" title="이번주 상영일정으로 돌아가기"><img src="${context}/images/undo-24px.svg" style="width:30px;height:30px;"></a>
					                 </div>
									<div class="col-md-8"></div>
				               </div>
				            </div>
				            <script>
				            	$(".trigger_submit").on("click",function(){
				            		$( "form" ).submit();
				            	});
				            </script>
				        <!-- 이동버튼 텍스트에 표시하기 -->
				        	<c:if test="${v_year eq null}" >
				        		<%
				        			Calendar now = Calendar.getInstance();
				        			int week_num=now.get(Calendar.WEEK_OF_YEAR);
				        			int year_num=now.get(Calendar.YEAR);
				        		%>
				        		<script>
				        			$("#move_ctrl #text").text("<%=week_num%>주 <%=year_num%>년");
				        		</script>
				        	</c:if>
				        	 
				        	 <c:if test="${v_year ne null}" > <!-- v_week조건은 생략(?)....-->
	 							<script>
								 	selectedWeek="${v_week}";
								 	selectedYear="${v_year}";
								 	$("#move_ctrl #text").text(selectedWeek+"주 "+selectedYear+"년");</script>
								 </c:if>
						<!-- 이동버튼 이벤트 연결 -->
						<script>
							$("#prev").on("click",function(){
									var date=$("#move_ctrl #text").text(); //2주 2020년 이런식으로 표시됨
									//alert(date);
									var token=date.split(" ");
									var week=token[0].substring(0,token[0].length-1);
										week=parseInt(week)-1;
									var year=token[1].substring(0,token[1].length-1);
									var val1=$("#v_location").val();
									var val2=$("#v_theater").val();
								 	var val3=$("#v_screen").val();
								 	if(val1=="" || val1==null || val1=="0" ||
										val2=="" || val2==null || val2=="0" ||
										val3=="" || val3==null || val3=="0"){
										 alert("옵션을 모두 선택하세요.");
									 return false;
									 }
									var str="v_location="+val1+"&v_theater="+val2+"&v_screen="+val3;
									    str+="&v_year="+year+"&v_week="+week;
									//alert(str);
									window.location.href = "${context}/schedule/getSchedule_screen.do?"+str;
									
							});
							//위와 완전히 동일한 함수이다. 위ㅣ에서는 week -1 하고 
							//여기서는 week+1한다는 것만 다름
							$("#next").on("click",function(){
								var date=$("#move_ctrl #text").text(); //2주 2020년 이런식으로 표시됨
								//alert(date);
								var token=date.split(" ");
								var week=token[0].substring(0,token[0].length-1);
									week=parseInt(week)+1;
								var year=token[1].substring(0,token[1].length-1);
								var val1=$("#v_location").val();
								var val2=$("#v_theater").val();
							 	var val3=$("#v_screen").val();
							 	if(val1=="" || val1==null || val1=="0" ||
									val2=="" || val2==null || val2=="0" ||
									val3=="" || val3==null || val3=="0"){
									 alert("옵션을 모두 선택하세요.");
								 return false;
								 }
								var str="v_location="+val1+"&v_theater="+val2+"&v_screen="+val3;
								    str+="&v_year="+year+"&v_week="+week;
								//alert(str);
								window.location.href = "${context}/schedule/getSchedule_screen.do?"+str;
							});
						</script>
						
						


			<!-- 시간표 테이블 표시 -->
			<div id="timetable" >
			
				<TABLE class="table table-sm" id="table">
					<tr>
						<th id="th-time" rowspan="20">
							<ul id="ul-time">
								<c:forEach begin="8" end="26" step="1" var="time">
									<li>
										<c:choose>
										<c:when test="${time < 10}">
										<c:out value="0${time}" />:00
										</c:when>
										<c:otherwise>
										<c:out value="${time}" />:00
										</c:otherwise>
										</c:choose>
									</li>
								</c:forEach>
							</ul>
						</th>
						<%
							int t1=(Integer)request.getAttribute("v_year");
							int t2=(Integer)request.getAttribute("v_week");
							WeekFields weekFields = WeekFields.ISO;
							LocalDate ld = LocalDate.now ( )
							        .withYear ( t1 )
							        .with ( weekFields.weekOfYear ( ), t2 )
							        .with ( weekFields.dayOfWeek ( ), 1 );
							
							int day=ld.getDayOfWeek().getValue(); //현재 날짜의 요일값을 구함
																		 //일요일 0, 월요일 1,...
							LocalDate startDate = ld.minusDays(day); //현재 일요일이면 시작일도 일요일의 날짜
																			//현재 월요일이면 시작일은 오늘-1 해서 앞선 일요일 날짜
							String day1=DateTimeFormatter.ofPattern("yyy/MM/dd").format(startDate);
							String day2=DateTimeFormatter.ofPattern("yyy/MM/dd").format(startDate.plusDays(1));
							String day3=DateTimeFormatter.ofPattern("yyy/MM/dd").format(startDate.plusDays(2));
							String day4=DateTimeFormatter.ofPattern("yyy/MM/dd").format(startDate.plusDays(3));
							String day5=DateTimeFormatter.ofPattern("yyy/MM/dd").format(startDate.plusDays(4));
							String day6=DateTimeFormatter.ofPattern("yyy/MM/dd").format(startDate.plusDays(5));
							String day7=DateTimeFormatter.ofPattern("yyy/MM/dd").format(startDate.plusDays(6));
							/* System.out.println(day1+" "+day2+" "+day3+" "+day4+" "+day5+" "+day6+" "+day7); */
						
						%>
						<TH class="th" style="text-align: center"><%=day1%><br>일
						</TH>
						<TH class="th"  style="text-align: center"><%=day2%><br>월
						</TH>
						<TH class="th"  style="text-align: center"><%=day3%><br>화
						</TH>
						<TH class="th"  style="text-align: center"><%=day4%><br>수
						</TH>
						<TH class="th"  style="text-align: center"><%=day5%><br>목
						</TH>
						<TH class="th"  style="text-align: center"><%=day6%><br>금
						</TH>
						<TH class="th"  style="text-align: center"><%=day7%><br>토
						</TH>
					</TR>
					<c:forEach begin="8" end="26" step="1" var="time">
							<TR>
								<c:forEach begin="0" end="6" step="1" var="day">
									<TD class="cell"></TD>
								</c:forEach>
							</TR>
					</c:forEach>
				</TABLE>
				
				<div id="canvas">
    			</div>
    			
			</div>
			<!-- 타임테이블 --> <!-- 시간표 테이블 표시 끝 -->
			
			
			</c:if> <!-- 받아온 스케쥴이 null이 아닌 경우 이동버튼과 테이블을 표시했다.. -->
			
		</div>
		<!-- main 끝 -->
	</div>
	<!-- container-fluid 끝 -->
	
	
	
	<!-- --------------------------------------------------- -->
	<!-- 검색으로 받아온 스케쥴을 테이블에 표시하는 부분 -->
	<c:choose>
		<c:when test="${s_list.size() eq 0}">
			<br><br><br><br>
			<div id="no-schedule">
				<div>
					<img src="${context}/images/exclamation.svg" style="width:40px;height:40px;">&nbsp;&nbsp;&nbsp;상영일정이 없습니다.
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<script type="text/javascript" src="${context}/js/jqxcore.js"></script>
		    <script type="text/javascript" src="${context}/js/jqxdraw.js"></script>
			
			<script type="text/javascript">
				var x;
				var w;
				var y;
				var h;
				//충분히 많은 컬러를 저장해둔다.
				var colors = ['#c594c5','#e78b6c','#5fb3b3','#69c','#f5d76a',"#8a96db","#ba8ddc","#e881cb","#ff77a9","#ff797d","#ff8b4c","#ffa600"];
				let movies=[];
				var renderer;
				
				//그림을 그리기 위해 초기화
				function draw_init(){
					$('#canvas').jqxDraw('clear');
					
		    		$('#canvas').jqxDraw();
		   			renderer = $('#canvas').jqxDraw('getInstance');
		   			
		   			x=$(".cell").first().position().left;
			   		w=$(".cell").first().outerWidth();
			   		y=$(".cell").first().position().top;
			   		h=$(".cell").first().outerHeight();
			   		
			   	}
				
				//네모 한 조각을 그린다.
				function draw_rect(day, start_at, end_at, movie_ID, title){ 
					/* alert("값을 받았다 "+day+", "+start_at+", "+end_at+", "+movie_ID); */
					//요일, 시작시각, 종료시각, 영화아이디
					var t; //임시저장소
					if(day=="일"){
						t=0;
					}
					else if(day=="월"){
						t=1;
					}
					else if(day=="화"){
						t=2;
					}
					else if(day=="수"){
						t=3;
					}
					else if(day=="목"){
						t=4;
					}
					else if(day=="금"){
						t=5;
					}
					else if(day=="토"){
						t=6;
					}
					var curr_x=x+t*w;
					
					//새벽인 경우(시 가 24를 넘어가면 1,2.. 로 넘어온다) 처리하기
					if(parseInt(start_at)<800){ //아침 8시 되기 전이면 새벽으로 간주
						start_at=(parseInt(start_at)+2400).toString();
					}
					if(parseInt(end_at)<800){ //아침 8시 되기 전이면 새벽으로 간주
						end_at=(parseInt(end_at)+2400).toString();
					}
					
					t=parseInt(start_at)-800; //테이블이 시작하는 기준시각인 8시를 빼줌
					t=parseInt(t/100)+(t%100)/60; //칸 단위로 바꾼다. 
												  //1시간이면 1칸, 1시간 30분이면 1.5칸
					var curr_y=parseInt(y+h*t);
					
					var curr_w=w; //너비는 고정
					
					t=end_at-start_at;
					t=parseInt(t/100)+(t%100)/60;
					var curr_h=parseInt(h*t);
					
					//색 지정
					
					if(movies.includes(movie_ID)){
					}
					else{
						movies.push(movie_ID);
					}
					var curr_color=colors[movies.indexOf(movie_ID)];
					//색 지정 끝
					
					// params: x, y, width, height, attributes
			   		var rectElement = renderer.rect(curr_x, curr_y, curr_w, curr_h, { stroke: '#ffffff', fill: curr_color});
			   		renderer.text(title,curr_x+5,curr_y+20,undefined, undefined, 0, { 'class': 'largeText', fill: 'white', stroke: 'transparent' }, false, 'center', 'center', 'centermiddle');
			   		renderer.text(start_at.substring(0,2)+":"+start_at.substring(2,4)+" - "+end_at.substring(0,2)+":"+end_at.substring(2,4),curr_x+5,curr_y+40,undefined, undefined, 0, { 'class': 'smallText', fill: 'white', stroke: 'transparent' }, false, 'center', 'center', 'centermiddle');
				}
				
				$(window).resize(function() {
					//draw_init();
					//alert("리사이즈");
				});
				
				draw_init();
			</script>
		
			<c:forEach var="s" items="${s_list}" varStatus="loop">
				<fmt:formatDate type="date" value="${s.schedule_date}" pattern="E" var="day"/>
				<c:set var="title" value="${movie_info_map.get(s.movie_ID).title}" />
				<script>
						draw_rect("${day}", "${s.start_at}", "${s.end_at}", "${s.movie_ID}", "${title}");
				</script>
			</c:forEach>
			
			<!-- --------------------------------------------------- -->
		</c:otherwise>
	</c:choose>					


	<script>
	/* submit 버튼을 눌렀을 때, 서블릿을 넘어가기 전 
	검색을 위한 옵션을 모두 입력했는지 체크하는 메서드  */
	 function checkSelect(){
		 val1=$("#v_location").val();
		 val2=$("#v_theater").val();
		 val3=$("#v_screen").val();
		 if(val1=="" || val1==null || val1=="0" ||
			val2=="" || val2==null || val2=="0" ||
			val3=="" || val3==null || val3=="0"){
			 alert("옵션을 모두 선택하세요.");
			 return false;
		 }
		 else{
			 return true;
		 }
	 }
	 </script>


	
	<script>
		/* 검색을 위한 input 요소 관련 메서드 */
	 	InitSelectOption();
	 	function InitSelectOption(option){
	 		if(option==1 || option==null){ //전부 초기화 (theater, screen 은 disabled)
	 			$("select").val("0");
		 		$("select").hide();
		 		$(".s_location").show();
		 		$(".s_theater").eq(0).show().prop('disabled', true);
		 		$(".s_screen").eq(0).show().prop('disabled', true);
		 		$("#v_location").val(0);$("#v_theater").val(0);$("#v_screen").val(0);
	 		}
	 		else if(option==2){ //theater와 screen만 초기화 (screen은 disabled)
	 			$(".s_screen").hide();
	 			$(".s_screen").val(0);
	 			$(".s_screen").eq(0).show().prop('disabled', true);
	 			$("#v_theater").val(0);$("#v_screen").val(0);
	 		}
	 	}
	 	
	 	$(".s_location").on("change", function(){
	 		var val=$(this).find("option:selected").val();
	 		$("#v_location").val(parseInt(val));
	 		if (val=="0"){
	 			InitSelectOption(1);
	 			return;
	 		}
	 		else{
	 			$(".s_theater").val(0);
	 			$(".s_theater").hide();
	 			$(".s_theater").eq(parseInt(val)-1).show().prop('disabled',false);
	 			$(".s_screen").val(0);
	 			$("#v_theater").val(0);$("#v_screen").val(0);
	 		}
	 	});
	 	
	 	$(".s_theater").on("change", function(){
	 		var val=$(this).find("option:selected").val();
	 		$("#v_theater").val(parseInt(val));
	 		if (val=="0"){
	 			InitSelectOption(2);
	 			return;
	 		}
	 		else{
	 			$("#v_theater").val(parseInt(val));
	 			var screen_id="#s_screen"+$("#v_location").val()+"_"+$("#v_theater").val();
	 			$(".s_screen").val(0);
	 			$(".s_screen").hide();
	 			$(screen_id).show().prop('disabled',false);
	 			$("#v_screen").val(0);
	 		}
	 	})
	 	
	 	$(".s_screen").on("change", function(){
	 		var val=$(this).find("option:selected").val();
	 		$("#v_screen").val(parseInt(val));
	 		if (val=="0"){
	 			return;
	 		}
	 		else{
	 		}
	 	})
	 </script>
	 
	 
	 <!-- 만약 controller에서 넘겨받은 값이 있다면 그 값으로 
	 select-option값을
	 세팅해준다. -->
	 
	 <c:if test="${location_idx ne null}">
	 	<script>
	 	$('.s_location').val("${location_idx}").trigger('change');
	 	</script>
	 </c:if>
	 <c:if test="${theater_idx ne null}">
	 	<script>
	 	$('.s_theater:visible').val("${theater_idx}").trigger('change');
	 	</script>
	 </c:if>
	 <c:if test="${screen_idx ne null}">
	 	<script>
	 	$('.s_screen:visible').val("${screen_idx}").trigger('change');
	 	</script>
	 </c:if>

	 
	 
</body>
</html>
