<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>Internationalization</title>
</head>
<body>
	<p> <fmt:parseDate value="20241122123456" pattern="yyyyMMddHHmmss" />
	<p> <fmt:parseDate pattern="yyyyMMddHHmmss"> 20241122123456 </fmt:parseDate>
	<p> <fmt:parseDate value="20241122123456" pattern="yyyyMMddHHmmss" var="date" scope="page" />
	<p> <fmt:formatDate value="${date}" pattern="yyyy-MM-dd HH:mm" />
</body>
</html>