<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload</title>
</head>
<body>

<%
	String nm = (String)request.getAttribute("name");
	String sj = (String)request.getAttribute("subject");
	String fn = (String)request.getAttribute("file");

%>


<p>이름 : <%= nm %>
<p>제목 : <%= sj %>
<p>파일 : <%= fn %><br>
<img src = "img/<%=fn %>">

</body>
</html>