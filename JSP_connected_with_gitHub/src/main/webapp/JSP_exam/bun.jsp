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
<fmt:setLocale value="en"/>
<fmt:bundle basename="resourceBundle.message">
	<p><fmt:message key = "name" />
 		<fmt:message key = "hello" var= "msg" />
	<p>${msg}
</fmt:bundle>

<fmt:setLocale value="ko"/>
<fmt:bundle basename="resourceBundle.message">
	<p><fmt:message key = "name" />
 		<fmt:message key = "hello" var= "msg" />
	<p>${msg}
</fmt:bundle>

</body>
</html>