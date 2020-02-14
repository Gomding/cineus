<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="context" value="${pageContext.request.contextPath}" />

<html lang="ko">

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  
  <style>
  ._box{
  	padding-top:10px;
  	padding-bottom:10px;
  	color:gray;
  }
  ._box:hover{
  	color:black;
  	border:1px solid gray;
  	cursor:pointer;
  	
  }
  .container{
  	max-width:1100px;
  }
  textarea{
  display:inline-block;
  vertical-align:top;
  background-color:#ececec;
  width:100%;
	}
	#m_list{
	}
	.form-check-input{
		margin-left: 10px;
	}
  </style>
<title>문자 메세지 보내기</title>
</head>
<body>

<!-- 공통 -->
	<div class="container mt-4" style="font-size:16px;">
	<a href="${context}/index.home"><img src="${context}/images/logo_s.png"></a>
	 	<h5>관리자메뉴</h5>
	 	
	 	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		 	<div class="collapse navbar-collapse" id="navbarText">
			 	<ul class="navbar-nav mr-auto">
			 		<li class="nav-item active"><a  class="nav-link"  href="${context}/views/admin/admin.jsp">문자발송</a></li>
			 		<li class="nav-item"><a class="nav-link" >회원관리</a></li>
			 		<li class="nav-item"><a class="nav-link"  href="${context}/views/admin/admin_schedule.jsp">영화시간표</a></li>
			 		<li class="nav-item"><a class="nav-link" >영화스케쥴등록</a></li>
			 	</ul>
		 	</div>
	 	</nav>
	 </div>
	 <!-- 공통 -->

<div class="container mt-4" >
	<div class="row ml-1">
		<h5>문자 발송</h5>
	</div>
	<div class="row mt-2">
		<div class="col col-3">
			<textarea rows="10" id="message" placeholder="이곳에 메세지를 입력해주세요." required></textarea>
			<button class="btn btn-dark btn-block" id="text_reset">다시쓰기</button>
			<button class="btn btn-danger btn-block submit mt-0" id="text_submit">문자 발송하기</button>
		</div>
		<div class="col col-9">
			<div class="radio">
				<label><input type="radio" name="optradio" id="radioAll" checked>회원전체</label>
			</div>
			<div class="radio">
				<label><input type="radio" name="optradio" id="radioPart">회원선택</label>
			</div>
			<div id="m_list">
				<table class="table table-sm" id="list_table">
					<thead>
					    <tr>
					      <th>선택</th>
					      <th>#</th>
					      <th>아이디</th>
					      <th>이름</th>
					      <th>전화번호</th>
					    </tr>
				    </thead>
				    <c:if test="${empty list}">
				    	<tr>
				    		<td colspan="4">회원이 없습니다.</td>
				    	</tr>
				    </c:if>
					<c:forEach var="l" items="${list}" varStatus="status">
						<tr>
							<td><input type="checkbox" class="form-check-input" id="i_checkbox_${status.count}"></td>
							<td>${status.count}</td>
							<td>${l.customer_ID}</td>
							<td>${l.customer_name}</td>
							<td>0${l.customer_tel}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>
<br>
<div class="container mt-3" id="_option">
	<hr>
	<div class="row">
		<div class="col col-3 _box">
				 *(..)- (..)
 [☞☜][☞☜]
_(_/_/)(=)(=)_
 세배 받으시고,
행복한2월되세요!
		</div>
		<div class="col col-3 _box">
		[이벤트] [미스터 주: 사라진 VIP] 1+1 관람권 판매중
		</div>
		<div class="col col-3 _box">
		[이벤트] 신규가입시 10000포인트!!! 공짜영화 보세요!
		</div>
		<div class="col col-3 _box">
		[이벤트] 오픈기념 이벤트!! 홈페이지에서 확인하세요!!
		</div>
	</div>
	<div class="row">
		<div class="col col-3 _box">
		[무료시사회] 많은 참석바랍니다.
		</div>
		<div class="col col-3 _box">
		[이벤트] 상세내용은 홈페이지 http://씨네어스 에서 확인하세요.
		</div>
		<div class="col col-3 _box">
		즐거운 주말입니다. 
좋은 에너지 충전하시고 다음주도 파이팅 하세요.
여유로운 주말 되세요~
		</div>
		<div class="col col-3 _box">
		*''o☆♡☆o''*.
* 해피발렌타인*
☆ 행복한하루☆
보내세요(^~^)/
*..o☆♡☆o..*
		</div>
	</div>
</div>
<br><br><br><br><br><br>


<script>
	function reset(){
		$("#message").val("");
		$("input").prop("checked",false);
		$("#radioAll").prop("checked",true);
	}
	
	$("._box").on("click",function(){
		$("#message").val($(this).text().trim());
	});
	
	$("#text_reset").on("click",function(){
		$("#message").val("");
	});
	
	$("#text_submit").on("click",function(){
		if($("#message").val().trim()==""){
			alert("문자를 입력하세요.");
			return;
		}
		if("${list.size()}"==0){
			return;
		}
		if($("#radioAll").prop("checked")==true){
			//모두에게 문자를 보낸다.
			//do something
			if (confirm("${list.size()}명에게 문자를 전송하시겠습니까?")) {
			    let myMap = new Map();
			    // setting the values
			    for(var i=0; i<"${list.size()}" ; i++){
			    	$el=$("#list_table tr").eq(i+1).children(); //td s .......th제외
			    	myMap.set($el.eq(4).text(), $el.eq(3).text());
			    }
			    myMap.set("message",$("#message").val());
			    //ajax
			    $.ajax({
					  url:'${context}/CineusMessage/SendGroupMsgAjax.do',
					  type:'post',
						data: {data: JSON.stringify(myMap)},
						error:function(jqXHR, textStatus, errorThrown){
							alert("오류발생 : 다시 시도하세요.");
						},
					 	 success: function(data){
					 		 alert("문자발송 성공");
					 	}
				});
			    
			} else {
				alert("문자발송 취소됨"); //사용자가 취소
			}
		}
		else{
			//일부에게 문자를 보낸다
			if($("input:checked").length<=1){
				alert("한 명 이상 연락처를 선택하세요.");
				return;
			}
			else{
				//do something
				//
				if (confirm($("input:checked").length-1+"명에게 문자를 전송하시겠습니까?")) {
					alert("문자발송 완료");
					reset();
				} else {
				  alert("문자발송 취소됨");
				}
			}
		}
	});
</script>

</body>
</html>