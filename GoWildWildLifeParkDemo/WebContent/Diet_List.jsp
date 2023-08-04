<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.util.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "java.util.ArrayList" %>
    <%@ page import = "com.csm.dao.DietManage" %>
    <%@ page import = "com.csm.entity.Diet" %>
    <%@ page import = "com.csm.DBManager" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Diet Lists</title>
</head>

<style>
body{
background-image:url(bgcc1.jpg);
background-repeat:no-repeat;
background-size:cover;}

table,td,th{
border:2px solid black;}

table{
border-collapse: collapse;
width: 80%;
}

th{
height:40px;}

td {
height: 30px;
}

#home{
border: 2px solid;
border-radius: 10px;
padding: 20px;
text-decoration:none;
color: #005580;
background-color:#8a8a5c;
margin-left:1400px;}

#home:hover{
color: #ff8080;}

</style>

<body>

<center><h1>Diet Lists</h1></center>

<a href="main.jsp" id="home">Home</a>

<%
	try{
		DBManager dbMgr = new DBManager();
		dbMgr.getConnection();
		
		DietManage eMgr = new DietManage();
		ArrayList<Diet> diets = eMgr.fetchAll();
		
%>

	<center>
	
	<table border="1">
	<tr>
		<th>Diet ID</th>
		<th>Diet Type</th>
		<th>Number of feed per day</th> 
		<th>Delete Diet<th>
	</tr>
<%
	for (Diet diet :diets){
%>

	<tr>
	<td><%=diet.getDietID() %></td>
	<td><%=diet.getDiet_Type() %></td>
	<td><%=diet.getNo_of_feed() %></td>
	<td><a href="Diet_Delete.jsp?DietID=<%= diet.getDietID() %>">Delete</a></td>
	</tr>

<%
	}
%>

	</table></center>

<%
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	}catch(SQLException e){
		e.printStackTrace();
	}
%>


</body>
</html>