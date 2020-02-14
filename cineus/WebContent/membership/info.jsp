<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>멤버십</title>
</head>

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  
<body>
	<!-- vip zone -->
	<div class="section no7" id="menu4" style="margin: 100px 500px;">
		<div class="content_wrap narrow">
		 <h2 style="color:#1f0da8">VIP ZONE</h2>
		 <ul style="list-style:none;">
		 	<li class="active" id="tab1" style="margin:0px 80px; padding: 40px 30px; border: 1px solid black; float:left; ">
		 		<a href="#" class="icon vip" data-toggle="tab" title="2019년 VIP 회원안내 보기" style=" font-size: 20px; text-decoration:none;">2019년 VIP 회원안내</a>
		 	</li>
		 	
		 	<li  id="tab2" style="margin:0px 80px; padding: 40px 30px; border: 1px solid black; float:left;">
		 		<a href="#" class=icon vip2" data-toggle="tab" title="2019년 VIP 혜택소개 보기" style=" font-size: 20px; text-decoration:none;">2019년 혜택소개</a>
		 	</li>
		 </ul> <br><br><br><br><br><br>
		 <div class="tab-content">
		 	<div id="t1">
		 	<h3 class="blind">2019년 VIP 회원안내</h3>
		 	<div id="tab" class="tab-pane active">
		 		<p class="help large mb0">VIP회원 혜택은 매 선정 시 마다 달리 질 수 있습니다</p>
		 		<button type="button" class="icon my_class" id="btn_my_class">
		 			나의 회원등급 확인하기
		 		</button>
		 		<table class="data_table border v3" style="width: 100%; border: 1px solid #444444; border-collapse: collapse; ">
		 			<caption class="blind" style="">
		 				VIP 선정: 구분, 내용, 실버, 골드, 다이아몬드, 선정기간, 자격기간 등의 정보제공
		 			</caption>
		 			<colgroup style="border: 1px solid #444444;">
		 				<col width="28%">
		 				<col>
		 			</colgroup>
		 			<thead style="border: 1px solid #444444;">
		 				<tr style="border: 1px solid #444444; ">
		 					<th scope="col" style="border: 1px solid #444444;">구분</th>
		 					<th class="last" scope="col" style="border: 1px solid #444444;">내용</th>
		 				</tr>
		 			</thead>
		 			<tbody style="border: 1px solid #444444;">
		 				<tr style="border: 1px solid #444444; ">
		 					<th scope="row">
		 						<strong>실버</strong>
		 					</th>
		 					<td class="last" style="border: 1px solid #444444;">
		 						2018년 서로 다른 영화 10편 이상 유료 관람
		 					</td>
		 				</tr>
		 					
		 				<tr style="border: 1px solid #444444; ">
		 					<th scope="row">
		 						<strong>골드</strong>
		 					</th>
		 					<td class="last" style="border: 1px solid #444444;">
		 						2018년 서로 다른 영화 20편 이상 유료 관람
		 					</td>
		 				</tr>
		 				
		 				<tr style="border: 1px solid #444444; ">
		 					<th scope="row">
		 						<strong>다이아몬드</strong>
		 					</th>
		 					<td class="last" style="border: 1px solid #444444;">
		 						2018년 서로 다른 영화 30편 이상 유료 관람
		 					</td>
		 				</tr>
		 				
		 				<tr style="border: 1px solid #444444; ">
		 					<th scope="row">
		 						<strong>선정 기간</strong>
		 					</th>
		 					<td class="last" style="border: 1px solid #444444;">
		 						2018년 1월 1일 ~ 2018년 12월 31일 (상영일 기준)
		 					</td>
		 					
		 				</tr>
		 				
		 				<tr style="border: 1px solid #444444; ">
		 					<th scope="row">
		 						<strong>자격 기간</strong>
		 					</th>
		 					<td class="last" style="border: 1px solid #444444;">
		 						2019년 3월 5일 ~ 2020년 2월 29일(상여일 기준)
		 					</td>
		 				</tr>
		 			</tbody>
		 		</table>
		 		<p class="help">서로 다른 영화 기준: 선정 기간 내 유료 관람한 서로 다른 영화 편수<br> (동일 영화는 1편으로 산정)</p>
		 	</div>
		 	</div> <!-- t1 끝 -->
		 	
		 	<div id="t2">
		 	<h3 class="blind">2019년 VIP 혜택 소개</h3>
		 	<div id="tab" class="tab-pane active">
		 		<h4>멤버십 할인</h4>
		 		<ul class="icon_list bx" style="list-style:none;">
		 			<li class="mb20">
		 				"시네어스 멤버십 할인을 이용하여 영화 관람 시 할인을 받을 수 있습니다."
		 				<p class="help">2019년 멤버십 할인은 2018년 영화 관람 횟수에 따라 등급이 결정 되며 등급에 따라 할인율이 달라집니다.</p>
		 				<p class="help">멤버십 할인 조건은 로그인 후 내 정보에서 확인 하실 수 있습니다</p>
		 				<p class="help">멤버십 할인은 어스스토어에서는 사용이 불가합니다.</p>
		 			</li>
		 			<li style="padding:0;background: none">
		 				<table class="data_table border caption2 mt10" style="width: 100%; border: 1px solid #444444; border-collapse: collapse;">
		 					<caption class="blind">등급, 실버, 골드, 다이아몬드의 영화 할인 내용 설명</caption>
		 					<colgroup>
		 						<col>
		 						<col width = "30%">
		 						<col width = "30%">
		 						<col width = "30%">
		 					</colgroup>
		 					<thead>
		 						<tr class="fz15" style="border: 1px solid #444444;">
		 							<th scope="col" id="vip_goob" style="border: 1px solid #444444;">등급</th>
		 							<th class="th_border" scope="col" id="vip_a" style="border: 1px solid #444444;">실버</th>
		 							<th class="th_border" scope="col" id="vip_b" style="border: 1px solid #444444;">골드</th>
		 							<th scope="col" id="vip_c" style="border: 1px solid #444444;">다이야몬드</th>
		 						</tr>
		 					</thead>
		 					<tbody>
		 						<tr style="border: 1px solid #444444;">
		 							<th scope="row" id="vip_movie" rowspan="2">
		 								<strong>
		 									영화
		 									<br>
		 									할인
		 								</strong>
		 								<td headers="vip_movie vip_a vip" style="border: 1px solid #444444;">
		 									<dl>
		 										<dt>실버 등급 할인</dt>
		 										<dd>
		 											10% 할인
		 										</dd>
		 									</dl>
		 								</td>
		 								<td headers="vip_movie vip_b vip_premium" style="border: 1px solid #444444;">
		 									<dl>
		 										<dt>골드 등급 할인</dt>
		 										<dd>
		 											20% 할인
		 										</dd>
		 									</dl>
		 								</td>
		 								<td headers="vip_movie vip_c vvip" style="border: 1px solid #444444;">
		 									<dl>
		 										<dt>다이아 등급 할인</dt>
		 										<dd>
		 											30% 할인
		 										</dd>
		 									</dl>
		 								</td>
		 						</tr>
		 						
		 					</tbody>
		 				</table>
		 			</li>
		 		</ul>
		 	</div>
		 	</div> <!-- t2 끝 -->
		 </div>
		</div>
	</div>
	
	<script>
	
		$("#tab1").on("click",function(){
			$("#t1").show();
			$("#t2").hide();
			
			$("#tab1").css("background-color","#1f0da8");
			$("#tab1 a").css("color","white");
			$("#tab2").css("background-color","white");
			$("#tab2 a").css("color","#1f0da8");
			
			
		});
		$("#tab2").on("click",function(){
			$("#t1").hide();
			$("#t2").show();
			
			$("#tab2").css("background-color","#1f0da8");
			$("#tab2 a").css("color","white");
			$("#tab1").css("background-color","white");
			$("#tab1 a").css("color","#1f0da8");
		});
		
		$("#tab1").trigger("click");
		
		
		$("#btn_my_class").on("click",function(){
			
		})
	</script>

</body>
</html>