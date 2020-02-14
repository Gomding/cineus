<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
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
	
	<!-- 갤러리 -->
	<link rel="stylesheet" type="text/css" href="${context}/css/reservation_p1.css">
	<style>

 #page-title{
 font-size: 1.7em;
 color : black;
 text-align: center;
 }
 .container-fluid {
   max-width:1100px;
}
 .container-fluid .row{
 	margin-right:0px;
 	margin-left:0px;
 }
	</style>
  
	<!-- 헤더가 들어가는 곳 -->
	<jsp:include page="/inc/header.jsp"/>
	<!-- 헤더가 들어가는 곳 -->
    <!-- </head>
		 <body> -->
	
 <br><br>
 

 <div class="container-fluid pl-0 pr-0" >
	<div class="row" id="page-title">
		<div class="col-12 text-center">
			<h4 class="mb-0"><img src="${context}/images/event_seat-24px.svg" style="width:40px;height:40px;margin-bottom:10px">&nbsp;&nbsp;인원/좌석 선택</h4>
		</div>
	</div>
	<div class="row">
		 <div class="col-12 text-right mb-0 pb-0 pr-0"><small class="text-muted" style="font-weight:bold;">* 인원 선택은 최대 8명까지 가능합니다.</small>
		 </div>
	</div>

 
 
 	<div class="row" style="border-top: 1px solid gray;border-bottom: 1px solid gray;border-left: 1px solid gray;">
	 	<!-- 예매하기 시작-->
	 	<div class="col-xs-12 col-md-9 pb-5 pl-1 pr-1" id="seat-map">
			<div class="front">SCREEN</div>					
		</div>
		<div class="col-xs-6 col-md-3 pb-0 pr-0 pl-0 ml-0 booking-details">
			<div class="container pl-0 pr-0">
				<div class="row">
					<div class="col-6  pl-0 pr-0">
						<img src="${context}/images/movie/${s.movie_ID}.jpg">
					</div>
					<div class="col-6">
						<div id="span_title" class="text-truncate">${s.title}</div>
						<div id="span_place">
							<span>${s.theater_name}</span><br>
				  			<span>${s.screen_ID}</span>관
			  			</div>
			  			<div id="span_time">
							<span id="span_schedule_date"><fmt:formatDate value="${s.schedule_date}"/></span><br>
				   			<span id="span_start_at">${s.start_at}</span> - <span id="span_end_at">${s.end_at_accurate}</span> 
				   			<script>
						   		var day=new Date($("#span_schedule_date").text()).getDay();
						   		var day_str;
						   		if(day==0) day_str="일";
						   		else if(day==1) day_str="월";
						   		else if(day==2) day_str="화";
						   		else if(day==3) day_str="수";
						   		else if(day==4) day_str="목";
						   		else if(day==5) day_str="금";
						   		else if(day==6) day_str="토";
						   		$("#span_schedule_date").text($("#span_schedule_date").text()+" ("+day_str+") ");
						   		$("#span_start_at").text($("#span_start_at").text().substring(0,5));
						   		$("#span_end_at").text($("#span_end_at").text().substring(0,2)+":"+$("#span_end_at").text().substring(2,5));
						   </script>
					    </div>
					</div>
				</div><!-- .row -->
				<div class="row pl-2 pr-2">
					<div id="legend"></div>		
					<div class="mt-auto pb-3">
						<button id="btn_reset" type="button" class="btn btn-dark btn-sm"><img src="${context}/images/twotone_refresh_white_18dp.png"><br><small>다시선택</small>
						</button>
					</div>
				</div>
				<div class="row pl-2 pr-2 pt-2">
					일반 <span id="counter">0</span> 명
					<script>
						showOrhideCount();
						function showOrhideCount(){  //선택인원 0명일때는 표시하지 않도록 +그리고 다음버튼 활성화/비활성화
							 if(parseInt($("#counter").text())==0){
								$("#counter").parent().css("visibility","hidden");
								$("#btnNext").attr("disabled",true);
							}
							else{
								$("#counter").parent().css("visibility","visible");
								$("#btnNext").attr("disabled",false);
							}
						}
					</script>
				</div><!-- .row -->
				<div class="row pl-2 pr-2 ">
					<ul id="selected-seats"></ul>
				</div><!-- .row -->
				<div class="row mb-2 mt-2 pl-2 pr-2 ">
					<div class="col-12 text-right">
						<span id="total">0</span>&nbsp;원
					</div>
				</div>
				<div class="row pl-2 pr-2 mb-2">
					<div class="col-6 ml-0 pl-0 pr-1 ">
						<button class="btn btn-light col-sm btn-block" id="btnGoBack">이전</button>	
						<script>
							$("#btnGoBack").on("click",function(){
								window.history.back();
							});
						</script>
					</div>
					<div class="col-6 mr-0 pr-0 pl-1">
						<button class="btn btn-primary2 col-sm btn-block" id="btnNext" disabled>다음</button>
						<script>
							$("#btnNext").on("click",function(){
								var len=$("#selected-seats").children().length;
								for(var i=1; i<=len;i++){
									var seat=$("#selected-seats").children().eq(i-1).text();
									// ㄴ The index numbers start at 0, so the first element will have the index number 0 (not 1).
									$("#f_book_info").append("<input type='hidden' name='i_seat_"+i+"' value='"+seat+"'>");
								}
								$("#f_book_info").submit();
							});
						</script>
					</div>
				</div>
			</div><!-- .container -->
		</div> <!-- booking-details -->
		<!-- <div style="clear:both"></div> -->
		<!-- 예매하기 끝 -->
	</div> <!-- .row -->
	
	
	
	<form name="f_book_info" id="f_book_info" method="POST" action="${context}/reservation/getPayPage.do">
		<input type="hidden" name="i_schedule_id" value="${s.schedule_ID}">
		
		<input type="hidden" id="i_movie_id" name="i_movie_id" value="${s.movie_ID}">
		<input type="hidden" id="i_title" name="i_title" value="${s.title}">
		<input type="hidden" id="i_theater_name" name="i_theater_name" value="${s.theater_name}">
		<input type="hidden" id="i_screen_id" name="i_screen_id" value="${s.screen_ID}">
		<input type="hidden" name="i_schedule_date" value="${s.schedule_date}">
		<input type="hidden" name="i_start_at" value="${s.start_at}">
		<input type="hidden" name="i_end_at_accurate" value="${s.end_at_accurate}">
	
		<input type="hidden" id="i_theater_id" name="i_theater_id" value="${s.theater_ID}">
		<input type="hidden" id="lockSeats" name = "lockSeats" value = "${lockSeats}">
	
	</form>
	
	
 
</div> <!-- container-fluid 끝 -->
<br><br><br>
 
	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->
	
	
	<script type="text/javascript">
	
		if (self.name != 'reload') {
	        self.name = 'reload';
	        self.location.reload(true);
	    }
	    else self.name = ''; 
	
	</script>
	
	<!--  좌석 관련 -->
	<script type="text/javascript" src="${context}/js/jquery.seat-charts.min.js"></script> 
	<script>
	
	
	
	////////////////////////////////////////////////////////////////
	/* var mymap=['aaaaaaaaaa',
		       'aaaaaaaaaa',
		       '__________',
		       'aaaaaaaa__']; */
	var mymap=[];
	
	var theater_ID=parseInt($("#i_theater_id").val());
	var screen_ID=parseInt($("#i_screen_id").val());
	$.ajax({
		  url:'${context}/theater/getMap.do',
		  async: false,
		  type:'post',
			data: {'theater_ID' : theater_ID, 'screen_ID' : screen_ID},
			dataType: "json",
			error:function(jqXHR, textStatus, errorThrown){
				alert(errorThrown);
			},
		 	 success: function(data){
                for(var i=0; i<data.length ; i++){
                	mymap.push(data[i].replace("[","'").replace("]","'"));
                	// ㄴ [aaaaaaaaaaaa] 이렇게 나오니까 잘라준다.
                }
                //alert(mymap);
		 	}
	});
	
	var lockSeats = $("#lockSeats").val();
	var price = 10000; //price
	var sold1 = lockSeats;
	var sold = sold1.split(',');
	////////////////////////////////////////////////////////////////


	
	$(document).ready(function() {
		var $cart = $('#selected-seats'), //Sitting Area
		$counter = $('#counter'), //Votes
		$total = $('#total'); //Total money
	
		var sc = $('#seat-map').seatCharts({
			//Please note: number of columns must be equal in each row.
			map: mymap,
			naming : {
				top : false,
				getLabel : function (character, row, column) {
					return column;
				}
			},
			legend : { //Definition legend
				node : $('#legend'),
				items : [
					
					[ 'a', 'available',   '선택가능' ],
					[ 'a', 'unavailable', '예매완료']
				]					
			},
			click: function () { //Click event
				if (this.status() == 'available') { //optional seat
					//do some stuff, i.e. add to the cart
					
					//200203 추가
					if($(".selected").length>=8){
						alert("인원 선택은 최대 8명까지 가능합니다.");
						return this.style();
					}
					//200203 추가 끝
					/* $('<li>R'+(this.settings.row+1)+' S'+this.settings.label+'</li>') */
					$('<li>'+(this.settings.row+1)+'_'+this.settings.label+'</li>')
						.attr('id', 'cart-item-'+this.settings.id)
						.data('seatId', this.settings.id)
						.appendTo($cart);
	
					$counter.text(sc.find('selected').length+1);
					$total.text(recalculateTotal(sc)+price);

					showOrhideCount();
					return 'selected';
				} else if (this.status() == 'selected') { //Checked
					//seat has been vacated
					
						//Update Number
						$counter.text(sc.find('selected').length-1);
						//update totalnum
						$total.text(recalculateTotal(sc)-price);
							
						//Delete reservation
						$('#cart-item-'+this.settings.id).remove();
						//optional
						
						showOrhideCount();
						return 'available';
				} else if (this.status() == 'unavailable') { //sold
					//seat has been already booked
					return 'unavailable';
				} else {
					return this.style();
				}
			}
		});
		//sold seat
		sc.get(sold).status('unavailable');
			
	});
	//sum total money
	function recalculateTotal(sc) {
		var total = 0;
		sc.find('selected').each(function () {
			total += price;
		});
				
		return total;
	}
	
	$("#btn_reset").on("click",function(){
		$(".selected").trigger("click");
	});
	
		
	</script>

	<!--  좌석 관련 끝 -->
	
	
</body>
</html>