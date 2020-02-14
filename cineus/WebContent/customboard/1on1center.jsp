<%@page import="faqboard.BoardDAO"%>
<%@page import="faqboard.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의게시판</title>


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src = "https://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript" src="/js/bootstrap-datepicker.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style>

a {
    background: transparent;
}

input {
    width: 200px;
    border: 1px solid #d9d9d9;
    line-height: 26px;
    height: 26px;
    background-color: #f8f8f8;
    font-size: 12px;
    color: #333;
    text-indent: 14px;
    vertical-align: middle;
}

input[type="radio" i] {
    background-color: initial;
    cursor: default;
    -webkit-appearance: radio;
    box-sizing: border-box;
    margin: 3px 0.5ex;
    padding: initial;
    border: initial;
}

textarea {
    display: block;
    width: 100%;
    padding: 10px;
    border: 1px solid #d9d9d9;
    background-color: #f8f8f8;
    font-size: 12px;
    line-height: 21px;
    color: #333;
}

a {
    color: #198591;
    text-decoration: none;
}

.blind {
    display: block;
    overflow: hidden;
    position: absolute;
    top: -1000em;
    left: -1000em;
}



</style>
	
<!--  header.jsp에 이미 </head> 와 <body>가 있음 -->	
<!-- </head> -->
<!-- <body> -->

<!-- 헤더 들어가는곳 -->
<jsp:include page="/inc/header.jsp"/>
<!-- 헤더 들어가는곳 -->
<link rel="stylesheet" href="${contextPath}/customboard/style.css">


<div class="content-wrap">
	<div class="center-home-div">
		<ul class="center-home">
			<li class = "center-home-inner">
				<a class = "center-text" href="${contextPath}/customerboard/customcenter.do" >고객센터</a>
			<li>
		</ul>
		<hr class="center-home-line">
	</div>
</div>
<div class = "container-board width-fixed">
	<div class = "customer-tab cu30">
		<ul>
			<li><a href = "${contextPath}/customerboard/FAQcenter.do" class = "ct5">자주묻는질문</a></li>
			<li><a href = "${contextPath}/customerboard/noticecenter.do" class = "ct5">공지사항</a></li>
			<li><a href = "${contextPath}/customerboard/1on1center.do" class = "ct5">1:1문의</a></li>
			<li><a href = "${contextPath}/customerboard/groupRent_center.do" class = "ct5">단체관람/대관문의</a></li>
			<li style = "border-right:1px solid #d9d9d9;"><a href = "${contextPath}/customerboard/lostArticle_center.do" class = "ct5">분실물문의/접수</a></li>
			<li class = "ct5" id = "phone-number">시네어스 고객센터<br><h4>Cineus center</h4><hr><h3>1234-5678</h3></li>
		</ul>
	</div>
	<h2 class = "cu30"><span class = "sub-title customer st2">1:1문의</span></h2>
	<div class = "center1on1_container-board">
		<ul class = "icon_list pl25">
			<li>>문의하시기 전 FAQ를 확인하시면 궁금증을 더욱 빠르게 해결하실 수 있습니다.</li>
			<li>>1:1 문의글 답변 운영시간 09:00 ~ 21:00</li>
			
		</ul>
		<h4 class = "customer_h4">개인정보 수집에 대한 동의</h4>
		<div class = "customer_term_wrap">
			<div class = "customer_term_text">
				귀하께서 문의하신 다음의 내역은 법률에 의거 개인정보 수집.이용에 대한 본인동의가 필요한 항목입니다.<br><br>
				개인정보의 수집 및 이용목적<br>
				회사는 1:1 문의내역의 확인, 요청사항 처리 또는 완료 시 원활한 의사소통 경로 확보를 위해 수집하고 있습니다.<br><br>
				
				수집하는 개인정보의 항목<br>
				이름, 연락처, 이메일 주소<br>
				<br>
				개인정보의 보유기간 및 이용기간<br>
				문의 접수 ~ 처리 완료 후 6개월<br>
				(단, 관계법령의 규정에 의하여 보존 할 필요성이 있는 경우에는 관계 법령에 따라 보존)<br>
				자세한 내용은 '개인정보 처리방침'을 확인하시기 바랍니다.	<br>
				&nbsp
			</div>
		</div>
		<p class = "pull-left ct10">
			개인정보수집에 동의하십니까?<br>
			* 원활한 서비스 이용을 위한 최소한의 개인정보이므로 동의하지 않을 경우 서비스를 이용하실 수 없습니다.
		</p>
		<form action = "${contextPath}/customerboard/write1on1.do" name = "send1on1Form" method = "post" enctype = "multipart/form-data" onsubmit = "return formCheck();">
			<div class = "customer_radio_wrap pull-right">
				<span class = "iradio_minimal" style = "vertical-align: middle;display:inline-block;width: 18px;height: 18px;position: relative;">
				<input type="radio" title="개인정보 수집 동의함 선택" name="agreement" id="agreement1" class="icheck" value="Y" style="position: absolute; top: 0px; left: 0px; display: block; width: 16px; height: 16px; padding: 0px; margin: 0px; background: rgb(255, 255, 255); z-index: 0; border: 0px; opacity: 1;">
				</span>
				<label for = "agreement1" class = "mr17" aria-checked = "false" aria-disabled = "false">동의함</label>
				<span class = "iradio_minimal" style = "vertical-align: middle;display:inline-block;width: 18px;height: 18px;position: relative;" >
				<input type="radio" title="개인정보 수집 동의함 선택" name="agreement" id="agreement2" class="icheck" value="N" style="position: absolute; top: 0px; left: 0px; display: block; width: 16px; height: 16px; padding: 0px; margin: 0px; background: rgb(255, 255, 255); z-index: 0; border: 0px; opacity: 1;">
				</span>
				<label for = "agreement2" class = "mr17" aria-checked = "false" aria-disabled = "false">동의하지않음</label>
			</div>
			<div id = "center1on1Register" class = "form-style">
				<table class = "form-table" summary = "1:1 문의">
					<caption class = "blind2">1:1문의:이름, 영화관, 연락처, 이메일, 제목, 내용 등의 입력표</caption>
					<colgroup>
						<col width = "150px">
						<col>
						<col width = "150px">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope = "row" id = "th_1on1input_name"><label for = "center-1on1-name">이름</label></th>
							<td headers="th_1on1input_name" colspan="3">
							<input type="text" title="이름" id="center-1on1-name" name="name" value="" maxlength="20" allowtype="hangul alphabet special" fieldname="이름" required="">
							</td>
						</tr>
						<tr>
							<th scope="row" id="th_1on1input_tel" class="">연락처</th>
							<td headers="th_1on1input_tel">
								<input type="text" id = "m1" name="mobile1" title="연락처 첫번째자리" class="w67" value="" maxlength="3" validate="number" allowtype="number" fieldname="연락처" required="">
								<span class="text-sub ml2 mr2">-</span>
								<input type="text" id = "m2" class="w67" name="mobile2" title="연락처 두번째자리" value="" maxlength="4" validate="number" allowtype="number" fieldname="연락처" required="">
								<span class="text-sub ml2 mr2">-</span>
								<input type="text" id = "m3" class="w67" name="mobile3" title="연락처 세번째자리" value="" maxlength="4" validate="number" allowtype="number" fieldname="연락처" required="">
							</td>
							<th scope="row" id="th_1on1input_email">
								<label for="center-1on1-email">이메일</label>
							</th>
							<td headers="th_1on1input_email">
								<input type="text" title="이메일" id="center-1on1-email" name="email" value="" maxlength="30" validate="email" fieldname="이메일" required="">
							</td>
						</tr>
						<tr>
							<th scope="row" id="th_1on1input_tel">문의지점</th>
							<td headers="th_1on1input_tel" colspan="3">
								<div class="fl">
									<span class="iradio_minimal checked" style="vertical-align: middle; display: inline-block; width: 18px; height: 18px; position: relative;" aria-checked="false" aria-disabled="false"><input type="radio" id="inputtext14" title="지점문의" name="oneOnOneCsType" onclick = "locationChecked();" value="OTON" class="style_input" checked="checked" style="position: absolute; top: 0px; left: 0px; display: block; width: 16px; height: 16px; padding: 0px; margin: 0px; background: rgb(255, 255, 255); z-index: 0; border: 0px; opacity: 1;"></span>
									<label for="inputtext14" class="mr35">지점문의</label>
									<span class="iradio_minimal" style="vertical-align: middle; display: inline-block; width: 18px; height: 18px; position: relative;" aria-checked="false" aria-disabled="false"><input type="radio" id="inputtext15" title="기타문의" name="oneOnOneCsType" onclick = "etcChecked();" value="OTOE" class="style_input" style="position: absolute; top: 0px; left: 0px; display: block; width: 16px; height: 16px; padding: 0px; margin: 0px; background: rgb(255, 255, 255); z-index: 0; border: 0px; opacity: 1;"></span>
									<label for="inputtext15">기타문의</label>
								</div>
								<div>
									<select name = "location1" class = "select1on1" id = "locationSelect" onchange = "optionChange()" style = "margin-left:60px;">
										<option id = "0">지역선택</option>
										<option id = "1">서울</option>
										<option id = "2">경기</option>
										<option id = "3">인천</option>
										<option id = "4">대전/충청/세종</option>
										<option id = "5">부산/대구/경상</option>
										<option id = "6">광주/전라</option>
										<option id = "7">강원</option>
										<option id = "8">제주</option>
									</select>
									<select name = "location2" class = "select1on1" id = "cinemaSelect">
										<option id = "0">영화관선택</option>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" id="th_1on1input_title">문의유형</th>
							<td headers="th_1on1input_title" colspan="3">
								<div>
									<select name = "question_type" id = "question_type" class = "select1on1">
										<option id = "0">문의유형 선택</option>
										<option id = "1">일반문의</option>
										<option id = "2">칭찬</option>
										<option id = "3">불만</option>
										<option id = "4">제안</option>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" id="th_1on1input_title">제목</th>
							<td headers="th_1on1input_title" colspan="3">
								<input type="text" title="제목" id="center-1on1-subject" name="title" style="width: 750px;" maxlength="30" fieldname="제목" required="">
							</td>
						</tr>
						<tr>
							<th scope="row" id="th_1on1input_content"><label for="center-1on1-content">내용</label></th>
							<td headers="th_1on1input_content" colspan="3">
								<textarea title="내용입력" id="center-1on1-content" name="content" cols="30" rows="10" onkeyup="checkWordLenth2(this, 2000, 'wordCheckCount');" fieldname="내용" required=""></textarea>
<!-- 								<p class = "text-sub mt7" id = "wordCheckCount">자</p> -->
							</td>
						</tr>
						<tr>
						<th scope="row" id="th_1on1input_content"><label for="center-1on1-content">파일첨부</label></th>
						<td headers="th_1on1input_content" colspan="3" class="moviePost_write">
							<button type="button" title="사진첨부" class="btn-m3" id="addOnePhotoArea">사진첨부</button>
							<ul class="mt10" id="onePhotoUl">
								<li id="onePhoto1" class="add" data-index="1" style = "margin-left:0px;">
									<a href="javascript:void(0);" class="btn_delete hide" title="이미지1 삭제" onclick="delteOneImage(this);"></a>
									<a href="javascript:void(0);" class="btn_write_thumb on hide" title="이미지1 선택"><img id="onePhotoImg1" src=""><em></em></a>
									<button type="button" class="icon_img btn_add" onclick="addOneImage(this);"><span class="blind"></span></button>
								</li>
								<li id="onePhoto2" class="add hide" data-index="2">
									<a href="javascript:void(0);" class="btn_delete hide" title="이미지2 삭제" onclick="delteOneImage(this);">이미지 삭제</a>
									<a href="javascript:void(0);" class="btn_write_thumb on hide" title="이미지2 선택"><img id="onePhotoImg2" src=""><em></em></a>
									<button type="button" class="icon_img btn_add hide" onclick="addOneImage(this);"><span class="blind">이미지 추가</span></button>
								</li>
								<li id="onePhoto3" class="add hide" data-index="3">
									<a href="javascript:void(0);" class="btn_delete hide" title="이미지3 삭제" onclick="delteOneImage(this);">이미지 삭제</a>
									<a href="javascript:void(0);" class="btn_write_thumb on hide" title="이미지3 선택"><img id="onePhotoImg3" src=""><em></em></a>
									<button type="button" class="icon_img btn_add hide" onclick="addOneImage(this);"><span class="blind">이미지 추가</span></button>
								</li>
								<li id="onePhoto4" class="add hide" data-index="4">
									<a href="javascript:void(0);" class="btn_delete hide" title="이미지4 삭제" onclick="delteOneImage(this);">이미지 삭제</a>
									<a href="javascript:void(0);" class="btn_write_thumb on hide" title="이미지4 선택"><img id="onePhotoImg4" src=""><em></em></a>
									<button type="button" class="icon_img btn_add hide" onclick="addOneImage(this);"><span class="blind">이미지 추가</span></button>
								</li>
								<li id="onePhoto5" class="add hide" data-index="5">
									<a href="javascript:void(0);" class="btn_delete hide" title="이미지5 삭제" onclick="delteOneImage(this);">이미지 삭제</a>
									<a href="javascript:void(0);" class="btn_write_thumb on hide" title="이미지5 선택"><img id="onePhotoImg5" src=""><em></em></a>
									<button type="button" class="icon_img btn_add hide" onclick="addOneImage(this);"><span class="blind">이미지 추가</span></button>
								</li>
							</ul>
							<input type="file" name = "file" style="display:none;" name="bug" id="onOneOnPhoto" value="Choose Photo" accept="image/png,image/jpeg">
							<input type="hidden" name="section" value="bug">
						</td>
						</tr>
					</tbody>
				</table>
				<div class = "text-center mt25 cu30">
					<button type = "submit" class = "submitButton" id = "gosub">등록</button>
				</div>
			</div>
		</form>
	</div><!-- center1on1_container-board(1대1문의 전체 div박스)의 끝 -->
</div> <!-- container-board width-fixed 의 끝 -->

	<script type="text/javascript">

			function optionChange(){
				
				var seoul = ["영화관선택", "강남", "강남대로", "강동", "군자", "동대문", "마곡", "목동", "상봉",
					"상암월드컵경기장", "센트럴", "송파파크하비오", "신촌",
					"은평", "이수", "창동", "코엑스", "화곡", "ARTNINE"];
				var gyoung_gi = ["영화관선택", "김포", "남양주", "동탄", "백석", "별내", "분당", "수원", "수원남문", "시흥배곧",
					"안산중앙", "양주", "영통", "의정부민락", "일산", "일산벨라시타", "킨텍스",
					"파주금폰", "파주운정", "파주출판도시", "평택", "하남스타필드"];
				var incheon = ["영화관선택", "검단", "송도", "인천논현", "청라"];
				var daejeon = ["영화관선택", "공주", "대전", "세종", "제천", "진천", "천안", "충주"];
				var gyoungsang = ["영화관선택", "거창", "경산하양", "경주", "구미", "김천", "덕천", "동대구", "문경",
					"부산극장", "부산대", "북대구(칠곡)", "사천", "양산", "울산",
					"창원", "해운대(장산)"];
				var jeonla = ["영화관선택", "광주상무", "광주하남", "남원", "목포", "목포하당(포르모)", "송천",
					"순천", "여수", "전대(광주)", "전주(객사)", "첨단"];
				var gangwon = ["영화관선택", "남춘천", "속초", "원주", "원주센트럴"];
				var jeju = ["영화관선택", "제주"];
				var nomal = ["영화관선택"];
				
				var selectItem = $("#locationSelect option:selected").val();
				
				 
				var changeItem = new Array();
				  
				if(selectItem == "서울"){
				  changeItem = seoul;
				}
				else if(selectItem == "경기"){
				  changeItem = gyoung_gi;
				}
				else if(selectItem == "인천"){
				  changeItem =  incheon;
				}
				else if(selectItem == "대전/충청/세종"){
					  changeItem = daejeon;
				}
				else if(selectItem == "부산/대구/경상"){
					  changeItem =  gyoungsang;
				}
				else if(selectItem == "광주/전라"){
					  changeItem =  jeonla;
				}
				else if(selectItem == "강원"){
					  changeItem =  gangwon;
				}
				else if(selectItem == "제주"){
					  changeItem =  jeju;
				}else {
					changeItem = nomal;
				}
				 
				$('#cinemaSelect').empty();
				
				for(var count = 0; count < changeItem.length; count++){                
				                var option = $("<option>"+changeItem[count]+"</option>");
				                $('#cinemaSelect').append(option);
				}
				
			}
			
	</script>
	
	<script type="text/javascript">
		
		var location_type = document.getElementById("inputtext14");
		var location_etcType = document.getElementById("inputtext15");
		var locationSelect = document.getElementById("locationSelect"); // 지역 선택 select태
		var cinemaSelect = document.getElementById("cinemaSelect"); // 영화관 지점 선택 select태그
		// 문의지점에서 지점문의 선택시
		function locationChecked(){
			locationSelect.removeAttribute("disabled");
			cinemaSelect.removeAttribute("disabled");	
		}
		
		
		// 문의지점에서 기타문의 선택시
		function etcChecked(){
			locationSelect.setAttribute("disabled", true);
			cinemaSelect.setAttribute("disabled", true);
			$("#locationSelect").val("지역선택").attr("selected", "selected");
			$('#cinemaSelect').empty();
			$('#cinemaSelect').append($("<option>영화관선택</option>"));
		}
	
	</script>
	
	<script type="text/javascript">
		
		function addOneImage(thisimg){
			
			$("#onOneOnPhoto").click();
			
			
			
			$("#onOneOnPhoto").change(function(e){
				e.preventDefault();
				
				var file = document.getElementById("onOneOnPhoto").files
				var reader = new FileReader();
				reader.readAsDataURL(file [0]);
				reader.onload = function() {
					
					$(thisimg).prev().find("img").attr("src", reader.result);
					$(thisimg).addClass("hide"); // 이미지 추가버튼 숨기
					$(thisimg).prev().removeClass("hide"); // 추가한 이미지 표시하기
					$(thisimg).prev().prev().removeClass("hide"); // 이미지 삭제버튼 표시하기
					return false;
				}
				
			});
		}
		
		function delteOneImage(delimg) {
			$(delimg).addClass("hide");
			$(delimg).next().children("img").attr("src", "");
			$(delimg).next().next().removeClass("hide");
			$(delimg).next().addClass("hide");
			$("#onOneOnPhoto").val("");
		}
		
		$("#addOnePhotoArea").click(function(event) {
			$("onePhotoUl > li").each(function(index){
				if($(this).hasClass("hide")) {
					$(this).find("button").removeClass("hide");
					$(this).removeClass("hide");
					return false;
				}
				
			});
			
		});
		
	
	</script>
	
	<script type="text/javascript">
	
	function formCheck() {
		var agree = document.getElementById("agreement1"); // 약관 동의 radio태그
		var question_type = document.getElementById("question_type"); // 문의유형 radio태그
		var locationSelect = document.getElementById("locationSelect"); // 지역 선택 select태
		var cinemaSelect = document.getElementById("cinemaSelect"); // 영화관 지점 선택 select태그
		var location_type = document.getElementById("inputtext14"); // 문의지점 (지역선택) 선택
		var location_etcType = document.getElementById("inputtext15"); // 문의지점 (기타문의) 선택
		
		if(agree.checked != true) {
			alert("약관에 동의해야 서비스이용이 가능합니다.");
			agree.focus();
			return false;
		}
		if(location_type.checked == true){
			if (locationSelect.value == "지역선택") {
				alert("문의할 지역을 선택하셔야합니다.");
				locationSelect.focus();
				return false;
			}else if(cinemaSelect.value == "영화관선택"){
				alert("문의할 영화관을 선택하셔야합니다.");
				cinemaSelect.focus();
				return false;
			}
		}
		if(question_type.value == "문의유형 선택"){
			alert("문의유형을 선택하셔야합니다.");
			question_type.focus();
			return false;
		}
		
		
	}
	
	</script>

</body>
</html>