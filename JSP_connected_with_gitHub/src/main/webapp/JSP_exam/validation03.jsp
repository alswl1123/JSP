<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>
</head>
<script type="text/javascript">
function checkLogin() {
	var form = document.loginForm;
	var idLen = document.querySelector("#id").value.length;
	var pwLen = document.querySelector("#pw").value.length;
	
	if (idLen < 4 || idLen > 12) {
		alert("아이디는 4~12자 이내로 입력 가능합니다!");
		form.id.select();
		return;
	}
	
	if(pwLen < 4) {
		alert("비밀번호는 4자 이상으로 입력해야 합니다!");
		form.pw.select();
		return;
	}
	
	if(!isNaN(document.loginForm.name.value.substr(0, 1))) {
		alert("이름은 숫자로 시작할 수 없습니다!");
		document.loginForm.name.select();
	}
	
	else {
	form.submit();	
	}
}

</script>

<body>
<form name = "loginForm" action = "8_3" method = "post">
<p>이름 : <input type = "text" name = "name">
<p>아이디 : <input type = "text" name = "id" id = "id">
<p>비밀번호 : <input type = "password" name = "pw" id = "pw">
<p><input type = "button" value = "전송" onclick = "checkLogin()">
</form>


</body>
</html>