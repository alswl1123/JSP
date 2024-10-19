<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");
	String name = (String) request.getParameter("name");
	String id = (String) request.getParameter("id");
	String pw = (String) request.getParameter("pw");

%>

<h3>입력에 성공했습니다.</h3>
<p>이름 : <%= name %> 
<p>아이디 : <%= id %>
<p>비밀번호 : <%= pw %>

</body>
</html>