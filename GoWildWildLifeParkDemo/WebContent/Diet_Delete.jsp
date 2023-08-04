<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.util.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "com.csm.DBManager "%>
    <%@ page import = "com.csm.dao.DietManage" %>
    <%@ page import = "com.csm.entity.Diet" %>
    
    <%@ include file="Diet_List.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	String dietid = request.getParameter("DietID");

	DietManage dao = new DietManage();
	int rowAffected;
	try {
		rowAffected = dao.delete(Integer.parseInt(dietid));
		out.println ("<h2>The data has been deleted</h2> " );
		
	}catch (ClassNotFoundException ex){
		out.println(ex.getMessage());
	}catch (SQLException e){
		out.println(e.getMessage());
	}

%>

</body>
</html>