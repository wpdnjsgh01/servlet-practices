<%@ page import = 'java.sql.*' %>
<%@ page import = 'java.util.*' %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>

	<form action="insertPage.jsp" method="post">
		<table border=1 width=500>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" id="name"></td>
				<td>비밀번호</td>
				<td><input type="password" name="password" id="password"></td>
			</tr>
			<tr>
				<td colspan=4><textarea name="message" id="message" cols=60 rows=5></textarea></td>
			</tr>
			<tr>
				<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
			</tr>
		</table>
	</form>
	
	<br>
	
	<%
      // 1. JDBC 드라이버 로딩
	  Class.forName("org.mariadb.jdbc.Driver");
  
      Connection conn = null; // DBMS와 Java연결객체
      Statement stmt = null; // SQL구문을 실행
      ResultSet rs = null; // SQL구문의 실행결과를 저장
  
      try
      {
    	  
    	  	String url = "jdbc:mysql://127.0.0.1:3306/webdb?charset=utf8";
   
            String query = "select no, name, password, message, reg_date from guestbook order by no desc";
   
            // 2. 데이터베이스 커넥션 생성
            conn = DriverManager.getConnection(url, "webdb", "webdb");
   
            // 3. Statement 생성
            stmt = conn.createStatement();
   
            // 4. 쿼리 실행
            rs = stmt.executeQuery(query);
   
            // 5. 쿼리 실행 결과 출력
            while(rs.next())
            {
            	
	%>
	
	<table width=510 border=1>
		<tr>
			<td>[<%=rs.getInt("no") %>]</td>
			<td><%=rs.getString("name") %></td>
			<td><%=rs.getDate("reg_date") %></td>
			<td><a href="deleteform.jsp?no=<%=rs.getInt("no") %>">삭제</a></td>
		</tr>
		<tr>
			<td colspan=4><%=rs.getString("message") %></td>
		</tr>
	</table>
	
	<%
            }
      }catch(SQLException ex){
            out.println(ex.getMessage());
            ex.printStackTrace();
      }finally{
   
      }
	%>
	
</body>
</html>