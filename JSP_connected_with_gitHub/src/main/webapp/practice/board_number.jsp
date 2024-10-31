<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
         <%
            for(int i = 1; i < total_page; i++)
            {
               %>
               <a href="./BoardListAction.do?pageNum=${i}" />
               <%if(pageNum==i) {%>
               <font color='4C5317'><b>[${i}]</b></font>
               <%}else{ %>
               <font color='4C5317'>[${i}]</font>
               <%} %>
            <%} %>
            
        <%
         	for(int i = 1; i < total_page; i++)
         	{
        %>
         		<a href = "BoardListAction?pageNum=${i}" />
        <% 		if(pageNum==i)
        		{
        %> 
        			<font color = '4C5317'><b>[${i}]</b></font>
        <%		 
        		}
        		else
				{
     	%>		
        			<font color = '4C5317'>[${i}]</font>
		<%      }
         	}
     	%>

</body>
</html>