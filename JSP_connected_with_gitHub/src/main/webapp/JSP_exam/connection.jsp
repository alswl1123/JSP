<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database SQL</title>
</head>
<body>
	<%
		Connection conn = null;
		try
		{
			String url = "jdbc:mysql://localhost:3306/jspbookdb";
			String user = "root";
			String pw = "1234";
		
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pw);
			out.println("데이터베이스 연결 성공");
		}
		catch (Exception e)
		{
			out.println("데이터베이스 연결 실패<br>");
			out.println("SQL Exception : " + e.getMessage());
		}
		finally
		{
			if(conn!=null)
				conn.close();
		}
	
	%>

</body>
</html>