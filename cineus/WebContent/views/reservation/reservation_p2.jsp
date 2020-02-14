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
	
	<link rel="stylesheet" type="text/css" href="${context}/css/reservation_p2.css">
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
 
 
 
 
 <!-- 타이머 -->
 <script> 
        //set minutes 
        var mins = 1; 
  
        //calculate the seconds 
        var secs = mins * 60; 
  
        //countdown function is evoked when page is loaded 
        function countdown() { 
            setTimeout('Decrement()', 60); 
        } 
  
        //Decrement function decrement the value. 
        function Decrement() { 
            if (document.getElementById) { 
                minutes = document.getElementById("minutes"); 
                seconds = document.getElementById("seconds"); 
  
                //if less than a minute remaining 
                //Display only seconds value. 
                if (seconds < 59) { 
                    seconds.value = secs; 
                } 
  
                //Display both minutes and seconds 
                //getminutes and getseconds is used to 
                //get minutes and seconds 
                else { 
                    minutes.value = getminutes(); 
                    seconds.value = getseconds(); 
                } 
                //when less than a minute remaining 
                //colour of the minutes and seconds 
                //changes to red 
                if (mins < 1) { 
                    minutes.style.color = "red"; 
                    seconds.style.color = "red"; 
                } 
                //if seconds becomes zero, 
                //then page alert time up 
                if (mins < 0) { 
                    alert('시간초과 - 처음부터 다시 진행하세요.');
                    minutes.value = 0; 
                    seconds.value = 0;
                    location.href="${context}/schedule/getSchedule_movie.do?movie_ID=${movie_ID}";
                   
                } 
                //if seconds > 0 then seconds is decremented 
                else { 
                    secs--; 
                    setTimeout('Decrement()', 1000); 
                } 
            } 
        } 
  
        function getminutes() { 
            //minutes is seconds divided by 60, rounded down 
            mins = Math.floor(secs / 60); 
            return mins; 
        } 
  
        function getseconds() { 
            //take minutes remaining (as seconds) away  
            //from total seconds remaining 
            return secs - Math.round(mins * 60); 
        } 
        
        countdown();
        
</script>
 <!-- 타이머 끝-->
<!--  <body onload="countdown();">  -->
 
 

 <div class="container-fluid pl-0 pr-0" >
	<div class="row" id="page-title">
		<div class="col-12 text-center">
			<h4 class="mb-0"><img src="${context}/images/credit_card-24px.svg" style="width:40px;height:40px;margin-bottom:10px">&nbsp;&nbsp;빠른예매</h4>
		</div>
	</div>
 	<div class="row">
		 <div class="col-12 text-right mb-0 pb-0 pr-0">
		 	<small class="text-muted" style="font-weight:bold;">
			 	* <script>document.write(mins);</script>분안에 예매를 완료해야 합니다. 
		        남은 시간 
		        <input id="minutes" type="text" style="width: 10px; 
		             border: none; font-size: 16px;  
		            font-weight: bold; color: black;"> 분  
		        <input id="seconds" type="text" style="width: 20px; 
		                        border: none; font-size: 16px; 
		                        font-weight: bold; color: black;"> 초
		    </small>
		</div> 
	</div>

 
 
 	<div class="row" style="border-top: 1px solid gray;border-bottom: 1px solid gray;border-left: 1px solid gray;">
	 	<!-- 예매하기 시작-->
	 	<div class="col-xs-12 col-md-9 pb-5 pl-1 pr-1" id="seat-map">	
	 		<div class="container left pl-2 pr-3" id="user_input">
	 			<div class="row title mt-3 mb-2">
	 				<div class="col col-6 ">1. 관람권 및 할인적용</div>
	 				<div class="col col-6 ">
	 					<button id="btn_reset" type="button" class="btn btn-light btn-sm pull-right">
	 						<img src="${context}/images/refresh-24px.svg"><small>다시선택</small>
						</button>
	 				</div>
	 			</div><!-- .row -->
	 			<div class="row mb-2 mt-1">
	 				<div class="col col-12">제휴 모바일 쿠폰</div>
	 			</div>
	 			<div class="row btns ml-2">
	 				<div class="col col-3">스토어 교환권</div>
	 				<div class="col col-3">기프티콘</div>
	 				<div class="col col-3">기프티쇼</div>
	 				<div class="col col-3">스마트콘</div>
	 				<div class="col col-3">아이넘버</div>
	 				<div class="col col-3">제휴예매권</div>
	 			</div>
	 			<div class="row title mt-5 mb-2">
	 				<div class="col col-12 ">2. 결제수단선택</div>
	 			</div>
	 			<div class="row pl-4">
	 				<div class="col col-12">
	 					<div class=".form-check-inline" id="i_payment_option" name="i_payment_option">
	  						<label class="form-check-label mr-4">
    							<input type="radio" class="form-check-input" name="optradio" value="신용/체크카드" onclick="choicePayment(this);">신용/체크카드
  							</label>
  							<label class="form-check-label mr-4">
    							<input type="radio" class="form-check-input" name="optradio"  value="휴대폰 결제" onclick="choicePayment(this);">휴대폰 결제
  							</label>
  							<label class="form-check-label mr-4">
    							<input type="radio" class="form-check-input" name="optradio" value="카카오 페이" onclick="choicePayment(this);">카카오 페이
  							</label>
  							<label class="form-check-label">
    							<input type="radio" class="form-check-input" name="optradio" value="페이코" onclick="choicePayment(this);">페이코
  							</label>
						</div>
	 				</div>
	 			</div>
	 			<div class="row mt-2">
	 				<div class="col col-2 hide" id="choicevalue">
	 					
	 				</div>
	 				<div class="col col-3">
		 				<select class="form-control input-sm" id="i_card_company" name="i_card_company" style = "display:none;">
						     
	   				 	</select>
	 				</div>
	 				<div class="col col-7">
	 				</div>
	 			</div>
	 		</div><!-- .container -->
	 	
	 	
		</div>
		
		<div class="col-xs-6 col-md-3 pb-0 pr-0 pl-0 ml-0 booking-details">
			<div class="container pl-0 pr-0">
				<div class="row">
					<div class="col-6  pl-0 pr-0">
						<img src="${context}/images/movie/${movie_ID}.jpg">
					</div>
					<div class="col-6">
						<div id="span_title" class="text-truncate">${title}</div>
						<div id="span_place">
							<span>${theater_name}</span><br>
				  			<span>${screen_ID}</span>관
			  			</div>
			  			<div id="span_time">
							<span id="span_schedule_date">${schedule_date}</span><br>
				   			<span id="span_start_at">${start_at}</span> - <span id="span_end_at">${end_at}</span> 
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
				
				<div class="row pl-2 pr-2 pt-2">
					일반 <span id="counter">${seats.size()}</span> 명
					
				</div><!-- .row -->
				<div class="row pl-2 pr-2 ">
					<!-- <ul id="selected-seats"></ul> -->
				</div><!-- .row -->
				<div class="row mb-2 mt-2 pl-2 pr-2 ">
					<div class="col-12 pr-0 text-right">
						<span id="total">${ticketPrice}</span>&nbsp;원
					</div>
				</div>
				<div class="row mb-2 mt-2 pl-2 pr-2 ">
					<div class="col-5 pl-0 text-left">
						결제수단
					</div>
					<div class="col-7 pr-0 text-right">
						<span id = "paymentName"></span>
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
						<button class="btn btn-primary2 col-sm btn-block" id="btnNext" disabled>결제</button>
						<script>
							$("#btnNext").on("click",function(){
								var popupX = (window.screen.width / 2) - (450 / 2);
								// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

								var popupY= (window.screen.height / 2) - (600 / 2);
								// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
								var option=$( "#i_payment_option :checked" ).val();
								var company=$("#i_card_company :selected").val();
								if(company == null) company = "";
								var child=window.open("${context}/reservation/checkPayment.do?title=${title}&theater_name=${theater_name}&ticketPrice=${ticketPrice}&ticket_id=${ticket_id}&option="+option+"&company="+company, "결제하기", "width=450, height=600, toolbar=no, menubar=no, scrollbars=no, resizable=yes, left="+ popupX+",top="+popupY);  
								$(':button').prop('disabled', true); // Disable all the buttons
								$(':input').prop('disabled', true);
								
								var timer = setInterval(checkChild, 500);

								function checkChild() {
								    if (child.closed) {
								    	$(':button').prop('disabled', false); // Disable all the buttons
										$(':input').prop('disabled', false);
								        clearInterval(timer);
								    }
								}
								//팝업에 쓰기
								/* popup.document.write("<p>This is 'myWindow'</p>"); */
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
		<!-- 너;어ㅣ;ㄴ어ㅣㄴㄹㅇ머 -->
	</form>
	
	
 
</div> <!-- container-fluid 끝 -->
<br><br><br>
 
	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->
	
	<script type="text/javascript">
	function choicePayment(payment) {
		var choicevalue = $("#choicevalue");
		
		paymentName = document.getElementById("paymentName");
		paymentName.innerHTML = payment.value;
		
		var card = ["카드사 선택", "비씨카드", "국민카드", "삼성카드", "신한카드", "롯데카드", "하나카드", 
					"현대카드", "씨티카드", "제주카드", "우리카드", "수협카드", "전북카드", "광주카드", "신협카드", "카카오뱅크", "케이뱅크"];
		
		var telcompany = ["통신사 선택", "SKT", "KT", "LGU+", "알뜰폰"];
		
		if(payment.value == "신용/체크카드") {
			choicevalue.text("카드사 선택");
			$('#i_card_company').show();
			$('#i_card_company').empty();
			for(var count = 0; count < card.length; count++){                
			                var option = $("<option>"+card[count]+"</option>");
			                $('#i_card_company').append(option);
			}
		}else if(payment.value == "휴대폰 결제") {
			choicevalue.text("통신사 선택");
			$('#i_card_company').show();
			$('#i_card_company').empty();
			for(var count = 0; count < telcompany.length; count++){                
                var option = $("<option>"+telcompany[count]+"</option>");
                $('#i_card_company').append(option);
			}
			
		}else {
			choicevalue.text("");
			
			$('#i_card_company').empty();
			$('#i_card_company').hide();
		}

	
	}
	
	</script>
	
	
	<script>
		function SetNextBtn(){ 
			var option=$( "#i_payment_option :checked" ).val();
			var card_company=$("#i_card_company :selected").val();
			if(option=="신용/체크카드"){
				
				if(card_company!="카드사 선택"){ /* 신용카드, 카드선택 인 경우 */
					$("#btnNext").attr("disabled",false);
				}else {
					$("#btnNext").attr("disabled",true);
				}
			}
			else if (option=="휴대폰 결제") {
				
				if(card_company!="통신사 선택"){
					$("#btnNext").attr("disabled",false);
				}else {
					$("#btnNext").attr("disabled",true);
				}
				
			}
			// else if(option==""){} 기타
			else if (option == "카카오 페이" || option == "페이코"){
				$("#btnNext").attr("disabled",false);
			}
		}
		
		$("#user_input").on("click",function(){ //일단 이렇게 만듬.
			SetNextBtn();
		});
	</script>
	
</body>
</html>