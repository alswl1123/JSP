<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
?<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SELECT</title>
</head>
<body>
	<%@ include file = "dbconn.jsp" %>
	<table width = "300" border = "1">
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
		
	<%
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		
		try
		{
			String sql = "SELECT * FROM member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				String id = rs.getString("id");
				String password = rs.getString("pw");
				String name = rs.getString("name");
		
		%>
			<tr>
				<td><%= id %></td>
				<td><%= password %></td>
				<td><%= name %></td>
			</tr>
		
		<%	
			}
		}
		catch(Exception e)
		{
			out.println("member 테이블 호출 실패(<br>)");
			out.println("SQL Exception : " + e.getMessage());
		}
		finally
		{
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		}	
	%>
	</table>

</body>
</html>