<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="context" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<link rel="stylesheet" href="${context}/css/demo.css">
<link rel="stylesheet" href="${context}/css/navigation-icons.css">
<link rel="stylesheet" href="${context}/css/slicknav/slicknav.min.css">
<link href="${context}/css/fa_2_2.css" rel="stylesheet">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

<style>
.center-home {list-style:none;margin:0 auto;padding:0;width:970px;height:28px;font-weight:bold;}
.center-home-div {background-color:#f2f2f2;border-top:1px solid #e1e1e1; margin-top:105px;}
.center-text {color:#1f0da8; margin-top: 8px;}
.center-home-line {height:3px;background-color:#1f0da8; margin-top: 8px;}
</style>

<!-- ����� ���� �� -->
	<jsp:include page="/inc/header.jsp"/>
	<!-- ����� ���� �� -->
    <!-- </head>
		 <body> -->
<div class="center-home-div">
	<ul class="container center-home">
		<h5 class="center-text font-weight-bold">���� �ó׾</h5>
	</ul>
	<hr class="center-home-line">
</div>
<br><br>
<!-- ���������� �޴� -->
<jsp:include page="/intro/myMenu.jsp"/>
	<!-- vip zone -->
	<div class="section no7 vipzone" id="fa_2" style="margin-left: 520px; margin-top: 100px;">
		<div class="w1">
		 	<h2 style="color:#1f0da8">VIP ZONE</h2>
			 <div class="div_wrap">
			 	<div class="active" id="tab1" style="margin-left: 100px;">
			 		<a href="${context}/members/fa_2_1.me" title="2019�� VIP ȸ���ȳ� ����">2019�� VIP ȸ���ȳ�</a>
			 	</div>
			 	<div id="tab2">
			 		<a href="${context}/members/fa_2_2.me" title="2019�� VIP ���üҰ� ����">2019�� ���üҰ�</a>
			 	</div>
			 </div>
		</div> 
		 <div>
		 	<h3 class="large mb0">2019�� VIP ���� �Ұ�</h3>
		 	<div id="tab" class="tab-pane active">
		 		<h5>����� ����</h5>
		 		<table class="icon_list bx" style="list-style:none;">
		 			<div class="mb20">
		 				"�ó׾ ����� ������ �̿��Ͽ� ��ȭ ���� �� ������ ���� �� �ֽ��ϴ�."
		 				<p class="help">2019�� ����� ������ 2018�� ��ȭ ���� Ƚ���� ���� ����� ���� �Ǹ� ��޿� ���� �������� �޶����ϴ�.</p>
		 				<p class="help">����� ���� ������ �α��� �� �� �������� Ȯ�� �Ͻ� �� �ֽ��ϴ�</p>
		 				<p class="help">����� ������ ��������� ����� �Ұ��մϴ�.</p>
		 			</div>
		 			<div style="padding:0;background: none">
		 				<div class="data_table border caption2 mt10" style="width: 100%; border: 1px solid #444444; border-collapse: collapse;">
		 					<caption class="blind">���, �ǹ�, ���, ���̾Ƹ���� ��ȭ ���� ���� ����</caption>
		 					<colgroup>
		 						<col width = "5%">
		 						<col width = "22%">
		 						<col width = "22%">
		 						<col width = "22%">
		 						<col width = "22%">
		 					</colgroup>
		 					<thead>
		 						<tr class="fz15" style="border: 1px solid #444444;">
		 							<th scope="col" id="vip_goob" style="border: 1px solid #444444;">���</th>
		 							<th class="th_border" scope="col" id="vip_a" style="border: 1px solid #444444;">�Ϲ�</th>
		 							<th class="th_border" scope="col" id="vip_b" style="border: 1px solid #444444;">�ǹ�</th>
		 							<th class="th_border" scope="col" id="vip_c" style="border: 1px solid #444444;">���</th>
		 							<th class="th_border" scope="col" id="vip_d" style="border: 1px solid #444444;">���̾߸��</th>
		 						</tr>
		 					</thead>
		 					<tbody>
		 						<tr style="border: 1px solid #444444;">
		 							<th scope="row" id="vip_movie">
		 								<strong>
		 									��ȭ
		 									����
		 								</strong>
		 								
		 								<td headers="vip_movie vip_a vip" style="border: 1px solid #444444;">
		 									<a>
		 										�Ϲ� ��� ����
		 									</a>
		 										<br>
		 									<a>
		 										���� ����
		 									</a>
		 								</td>
		 								
		 								<td headers="vip_movie vip_b vip" style="border: 1px solid #444444;">
		 									<a>
		 										�ǹ� ��� ����
		 									</a>
		 										<br>
		 									<a>
		 											10% ����
		 									</a>
		 								</td>
		 								<td headers="vip_movie vip_c vip_premium" style="border: 1px solid #444444;">
		 									<a>
		 										��� ��� ����
		 									</a>
		 										<br>
		 									<a>
		 										20% ����
		 									</a>
		 								</td>
		 								<td headers="vip_movie vip_d vvip" style="border: 1px solid #444444;">
		 									<a>
		 										���̾� ��� ����
		 									</a>
		 										<br>
		 									<a>
		 										30% ����
		 									</a>
		 								</td>
		 						</tr>
		 					</tbody>
		 				</div>
		 				
		 			</div>
		 		</table>
		 	</div>
		 	</div> <!-- t2 �� -->
		</div>
	<!-- ���� ���� �� -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- ���� ���� �� -->	
</body>
</html>