<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Internationalization</title>
</head>
<body>
<fmt:setLocale value="ko"/> <!-- 이 부분 없으면 시스템 설정(UTF-8)을 따르는 것 같다. -->
<fmt:setBundle var = "message" basename="resourceBundle.message" />
	<p><fmt:message bundle = "${message}" key = "name" />
		<fmt:message bundle = "${message}" key = "hello" var = "msg" />
	<p>${msg}
</body>
</html>