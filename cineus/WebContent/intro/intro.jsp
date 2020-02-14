<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div style = "width:850px;margin:0 auto;">
	<div style="color: #1F0DA8;">
		<h2><a href="#menu1" id="no1" class="meun1" title="시네어스 소개 보기">시네어스 소개</a>&nbsp;&nbsp; | &nbsp;&nbsp;
		<a href="#menu2" id="no2" class="meun2" title="찾아오시는 길">찾아오시는 길</a></h2>
	</div>
<div class="section no1" id="menu1" tabindex="0">
	<h3>시네어스 개요</h3>
	
	<div>
		<ul>
			<li>미션 (Mission)</li>
		</ul>
		<img alt="#" src="../images/png1.png">
	
	</div>
<div style="height: 280px">
		<div style="float:left;">
			<ul>
				<li>핵심가치 (Core Value)</li>
			</ul>
			<img alt="#" src="../images/png2.png">
			
		</div> <br>
		
		<div style="width:420px;float:left;">
			<ul>
				<li>Brand Name</li>
			</ul>
			<b>Brand Name</b>
			'CINEUS(시네어스)'는 '시네마와 우리를 뜻하는 CINE와 US의 결합으로,
			모든 고객들이 다양하고 많은 컨텐트를 즐기고 만족을 선사하고자 하는 의미가 담겨 있습니다.
			
			<b>BI(Brand Identity)</b>
			2020년 새롭게 선보인 시네어스의 새로운 모습을 나타냈습니다.
		</div>
	</div>
</div>	
<div class="section no2" id="menu2" tabindex="0">
	<h3>찾아오시는 길</h3>
	<!-- 이미지 지도를 표시할 div 입니다 -->
	
	<div id="staticMap" style="width:600px;height:350px;"></div>    
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8261ba87cb02aa933a61f15c5acf052d"></script>
	<script>    
	// 이미지 지도에 표시할 마커입니다
	// 이미지 지도에 표시할 마커를 아래와 같이 배열로 넣어주면 여러개의 마커를 표시할 수 있습니다 
	var markers = [
	    {
	        position: new kakao.maps.LatLng(37.541900, 127.0450000), 
	        text: '시네어스 6층에 있습니다. 많이 와주세요!' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
	    }
	];

	var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
	    staticMapOption = { 
	        center: new kakao.maps.LatLng(37.541900, 127.0450000), // 이미지 지도의 중심좌표
	        level: 3, // 이미지 지도의 확대 레벨
	        marker: markers // 이미지 지도에 표시할 마커 
	    };    

	// 이미지 지도를 생성합니다
	var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
	</script>
	
</div>
</div>		
</body>
</html>


