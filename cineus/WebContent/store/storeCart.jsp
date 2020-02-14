<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8");%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<c:set var="cartList" value="${requestScope.cartList }"/>
<c:set var="memberBean" value="${requestScope.memberBean }"/>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">
.center-home {list-style:none;margin:0 auto;padding:0;width:970px;height:28px;font-weight:bold;}
.center-home-div {background-color:#f2f2f2;border-top:1px solid #e1e1e1; margin-top:105px;}
.center-text {color:#1f0da8; margin-top: 8px;}
.center-home-line {height:3px;background-color:#1f0da8; margin-top: 8px;}
.btn-primary2 {background-color: #1F0DA8; border-color: #1F0DA8; color: #FFF; !important;}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니</title>
	<!-- 헤더가 들어가는 곳 -->
	<jsp:include page="/inc/header.jsp"/>
	<!-- 헤더가 들어가는 곳 -->
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->
	
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous"> 
	<!-- 아이콘 폰트어썸 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<!-- 아이콘 폰트어썸 -->
	   
	<script type="text/javascript">
		$(function() {//페이지가 로드되었을 때~ 장바구니가 비어있으면 구매불가능
			<c:if test="${empty cartList}">
				/* $("#buyBtn").attr('disabled',true); */
				$("#buyBtn").css("visibility", "hidden");
			</c:if>
			
			if ($(".final_total_price").val() < 50000) {//5만원 미만일 때는 일시불만 가능
				$("#installment option[value != 0]").remove();
			}
		});
	
		function toggle() {//구매하기 버튼 클릭
			if ($("#cardDiv").css("visibility") == "hidden") {
				$("#cardDiv").css("visibility", "visible");
				$(".cartHead").html("<i class='fas fa-credit-card'></i> 결제하기");
			} else {
				$("#cardDiv").css("visibility", "hidden");
				$(".cartHead").html("<i class='fas fa-shopping-cart'></i> 장바구니");
			}	
		}
		
		function payment() {//결제 버튼 클릭
			var birth_regEXP = /([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))/;//주민번호6자리
			var busi_regEXP = /^[0-9]{6,10}$/;//그냥 숫자6~10자리 정규식
			var mm_regEXP = /0[1-9]|1[012]/;//월 2자리 정규식
			var yy_regEXP = /^[0-9]{2,2}$/;//숫자2자리 정규식
			var card_regEXP = /^(?:(94[0-9]{14})|(4[0-9]{12}(?:[0-9]{3})?)|(5[1-5][0-9]{14})|(6(?:011|5[0-9]{2})[0-9]{12})|(3[47][0-9]{13})|(3(?:0[0-5]|[68][0-9])[0-9]{11})|((?:2131|1800|35[0-9]{3})[0-9]{11}))$/;
			
			//유효성 체크
			if ($("#card-holder").val() == "") {
				alert("생년월일은 필수입력사항입니다.");
				$("#card-holder").focus();
				return false;
			} else if (!birth_regEXP.test($("#card-holder").val()) || !busi_regEXP.test($("#card-holder").val())) {
				alert("생년월일 및 사업자번호 형식이 올바르지 않습니다.");
				$("#card-holder").focus();
				return false;
			} else if ($(".cardMM").val() == "" || $(".cardYY").val() == "") {
				alert("유효기간은 필수입력사항입니다.");
				$(".cardMM").focus();
				return false;
			}else if (!mm_regEXP.test($(".cardMM").val()) || !yy_regEXP.test($(".cardMM").val())) {
				alert("년 월 형식이 올바르지 않습니다.");
				$(".cardMM").focus();
				return false;
			} else if ($("#card_num").val() == "") {
				alert("카드번호는 필수입력사항입니다.");
				$("#card_num").focus();
				return false;
			} else if (!card_regEXP.test($("#card_num").val())) {
				alert("카드번호 형식이 올바르지 않습니다.");
				$("#card_num").focus();
				return false;
			} else if ($("#card_pwd").val() == "") {
				alert("비밀번호는 필수입력사항입니다.");
				$("#card_pwd").focus();
				return false;
			}

			$("#cardForm").submit();
		}
	
	</script>
	
	<style type="text/css">
		#cardDiv {
			visibility: hidden;
		}
		
	</style>

	   
    <!-- </head>
		 <body> -->
		 
<div class="center-home-div">
	<ul class="container center-home">
		<h5 class="center-text font-weight-bold">장바구니</h5>
	</ul>
	<hr class="center-home-line">
</div>
		 
	<div class="container" id="mar">
	
		<div class="container mb-4">
		    <div class="row">
		    <div class="cartHeadDiv">
		    	<h1 class="cartHead"><i class="fas fa-shopping-cart"></i> 장바구니</h1>
		    </div>
		        <div class="col-12">
		            <div class="table-responsive tblTop">
		                <table class="table table-striped cartTbl">

<c:choose>
	<c:when test="${empty cartList}">
		<tr class="emptyCartTr"><td colspan="5"  class="emptyCart">장바구니에 담긴 상품이 없습니다.</td></tr>
	</c:when>

	<c:otherwise>

							<thead>
		                        <tr>
		                        	<th scope="col" width="110px"></th>
		                            <th scope="col" class="text-center" width="380px">상품명</th>
		                            <th scope="col" class="text-center" width="150px">판매금액</th>
		                            <th scope="col" class="text-center" width="190px">수량</th>
		                            <th scope="col" class="text-center" width="150px">구매금액</th>
		                            <th scope="col" width="100px"></th>
		                        </tr>
		                    </thead>
		                    <tbody>
	
		<c:forEach var="cartList" items="${cartList }">
								<tr>
		                            <td><img src="../images/store_images/${cartList.item_image }" /> </td>
		                            <td>${cartList.item_name }</td>
		                            <td class="price1"><fmt:formatNumber type="number" maxFractionDigits="3" value="${cartList.sale_price }"/>원</td>
		                            <td>
		                            	<form action="${contextPath }/stores/modifyCart.do">
			                            	<input type="number" class="itmeNum" name="cart_qty" value="${cartList.cart_qty }" min="1" max="5" />
			                            	<input type="hidden" name="item_code" value="${cartList.item_code }">
			                            	<input type="submit" value="변경">
		                           		</form>
		                            </td>
		                            <td class="text-right total_price_cart">
		                            	<div class="tp2Div"><input type="text" class="total_price2" value="${cartList.sale_price * cartList.cart_qty }" disabled="disabled"><label>원</label></div>
		                            </td>
		                            <td class="trashBtn"><button class="btn btn-sm btn-danger" onclick="location.href='${contextPath }/stores/deleteCart.do?item_code=${cartList.item_code }'"><i class="fa fa-trash"></i> </button> </td>
		                        </tr>
		</c:forEach>
								<tr>
		                            <td colspan="4" class="tatal1">총 결제 예정 금액</td>
		                            <td colspan="2" class="text-right pay_price"">
		                            	<input type="text" class="final_total_price" disabled="disabled"><div>원</div>
		                            </td>
		                        </tr>
		                        <tr>
		                        	<td colspan="6" class="cartWarning"><i class="fas fa-exclamation-triangle"></i> 장바구니에 담긴 상품은 1분 동안 유지됩니다!</td>
		                        </tr>
		                    </tbody>
	</c:otherwise>
</c:choose>		                        

		                </table>
		            </div>
		        </div>
		        <div class="col mb-2 buyBtnDiv">
		            <div class="row">
		                <div class="col-sm-12 col-md-12">
		                    <button class="buyBtn" id="buyBtn" onclick="toggle();">구매하기</button>
		                </div>
		            </div>
		        </div>
		        <!-- ---------구매하기 버튼 누르면 나타나는 부분//------------- -->
		      <div id="cardDiv-par">  
		        <div id="cardDiv">
		        	<div class="customerInfo">
		                <h3 class="title">구매자 정보 확인</h3>
		                <div>
		                <label for="name">이름</label>
		                <input type="text" id="name" name="customer_name" class="" value="${memberBean.customer_name }" aria-label="name" aria-describedby="basic-addon1" disabled="disabled">
		                </div>
		                <div>
		                <label for="tel">연락처</label>
		                <input type="text" id="tel" name="customer_tel" class="" value="${memberBean.customer_tel }" aria-label="tel" aria-describedby="basic-addon1" disabled="disabled">
			       		</div>
			        </div>
		        	<!-- ---------결제 버튼 누르면 전송되는 폼//------------- -->
		        	<form action="${contextPath }/stores/payment.do" method="post" id="cardForm">
			        	<input type="hidden" name="pay_price" class="final_total_price">
			        	
			        	<div id="paytype">
				        	<h3 class="title">결제수단</h3>
				        	<input type="radio" name="pay_type1" id="creditCard" checked="checked">
				        	<label for="creditCard">신용카드</label>
				        	<select name="pay_type" class="card_select">
				        		<option value="BC카드" selected="selected">BC카드</option>
				        		<option value="삼성카드">삼성카드</option>
				        		<option value="신한카드">신한카드</option>
				        		<option value="우리카드">우리카드</option>
				        		<option value="하나카드">하나카드</option>
				        		<option value="롯데카드">롯데카드</option>
				        		<option value="현대카드">현대카드</option>
				        		<option value="KB국민카드">KB국민카드</option>
				        	</select>
				        	<input type="radio" name="pay_type1" id="kakaoPay" value="kakaoPay">
				        	<label for="kakaoPay">카카오페이</label>
			        	</div>
			        	
		        		<script type="text/javascript"> <%-- 카카오페이 클릭방지 함수 --%>
							$("input:radio[name=pay_type1]").click(function(){
								if($("input:radio[name=pay_type1]:checked").val() == 'kakaoPay') {
									/* alert("준비중인 서비스입니다.");
									$("#creditCard").click(); */
									window.open("https://mockup-pg-web.kakao.com/v1/83bb1cf1ebcdd0bab57e00a0eb5218b43bbf24c88dab804e9587c35cf43ddbf4/info", "카카오페이", "width=460, height=600");
								}
							});
						</script>
			        	
				       <div class="card-details">
			            <h3 class="title">카드 정보 입력</h3>
			            <div class="row">
			              <div class="form-group col-sm-7">
			                <label for="card-holder">생년월일/사업자번호</label>
			                <input id="card-holder" name="card_birth" type="text" class="form-control" placeholder="생년월일 6자리(예:801224)/사업자번호 10자리" maxlength="10" aria-label="Card Holder" aria-describedby="basic-addon1">
			              </div>
			              <div class="form-group col-sm-5">
			                <label for="card_month">유효기간</label>
			                <div class="input-group expiration-date">
			                  <input type="text" class="form-control cardMM" name="card_month" placeholder="MM" maxlength="2" aria-label="MM" aria-describedby="basic-addon1">
			                  <span class="date-separator sep1">/</span>
			                  <input type="text" class="form-control cardYY" name="card_year" placeholder="YY" maxlength="2" aria-label="YY" aria-describedby="basic-addon1">
			                </div>
			              </div>
			              <div class="form-group col-sm-8">
			                <label for="card_num">카드번호</label>
			                <input type="text" id="card_num" name="card_num" class="form-control" placeholder="(-)기호 없이 16자리" maxlength="16" aria-label="Card Holder" aria-describedby="basic-addon1">
			              </div>
			              <div class="form-group col-sm-4">
			                <label for="card_pw">비밀번호</label>
			                <input type="password" id="card_pwd" name="card_pw" class="form-control" placeholder="앞2자리" maxlength="2" aria-label="pwd" aria-describedby="basic-addon1">
			              </div>
			              <div class="form-group col-sm-4">
			                <label for="pay_ins">할부</label>
			                <select id="installment" name="pay_ins" class="ins_select" aria-label="installment" aria-describedby="basic-addon1">
			              		<option value="0" selected="selected">0</option>
			              		<option value="1">1</option>
			              		<option value="2">2</option>
			              		<option value="3">3</option>
			              		<option value="4">4</option>
			              		<option value="5">5</option>
			              		<option value="6">6</option>
			              		<option value="7">7</option>
			              		<option value="8">8</option>
			              		<option value="9">9</option>
			              		<option value="10">10</option>
			              		<option value="11">11</option>
			              		<option value="12">12</option>
			              	</select>
			              </div>
			              <div class="form-group col-sm-12 finalPayDiv">
			                <button type="button" class="finalPayBtn" onclick="payment();">결제</button>
			              </div>
			            </div>
			          </div>
		          </form>
		          <!-- ---------//결제 버튼 누르면 전송되는 폼------------- -->
		        </div>
		      </div>
		        <!-- ---------//구매하기 버튼 누르면 나타나는 부분------------- -->
		    </div>
		</div>
	        
	</div>	 		 	 
	
	<script type="text/javascript">
		//총결제금액 더해서 출력하는 함수
		var total=0;
		$("input.total_price2").each(function(){
			total+=parseInt($(this).val());
		});
		$(".final_total_price").val(total);
	</script>
	
	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->
	
</body>
</html>