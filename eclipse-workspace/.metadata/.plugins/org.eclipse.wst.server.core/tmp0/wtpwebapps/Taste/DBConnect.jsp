<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	Class.forName("oracle.jdbc.driver.OracleDriver"); 
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "2134");
	String sql = "select * from test"; 
	pstmt = conn.prepareStatement(sql); 
	rs = pstmt.executeQuery(); 
	
%>