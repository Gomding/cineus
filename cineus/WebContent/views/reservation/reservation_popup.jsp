<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="context" value="${pageContext.request.contextPath}" /><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제하기</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
 <script src = "https://code.jquery.com/jquery-latest.js"></script>
	<style>
		#popup{
		width:100%;
		height:100%;
			background-color:#ececec;
			border:1px red solid;
			font-size:16px;
		}
		#title{
			background-color:navy;
			color:white;
			font-size:20px;
			font-weight:bold;
		}
		#right{
			background-color:white;
		}
		#popup .row{
			margin-right:0px;
			margin-left:0px;
		}
		#popup .col, #popup .col-3, #popup .col-9{
			margin-right:0px;
			margin-left:0px;
			padding-right:0px;
			padding-left:0px;
		} 
		.more{
			font-size:16px;
			background-color:#ececec;
		}
		.table-pro{
			font-size:16px;
			width: 100%;
  			margin-bottom: 1rem;
  	 		 color: #212529;	
		}
		.table-pro td{
			padding-left:3px;
		}
		.table-pro tr{
			height:40px;
		}
		.cardnum {
			text-align:center;
			width:75px;
		}
		.telnum {
			text-align:center;
			width:60px;
		}
		.col {
			display:inline-block;
		}
		
		.mt30 {
			margin-top:30px !important;
		}
		.mg30 {
			margin:0px 30px !important;
		}
		.mgt30{
			margin:30px 30px 0px 30px !important;
		}
		.line {
			border-top: 2px solid rgb(51, 51, 51);
			border-bottom: 2px solid rgb(51, 51, 51);
		}
		.pl-1, .px-1 {
   
  		  padding: 0px 30px !important;
		}
		
		.height {
			height:40px !important;
		}
	</style>
</head>
<body>
	<div class="container pl-0 pr-0 ml-0 mr-0" id="popup">
	
		<div class="row ">
			<div class="col col-12 pt-2 pb-2" id="title">
				전자 결제 서비스
			</div>
		</div>
		
		<div class="row">
			<div class="col col-3" id="left" style="border-right:1px solid #ececec">
				<div class="row pt-2 pb-2" style="background-color:black;color:white;">
					${param.option}
				</div>
			</div>
			
			<div class="col col-9 pl-0 pr-0" id="right">
				<div class="row pl-1 mt30">
					<div class="col col-6 text-left" style="font-size:20px;">
						이용약관
					</div>
					<div class="col col-6 text-right">
						<div class="form-check form-control-sm">
						  <input class="form-check-input" type="checkbox" value="" id="agree_all">
						  <label class="form-check-label" for="agree_all">
						    전체동의
						  </label>
						</div>
					</div>
				</div>
				<div class="row  pl-1">
					<table class="table-pro">
						<tbody class = "line">
						<tr>
							<td>전자 금융거래 이용약관</td>
							<td ><span class="more">자세히보기</span></td>
							<td>
								<div class="form-check form-control-sm" >
							 		<input class="form-check-input _agree" type="checkbox" value="" id="agree_1">
							 		<label class="form-check-label" for="agree_1">
							  			동의
							  		</label>
								</div>
							</td>
						</tr>
						<tr>
							<td>개인정보의 수집 및 이용안내</td>
							<td ><span class="more">자세히보기</span></td>
							<td>
								<div class="form-check form-control-sm" >
							 		<input class="form-check-input _agree" type="checkbox" value="" id="agree_2">
							 		<label class="form-check-label" for="agree_2">
							  			동의
							  		</label>
								</div>
							</td>
						</tr>
						<tr>
							<td>개인정보 제공 및 위탁안내</td>
							<td ><span class="more">자세히보기</span></td>
							<td>
								<div class="form-check form-control-sm" >
							 		<input class="form-check-input _agree" type="checkbox" value="" id="agree_3">
							 		<label class="form-check-label" for="agree_3">
							  			동의
							  		</label>
								</div>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
				<div class="row  pl-1">
					<table class="table-pro mt30">
						<tbody class = "line">
						<tr>
							<td>상품명</td>
							<td>${param.theater_name} / ${param.title} </td>
						</tr>
						<tr>
							<td>금액</td>
							<td>${param.ticketPrice}원</td>
						</tr>
						<tr>
							<td>제공기간</td>
							<td>제공기간이 없는 상품입니다.</td>
						</tr>
						</tbody>
					</table>
				</div>
				<div class="row line mgt30">	
					<div class="col col-3 height">
						결제수단
					</div>
					<div class="col col-9">
						  <label class="form-check-label">
						  		${param.option}
						  </label>
						  <input type = "hidden" id = "paymethod" value = "${param.option}">
						  
					</div>
					<div id = "card-container" style = "width:100%;">
						<div class="col col-3 height">
							카드사
						</div>
						<div class="col col-9" style = "width:400px;">
							  <label class="form-check-label">
							  	${param.company}
							  </label>
						</div>
						<div class="col col-3 height">
							카드번호
						</div>
						<div class="col col-9"  style = "width:400px;">
							<input class = "cardnum" id = "cardnum1" maxlength="4" validate="number" allowtype="number" fieldname="카드번호"/>
							<input class = "cardnum" id = "cardnum2" maxlength="4" validate="number" allowtype="number" fieldname="카드번호"/>
							<input class = "cardnum" id = "cardnum3" maxlength="4" validate="number" allowtype="number" fieldname="카드번호"/>
							<input class = "cardnum" id = "cardnum4" maxlength="4" validate="number" allowtype="number" fieldname="카드번호"/>
						</div>
					</div>
					<div id = "telnum-container">
						<div class="col col-3 height">
							통신사
						</div>
						<div class="col col-9" style = "width:400px;">
							  <label class="form-check-label">
							  	${param.company}
							  </label>
						</div>
						<div class="col col-3 height">
							휴대폰 번호
						</div>
						<div class="col col-9"  style = "width:400px;">
							<input class = "telnum" id = "telnum1" maxlength="3" validate="number" allowtype="number" fieldname="연락처"/>
							<input class = "telnum" id = "telnum2" maxlength="4" validate="number" allowtype="number" fieldname="연락처"/>
							<input class = "telnum" id = "telnum3" maxlength="4" validate="number" allowtype="number" fieldname="연락처"/>
							
						</div>
					</div>
					
				</div>
				<div class="row mt-5 mb-5">	
					<div class="col col-6">
						<button class="btn btn-light _close btn-sm btn-block">취소하기</button>
					</div>
					<div class="col col-6">
						<button class="btn btn-dark btn-sm btn-block _confirm">결제하기</button>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col col-12">
						<button class="btn btn-light _close btn-sm btn-block">닫기</button>
					</div>	
				</div>
			</div> 
		</div>
		
		
		
	</div>
	
	<script type="text/javascript">
	
	$(document).ready(function() {
		
		
		var paymethod = $("#paymethod").val();
		
		if(paymethod == "신용/체크카드") {
			$("#card-container").show();
			$("#telnum-container").hide();
			
		}
		else if(paymethod == '휴대폰 결제') {
			$("#card-container").hide();
			$("#telnum-container").show();
		}
		else {
			$("#card-container").hide();
			$("#telnum-container").hide();
		}
	});
	</script>
	
	<script>
		$("._close").on("click",function(){
			window.close();
		});
		$("._confirm").on("click",function(){
			//결제가 이루어졌다고 가정한다.
			if($("#agree_all").prop("checked")==false){
				alert("약관에 모두 동의하지 않았습니다.");
				return;
			}
			else if($("#i_card_name").prop("checked")==false){
				alert("카드를 선택하지 않았습니다.");
				return;
			}
			else{
				var cardnum = $("#cardnum1").val() + $("#cardnum2").val() + $("#cardnum3").val();
				var telnum = $("#telnum1").val() + $("#telnum2").val() + $("#telnum3").val()
				opener.location.replace("${context}/reservation/confirm_pay.do?ticket_id=${param.ticket_id}&payMethod=${param.option}&company=${param.company}&cardnum="+cardnum+"&telnum="+telnum);
				window.close();
			}
		});
		$("#agree_all").on("click",function(){
			if($(this).prop("checked")==true){
				$("._agree").prop("checked",true);
			}
			else{
				$("._agree").prop("checked",false);
			}
		});
		$("._agree").on("click",function(){
			//셋중 하나라도 false이면 all도 false
			if($(this).prop("checked")==false && $("#agree_all").prop("checked")==true){
				$("#agree_all").prop("checked",false);
			}
			//셋 모두 true 이면 all 도 true
			if($("#agree_1").prop("checked")==true && 
					$("#agree_2").prop("checked")==true && 
					$("#agree_3").prop("checked")==true && 
					$("#agree_all").prop("checked")==false){
				$("#agree_all").prop("checked",true);
			}
		});
	</script>
</body>
</html>