<%@ page import="db.MemberDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDao dao = new MemberDao();
		String name = dao.isMember(id, pw);
		
		
		if(name != null)
		{ 
			session.setAttribute("member", "ok");
			System.out.println(name);
			%>
			<jsp:forward page="index.jsp">
				<jsp:param value="<%=name%>" name="name"/>
			</jsp:forward>
			<%		
		}
		else
		{
			response.sendRedirect("login.jsp");	
		}
	%>
</body>
</html>