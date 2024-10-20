<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.lang.Math" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>p.117</title>
</head>
<body>
<% double result = Math.pow(5, 2); %>

<p> 현재 날짜 : <%= new Date() %>
<p> 5의 제곱 : <%= result %>

</body>
</html>