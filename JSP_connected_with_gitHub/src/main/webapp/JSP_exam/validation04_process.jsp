<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>
</head>
<body>
<h3>입력에 성공했습니다.</h3>

<%
   String id = (String) request.getAttribute("id");
   String passwd = (String) request.getAttribute("passwd");
%>

<p>아이디 : <%= id %>
<p>비밀번호 : <%= passwd %>

</body>
</html>