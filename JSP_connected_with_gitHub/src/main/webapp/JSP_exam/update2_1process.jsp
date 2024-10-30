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

<%@ include file = "dbconn.jsp" %>

<%
		String id = (String) request.getAttribute("id");
		String password = (String) request.getAttribute("pw");
		String name = (String) request.getAttribute("name");

		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try
		{
			String sql = "SELECT id, pw FROM member WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				String rId = rs.getString("id");
				String rPw = rs.getString("pw");
				
				if(id==rId && pw==rPw)
				{
					sql = "UPDATE member SET name=? WHERE id =?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, name);
					pstmt.setString(2, id);
					pstmt.executeUpdate();
					out.println("member 테이블을 수정했습니다.");
				}
				else
				{
					out.println("일치하는 비밀번호가 아닙니다.");
				}
			}
			else
			{
				out.println("member 테이블에 일치하는 아이디가 없습니다.");
			}
		}
		catch(Exception e)
		{
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

</body>
</html>