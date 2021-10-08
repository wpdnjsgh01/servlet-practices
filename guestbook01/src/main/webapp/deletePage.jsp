<%@ page import="java.sql.*" %>
<%@ page import="vo.VO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	request.setCharacterEncoding("utf-8");
	Connection conn = null;
	boolean result = false;
	PreparedStatement pstmt = null;
	
	String password = request.getParameter("password");
	String no = request.getParameter("no");
	
	try {
		
		Class.forName("org.mariadb.jdbc.Driver");
		
		String url = "jdbc:mysql://127.0.0.1:3306/webdb?charset=utf8";
		conn = DriverManager.getConnection(url, "webdb", "webdb");
		
		//SQL 준비
		String str = "delete from guestbook where password = ? and no = ?";
		pstmt = conn.prepareStatement(str);
		
		//바인딩 (binding)
		pstmt.setString(1, password);
		pstmt.setString(2, no);
		
		//5. SQL 실행
		int count = pstmt.executeUpdate();
		
		result = count == 1;
		
		response.sendRedirect("index.jsp");

	} catch (SQLException e) {
		System.out.println("error:" + e);
	} finally {
		try {
			if (pstmt != null) {
				pstmt.close();
			}
			if ( conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
%>