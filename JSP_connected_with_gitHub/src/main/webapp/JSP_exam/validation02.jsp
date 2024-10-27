<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>
</head>
<script type = "text/javascript">
	function checkLogin()
	{
		var form = document.loginForm;
		if(form.id.value == "")
		{
			alert("아이디를 입력해주세요.");
			form.id.focus();
			return false; //form.submit()을 중지시킴
		}
		else if (form.pw.value == "") //== "" 이거 안 적으면 submit 안 됨
		{
			alert("비밀번호를 입력해주세요.");
			form.pw.focus();
			return false; //form.submit()을 중지시킴
		}
		form.submit();
	}
</script>
<body>
<form name = "loginForm" action = "8_2" method = "post">
	<p>아이디 : <input type = "text" name = "id">
	<p>비밀번호 : <input type = "password" name = "pw">
	<p><input type = "button" value = "전송" onclick = "checkLogin()">
</form>

</body>
</html>