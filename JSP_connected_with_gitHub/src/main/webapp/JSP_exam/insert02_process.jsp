<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INSERT</title>
</head>
<body>
	<%@ include file = "dbconn.jsp" %>
	<%
		String id = (String) request.getAttribute("id");
		String password = (String) request.getAttribute("pwd");
		String name = (String) request.getAttribute("name");
		
		PreparedStatement pstmt = null;
		
		try
		{
			String sql = "INSERT INTO member(id, pw, name) VALUES (?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			pstmt.setString(3, name);
			pstmt.executeUpdate();
			out.println("member 테이블 삽입이 성공했습니다.");
		}
		catch(Exception e)
		{
			out.println("member 테이블 삽입이 실패했습니다.<br>");
			out.println("SQL Exception : " + e.getMessage());
		}
		finally
		{
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
		}
	
	%>
	
	

</body>
</html>