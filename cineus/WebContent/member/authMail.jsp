<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이메일 인증 페이지</title>

	<style type="text/css">
		#reg_form {
			box-shadow: none;
			margin-top: 20px;
		}
	</style>
	
<%
	request.setCharacterEncoding("utf-8");
	String to = request.getParameter("to");
	
 	MemberDAO memberDAO = new MemberDAO();
 	String authNum = memberDAO.randomNum();
 	
 	int check = memberDAO.sendEmail(to, authNum);
	
	if(check == 1){
%>
		<script type="text/javascript">
			alert("인증 메일을 발송했습니다");
		</script>
<%
	}else {
%>
		<script type="text/javascript">
			alert("인증 메일 발송을 실패했습니다. 메일 주소를 다시 확인해주세요");
			window.close();
		</script>
<%		
	}
%>

	<script type="text/javascript">
		function check() {
			var code = document.getElementById("code").value;
			var authNum = <%=authNum %>;
			
			if (!code) {
				alert("인증번호를 입력하세요.");
				return false;
			}
			
			if (authNum == code) {
				alert("인증이 완료되었습니다.");
				opener.emailCheck2.outerHTML;
				opener.emailhidden.value = opener.useremail.value;
				opener.parent.emailCheck();
				window.close();

			}else {
				alert("인증번호가 틀립니다. 다시 입력해주세요");
				return false;
			}
		}//check()메서드 끝
	
	</script>

</head>
<body>

	<form id="reg_form" onsubmit="return check();">
		<label for="code">인증번호</label>
		<input type="text" name="code" id="code" class="textWithBtn">
		<input type="submit" class="btn" value="확인">
	</form>

</body>
</html>