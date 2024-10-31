<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.Member" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session example</title>
</head>
<body>
<%
	session = request.getSession(false); //처음에 true 로 만들었으면 이후에는 false
	Member mb = (Member)session.getAttribute("member");
	
	String name = mb.getName();
	out.println("<h2 class = 'alert alert-danger'>" + name + "님 환영합니다.</h2>");
	%>
	<!-- 이런 식으로 세션을 작성할 수 있다. -->

</body>
</html>