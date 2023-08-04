<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.csm.dao.DietManage" %>
<%@ page import="com.csm.entity.Diet" %>
<%@ page import="com.csm.DBManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Diet Process Data</title>
</head>
<body>
<%
try
{
	String dt = request.getParameter("type");
	int df = Integer.parseInt(request.getParameter("feed"));
	
	//calling DBManager 
	DBManager dbMgr = new DBManager();
	
	//using object calling jdbc getconnection
	dbMgr.getConnection();
	
	//two parameter passing 
	Diet c = new Diet(dt, df);
	
	//calling DietManage
	DietManage eMag = new DietManage();
	int affect = -1;
	
	//calling dao 
	affect = eMag.insert(c);
	
	if(affect == 1) {
		out.println("Successfully Inserted.");
%>
<script>
    // JavaScript alert box to display the success message
    alert("Diet entry successfully inserted!");
</script>
<%
	}
} catch (ClassNotFoundException e) {
    e.printStackTrace();
} catch (SQLException e) {
    e.printStackTrace();
}
%>
</body>
</html>
