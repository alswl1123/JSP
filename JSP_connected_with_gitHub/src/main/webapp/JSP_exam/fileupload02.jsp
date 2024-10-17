<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload</title>
</head>
<body>
<form name = "fileForm" method = "post" enctype = "multipart/form-data" action = "JSP_exam/fileupload02_process.jsp">
	<p>	이름 1 : <input type ="text" name = "name1">
		제목 1 : <input type ="text" name = "subject1">
		파일명 1 : <input type ="file" name = "filename1">
	<p>	이름 2 : <input type ="text" name = "name2">
		제목 2 : <input type ="text" name = "subject2">
		파일명 2 : <input type ="file" name = "filename2">
	<p>	이름 3 : <input type ="text" name = "name3">
		제목 3 : <input type ="text" name = "subject3">
		파일명 3 : <input type ="file" name = "filename3">
	<p><input type="submit" value = "파일 올리기">
</form>

</body>
</html>