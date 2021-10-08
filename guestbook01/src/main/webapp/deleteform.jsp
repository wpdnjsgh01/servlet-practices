<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<% String no = request.getParameter("no"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>

	<form method="post" action="deletePage.jsp">
		<input type='hidden' name="no" value="<%=no%>">
		<input type='password' name="password" value="">
		<input type='submit' value="확인">
	</form>

	<a href="index.jsp">돌아가기</a>
	
</body>
</html>