<%@ page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String message = request.getParameter("message");
	
	Connection conn = null;
	
	try{
		
		System.out.println("insertPage try 진입");
				
		Class.forName("org.mariadb.jdbc.Driver");
		
		String url = "jdbc:mysql://127.0.0.1:3306/webdb?charset=utf8";
		conn = DriverManager.getConnection(url, "webdb", "webdb");
		
		System.out.println("db 진입");		
				
		String str = "insert into guestbook values (null, ?, ?, ?, now())";
		
		if(name != null || password != null){
			PreparedStatement psmt = conn.prepareStatement(str);
			psmt.setString(1, name);
			psmt.setString(2, password);
			psmt.setString(3, message);
			
			psmt.executeQuery();
			psmt.close();
			conn.close();
		
			response.sendRedirect("index.jsp");
			
			
		} else{
			System.out.println("이름, 비밀번호, 내용을 입력하시오");
		}
		
		
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

%>