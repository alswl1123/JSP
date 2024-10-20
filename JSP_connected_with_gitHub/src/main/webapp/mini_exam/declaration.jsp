<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>p.83</title>
</head>
<body>
<%! 

	String hello = "Hello, Java Server Pages";

	String getString(String hello) {
		return hello;
	}
%>

<%= hello %>

	


</body>
</html>