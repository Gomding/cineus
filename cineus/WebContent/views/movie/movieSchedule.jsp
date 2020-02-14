<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="context" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>CINEUS</title>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
 

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<link rel="stylesheet" type="text/css" href="${context}/css/common.css">
	<!-- 달력용 -->
	<link rel="stylesheet" type="text/css" href="${context}/css/rescalendar.css">
	<style>

 #page-title{
 font-size: 1.7em;
 color : black;
 text-align: center;
 margin-bottom:1em;
 }
 .container-fluid {
   max-width:1100px;
}
a:link    {color:#000;}  /* unvisited link  */
a:visited {color:#000;}  /* visited link    */
a:hover   {color:#000;}  /* mouse over link */
a:active  {color:#000;}  /* selected link   */ 
#btn_today{

}
.btn-group{
margin-top:10px;
width:100%;}
.btn-group button{
	width:33%;
}
.dia{
margin-top: 10px;
margin-bottom: 10px;
}
#notice{
	padding-top: 15px;
	font-size:12px;
	font-color:gray;
	line-height:1.6em;
}
.schedule_link{
	width: 100%;
	height:100%;
	display: block;
}
.li_m_title a{ /* 클릭영역을 칸 전체로 - 하지만 완벽하진 않음. 일단 넘어가자.*/
	display:block;
    width:100%;
    height:100%;
}
/* .schedule_link:hover{
	background-color:#1f0da8;
	color:white;
	이상하게 영역이 안맞아서 jquery 에서 해결함
} */
#timetable{
	margin-top: 30px;
}

#timetable, #timetable td{
	border:0px;
	/* vertical-align: middle; */
	padding-top: 20px;
}
#timetable tr{
	/* border-bottom:1px gray solid; */
}
#timetable .schedule_td{
	padding: 0;
	margin:0;
}
#timetable td:nth-child(1){
	width:6%;
}
#timetable td:nth-child(2){
	width:24%;
}
#timetable td:nth-child(3){
	width:10%;
}
#timetable .schedule_div{
	width:25%;
	height:70px;
	line-height:70px;
	float:left;
	padding:0;
	margin:0;
	font-size:18px;
	text-align: center;
vertical-align: middle;
border:1px lightgray solid;
	
}

#btn_prev, #btn_today, #btn_next{
	border:0px;
}




#no_schedule{
	width:100%;
	height:500px;
	text-align: center;
	padding-top:100px;
	  animation-name: ani1;
  animation-duration: 0.6s;
}
/* Safari 4.0 - 8.0 */
@-webkit-keyframes ani1 {
   from {opacity: 0;margin-top: 4%;}
  to {opacity: 1;margin-top: 0%;}
}

/* Standard syntax */
@keyframes ani1 {
   from {opacity: 0;margin-top: 4%;}
  to {opacity: 1;margin-top: 0%;}
}

#container-fluid{
	max-width:1100px;
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

<script>
	/* 영화 시작시각과 종료시각 받아온게 형식이 조금 다르기 때문에 맞춰주기 */
	/* 시작시각 */
	function help1(start){
		return start.substring(0,5);
	}
		
	/* 종료시각 */
	function help2(end){
		return end.substring(0, 2)+":"+end.substring(2);
	}
</script>


<!-- 달력용 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>
        <script src="${context}/js/rescalendar.js"></script>
<!-- 달력용 -->
        
 <br><br>
 
 <div class="container-fluid pl-0 pr-0" id="container-fluid">
 	<div class="row" id="page-title">
 		<div class="col-12 text-center">
 		 	<h4 class="mb-0"><img src="${context}/images/schedule-24px.svg" style="width:40px;height:40px;margin-bottom:10px">&nbsp;&nbsp;영화별 상영시간표</h4>
 		</div>
 	</div>
 		 
 		 <form action="${context}/schedule/getSchedule_movie.do" id="form" method="post">
 		 	<input type="hidden" name="movie_ID" id="movie_ID" value="${movie_ID}"/>
 		 	<input type="hidden" name="date" id="date" value="${date}"/>
 		 	
			<table class="table table-bordered table-sm">
				<thead class="thead-dark">
					<tr>
						<th width="23%" id="th-title">
							<!-- 선택한 영화제목 -->
							<!-- 일단 선택한 영화의 제목 출력 -->
							<c:if test="${movie_ID ne null}">
								<%-- ${movie_ID} --%>
							</c:if>
							<c:if test="${movie_ID eq null}">
								영화선택
							</c:if>
						</th> 
						<th width="70%" id="th-date">
							<!-- 선택한 날짜 -->
							<c:if test="${date ne null}">
								${date}
							</c:if>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td rowspan="2" style="margin:0;padding:0"><!-- 영화목록(상영중 혹은 상영예정) -->
							<c:choose>
								<c:when test="${m_list.size() ne 0}">
									<ul class="list-group list-group-flush">
										<c:forEach var="m" items="${m_list}" varStatus="loop">
											<li class="list-group-item li_m_title small mt-0 mb-0 pt-2 pb-2 pl-1 border-0">
												<a href="#" id="${m.movie_ID}" class="a_movie_click">${m.title}</a>
											</li>
										</c:forEach>
									</ul>
								</c:when>	
								<c:otherwise>
									현재 상영중/상영예정 영화가 없습니다.
								</c:otherwise>					
							</c:choose>
							
						</td> 
						<td style="height:80px"> <!-- 날짜 선택 -->
							<div class="rescalendar" id="my_calendar_simple"></div>
							<div class="btn-group">
								<button type="button" id="btn_prev" class="btn btn-outline-dark btn-sm">&lt;</button>
								<button type="button" id="btn_today" class="btn btn-outline-dark btn-sm">오늘</button>
								<button type="button" id="btn_next" class="btn btn-outline-dark btn-sm">&gt;</button>
							</div>
						</td>
					</tr>
					<tr>
						<td> <!-- 영화스케쥴 출력하기-->
							<c:choose>
								<c:when test="${s_list.size() ne 0}">
									
									<table class="table small" id="timetable">
									<c:forEach var="s" items="${s_list}" varStatus="loop">
											
											<tr>
												<td>${s.location_name}</td>
											    <td>${s.theater_name}</td>
											    <td>${s.screen_ID}관</td>
											    <td class="schedule_td">
											    	<div class="schedule_div" start_at="${s.start_at}" end_at_accurate="${s.end_at_accurate}" data-toggle="tooltip" data-placement="bottom" title="${s.theater_name} ${s.screen_ID}관 ${s.start_at} 영화 예매하기"  s_id="${s.schedule_ID}">
												    	<script>document.write(help1('${s.start_at}'));</script>
												    </div>
											    </td>
											</tr>
									</c:forEach>
									</table>
									
									<p id="notice" style="margin-top: 40px;">
									* 지연입장에 의한 관람불편을 최소화하고자 본 영화는 약 10분 후 시작됩니다.<br>
									* 쾌적한 관람 환경을 위해 상영시간 이전에 입장 부탁드립니다.
									</p>
								</c:when>	
								<c:otherwise>
									<div id="no_schedule">
									상영스케쥴이 없습니다.
									</div>
								</c:otherwise>					
							</c:choose>
						</td>
					</tr>
				</tbody>
			</table>
		</form> <!-- form 끝 -->

	<script>
	/* 표를 보기 좋게 바꾼다. */
	function fn_arrange_timetable(){
		//1차
		var len=$("#timetable tr").length;
		if(len<2){ //2줄이 안되면
			return;
		}
		for(var i=1; i<len ; i++){
			var $row=$("#timetable tr").eq(i);
			var $row_prev=$row.prev(i-1);
			
			if($row_prev.children("td").eq(0).text()==$row.children("td").eq(0).text()
			  && $row_prev.children("td").eq(1).text()!=$row.children("td").eq(1).text()
			  && $row_prev.children("td").eq(2).text()!=$row.children("td").eq(2).text()){
				var cut=$row.children("td").eq(3).html();
				$row.remove();
				$row_prev.find(".schedule_td").append(cut);
			}
		}
		
		//2차
		var cur1=$("#timetable tr").eq(0).children("td").eq(0).text();
		var cur2=$("#timetable tr").eq(0).children("td").eq(1).text();
		var cur3=$("#timetable tr").eq(0).children("td").eq(2).text();
		
		for(var i=1; i<len ; i++){
			var $row=$("#timetable tr").eq(i);
			
			if(cur1!=$row.children("td").eq(0).text()){
				cur1=$row.children("td").eq(0).text();
				cur2=$row.children("td").eq(1).text();
				cur3=$row.children("td").eq(2).text();
				continue;
			}
			$row.children("td").eq(0).text("");
			
			if(cur2!=$row.children("td").eq(1).text()){
				cur2=$row.children("td").eq(1).text();
				cur3=$row.children("td").eq(2).text();
				continue;
			}
			$row.children("td").eq(1).text("");
			
			if(cur3!=$row.children("td").eq(2).text()){
				cur3=$row.children("td").eq(2).text();
				continue;
			}
			$row.children("td").eq(2).text("");
		}
	}
	fn_arrange_timetable();
	</script>


</div> <!-- .container-fluid 끝 -->
<br><br><br><br><br><br><br>

<!-- ------------------내용 끝------------------ -->



<script>
/* 처음에 */
 /*전에 선택된 영화가 있다면 체크표시한다.*/
 
if("${movie_ID}" !=null && "${movie_ID}" !=""){
	var selected_movie_id=parseInt("${movie_ID}");
	var el=$(".a_movie_click#"+selected_movie_id);
	el.append("<span class='float-right'><img src='${context}/images/check.svg' width='17' height='17'></span>");
	el.parent().css("background-color","#ececec");
	$("#th-title").text(el.text());
	
}




//각 스케쥴 div의 속성값을 다듬어? 준다.
$(".schedule_div").each(function(){
	var val1=help1($(this).attr("start_at"));
	var val2=help2($(this).attr("end_at_accurate"));
	$(this).text(val1);
	$(this).attr("start_at",val1);
	$(this).attr("end_at_accurate", val2);
});

/* 스케쥴칸에 마우스오버되면  */
$(".schedule_div").on("mouseenter",function(){
	$(this).css("background-color","ececec").css("cursor", "pointer");
	$(this).text($(this).attr("start_at")+" - "+$(this).attr("end_at_accurate"));
});
/* 스케쥴칸에 마우스아웃되면 */
$(".schedule_div").on("mouseleave",function(){
	$(this).css("background-color","white");
	$(this).text($(this).attr("start_at"));
});
/* 스케쥴칸 클릭  */
$(".schedule_div").on("click",function(){
	//페이지 이동
	location.href="${context}/schedule/getSchedule.do?s_id="+$(this).attr("s_id");
});



//////달력
$('#my_calendar_simple').rescalendar({
                    id: 'my_calendar_simple',
                    dataKeyField: 'name',
                    calSize: 14,
                    refDate:"${date}", /*달력 처음값 세팅하기*/
                    dataKeyValues: ['item1'] /* 이 플러그인은 데이터가 하나라도 있어야 에러가 안난다
                    						 그래서 지울 수가 없음 */
                });
$("#btn_today").on("click",function(){
	
	$("button.move_to_today").trigger("click");
	//$('#form').submit();
});
$("#btn_prev").on("click",function(){
	
	$("button.move_to_yesterday").trigger("click");
	//$('#form').submit();
});
$("#btn_next").on("click",function(){
	
	$("button.move_to_tomorrow").trigger("click");
	//$('#form').submit();
});



/* 영화 목록에서 클릭 */
$(".a_movie_click").on("click",function(){
	$("#movie_ID").val($(this).prop("id"));
	$('#form').submit();
});
$(".li_m_title").on("mouseenter",function(){
	$(this).css("background-color","#ececec");
});
$(".li_m_title").on("mouseleave",function(){
	if($(this).find("a").attr("id")==$("#movie_ID").val()){ //현재 선택상태라면 그대로 둔다.ㄴ
		return;
	}
	else{
		$(this).css("background-color","white");
	}
});

</script>


 
	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->
</body>
</html>