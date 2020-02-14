<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<c:set var="storeBean" value="${requestScope.storeBean }" />
<c:set var="id" value="${sessionScope.id}"/>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스토어</title>
	<!-- 헤더가 들어가는 곳 -->
	<jsp:include page="/inc/header.jsp"/>
	<!-- 헤더가 들어가는 곳 -->
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- 아이콘 폰트어썸 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<!-- 아이콘 폰트어썸 -->
	<!------ Include the above in your HEAD tag ---------->
	
	<script type="text/javascript">
		function log_confrim() {//로그인 유무 확인 후 장바구니 이동
			if (${id eq null}) {
				if (confirm("로그인이 필요한 서비스입니다. \n로그인페이지로 이동하시겠습니까?")) {
					location.href="${contextPath }/members/login.me";
				}
			} else {
				$("#storeForm").submit();
			}
		}
	</script>
	<script type="text/javascript">
		$(function() {
			if ($(".total_price").val() != null) {
				 var regexp = /\B(?=(\d{3})+(?!\d))/g;
				 return $(".total_price").val().replace(regexp, ',');
			}
		});
	
		$(function() {
			$(".btn_mins").click(function() {//물건 개수 빼기 버튼
				$("#cart_qty").val($("#cart_qty").val() - 1);
				if ($("#cart_qty").val() < 1) {//최소 수량 1
					$("#cart_qty").val("1");
				}
				$(".total_price").text(${storeBean.sale_price} * $("#cart_qty").val());
				$(".total_price").val(${storeBean.sale_price} * $("#cart_qty").val());
			});
			
			$(".btn_plus").click(function() {//물건 개수 더하기 버튼
				$("#cart_qty").val(parseInt($("#cart_qty").val()) + 1);
				if ($("#cart_qty").val() > 5) {//최대 수량 5
					$("#cart_qty").val("5");
				}
				$(".total_price").text(${storeBean.sale_price} * $("#cart_qty").val());
				$(".total_price").val(${storeBean.sale_price} * $("#cart_qty").val());
			});			
		});
	</script>
	
    <!-- </head>
		 <body> -->
	<div class="container" id="mar">
	
		<div class="container itemContainer">

		<p class="text-center itemType">
			<c:choose>
				<c:when test="${storeBean.item_type eq 'ticket' }">씨네티켓</c:when>
				<c:when test="${storeBean.item_type eq 'event' }">씨네찬스</c:when>
				<c:otherwise>씨네푸드</c:otherwise>
			</c:choose>
		</p>
		<hr>
				
		<div class="card">
			
				<form action="${contextPath }/stores/insertCart.do?item_code=${storeBean.item_code}" method="post" id="storeForm">
					<div class="row">
					<div class="col-sm-6 border-right mr-0" style="margin-right:0px;">
					<article class="gallery-wrap"> 
					<div class="img-big-wrap">
					 	<div class="imgDiv"><img src="../images/store_images/${storeBean.item_image }"></div>
					 	<input type="hidden" name="item_image" value="${storeBean.item_image }">
					</div>
					</article> <!-- gallery-wrap .end// -->
					</div>
					<div class="col-sm-6 mr-0" style="margin-right:0px;">
					<article class="card-body cb1">
						<h3 class="title title_big">${storeBean.item_name }</h3>
						<input type="hidden" name="item_name" value="${storeBean.item_name }">
						<h2 class="title_small">${storeBean.item_detail }</h2>
					<dl class="item-property">
					  <dt>사용가능 영화관</dt>
					  <dd>${storeBean.place }</dd>
					</dl>
					<dl class="param param-feature">
					  <dt>유효기간</dt>
					  <dd>${storeBean.exp }</dd>
					</dl>  <!-- item-property-hor .// -->
					<dl class="param param-feature">
					  <dt>판매수량</dt>
					  <dd>1회 5개 구매가능</dd>
					</dl>  <!-- item-property-hor .// -->
					<dl class="param param-feature btm1">
					  <dt>구매 후 취소</dt>
					  <dd>구매일로부터 7일까지 취소 가능하며, 부분취소는 불가능합니다.</dd>
					</dl>  <!-- item-property-hor .// -->				
					<hr>
					<div class="row">
						<div class="col-sm-5">
							<dl class="param param-feature">
							  <dt>스토어 판매가</dt>
							  <dd>
							  	<fmt:formatNumber type="number" maxFractionDigits="3" value="${storeBean.sale_price }"/>원
							  </dd>
							  <input type="hidden" name="sale_price" value="${storeBean.sale_price }">
							</dl> <!-- price-detail-wrap .// -->
							<dl class="param param-feature">
							  <dt>수량</dt>
							  <div class="bx_num">
							  	<button type="button" class="btn_mins">-</button>
							  	<input type="text" id="cart_qty" name="cart_qty" value="1" readonly="readonly">
							  	<button type="button" class="btn_plus">+</button>
							  </div>
							</dl>  <!-- item-property .// -->
						</div> <!-- col.// -->
					</div> <!-- row.// -->
					<hr>
					
					<dl class="param param-feature">
						<dt>총 구매금액 :</dt>
						<dd class="tpdd"><span class="total_price">${storeBean.sale_price }</span><span class="total_price_won">원</span></dd>
						<!-- <input type="text" class="total_price" value="포커스가오나 안오나"> -->
					</dl>	
					<button type="button" class="cartbtn" onclick="log_confrim();">장바구니 담기</button>	
				</article> <!-- card-body.// -->
				</div> <!-- col.// -->
			
			</div> <!-- row.// -->
			</form>
		</div> <!-- card.// -->
		
		<br>
		
		<!-- 하단 설명// -->
		<div class="cardBtm">
			<dl class="param param-feature">
				<dt>상품이용안내</dt>
				<dd>
					<p><i class="fas fa-chevron-right" style="color: #01738b;"></i> 관람권 유효기간과 상관없이 영화는 조기종영될 수 있으며, 영화관에 따라 상영되지 않을 수 있습니다.</p>
					<p><i class="fas fa-chevron-right" style="color: #01738b;"></i> 관람권은 카카오 알림톡을 통해 전송 됩니다. (카카오톡 미설치 또는 미수신 고객은 MMS로 발송)</p>
					<p><i class="fas fa-chevron-right" style="color: #01738b;"></i> 관람권은 씨네어스 홈페이지, 어플에서만 예매 가능합니다. (전화예매, 현장매표소 및 무인발권기 예매 불가)</p>
					<p><i class="fas fa-chevron-right" style="color: #01738b;"></i> 어플 및 홈페이지 예매방법: 지점 > 영화명 > 시간 > 인원 > 결제수단 > 관람권 > 스토어 관람권 > 전송 받은 PIN번호 16자리 입력> 결제</p>
					<p><i class="fas fa-chevron-right" style="color: #01738b;"></i> 관람권 구매 건당 PIN 번호가 생성됩니다.</p>
					<p><i class="fas fa-chevron-right" style="color: #01738b;"></i> 이벤트 관람권 구매 시 해당 영화관의 상영시간표를 먼저 확인 후에 구매해주세요.</p>
					<p><i class="fas fa-chevron-right" style="color: #01738b;"></i> 이벤트 관람권은 발송된 쿠폰번호 1개로 2인 일괄 사용 됩니다. (분리 사용 불가)</p>
					<p><i class="fas fa-chevron-right" style="color: #01738b;"></i> [ 원산지 ] - 팝콘 : 옥수수(미국산)</p>
					<p><i class="fas fa-chevron-right" style="color: #01738b;"></i> 가격 정책에 따라 티켓금액이 변동 될 수 있으며 이에 대한 차액 환불이 불가합니다. (조조/심야/청소년/어린이/마티네/우대 등)</p>
					<p><i class="fas fa-chevron-right" style="color: #01738b;"></i> 씨네어스 홈페이지 스토어 구매내역에서 PIN 번호 확인 가능하며, 본 권 구매 시 등록한 휴대폰 번호로만 재전송이 가능합니다.</p>
					<p><i class="fas fa-chevron-right" style="color: #01738b;"></i> 구매 취소는 미사용 관람권에 한해 가능하며, 구매 후 7일 이내에 일괄 취소만 가능합니다. (부분 취소 불가)<br>(ex 2매 이상 한번에 구매 시 모든 관람권을 일괄 취소해야 하며, 취소 가능 시점은 구매일자 기준입니다.)</p>
					<p><i class="fas fa-chevron-right" style="color: #01738b;"></i> 일부 극장 [센트럴점, 일산벨라시타점, 삼천포점, 아트나인점], 특별관 [더 부티크, 발코니, MX, 더 퍼스트 클럽, 키즈관] 및 특별콘텐트 예매가 불가합니다. (차액 지불 여부 상관없이 예매 불가)</p>
				</dd>
			</dl>
		</div>	
		<!-- //하단 설명 -->
		</div>
		<!--container.//-->        
	</div>	 	
	 	 
	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->
</body>
</html>