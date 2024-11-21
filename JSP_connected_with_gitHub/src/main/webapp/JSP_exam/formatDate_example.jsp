<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>Internationalization</title>
</head>
<body>
	<jsp:useBean id="now" class="java.util.Date" />
	<p> date 형식 : <fmt:formatDate value="${now}" type="date" />
	<p> time 형식 : <fmt:formatDate value="${now}" type="time" />
	<p> both 형식 : <fmt:formatDate value="${now}" type="both" />
</body>
</html>