<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.csm.DBManager" %>
<%@ page import="com.csm.dao.KeeperManage" %>
<%@ page import="com.csm.entity.Keeper" %>
<%@ page import="com.csm.IncorrectDataTypeException" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Keepers Process Data</title>
</head>
<body>
    <%
    try {
        String keeperName = request.getParameter("keeper_name");
        String dateOfBirthStr = request.getParameter("date_of_birth");
        String rank = request.getParameter("rank");

        // Calling DBManager
        DBManager dbMgr = new DBManager();

        // Using object calling jdbc getConnection
        dbMgr.getConnection();

        // Parse date_of_birth string to LocalDate object
        LocalDate dateOfBirth = java.time.LocalDate.parse(dateOfBirthStr);

        // Two parameters passing
        Keeper keeper = new Keeper(keeperName, dateOfBirth, rank);

        // Calling KeeperManage
        KeeperManage keeperManager = new KeeperManage();
        int rowsAffected = -1;

        // Calling dao
        rowsAffected = keeperManager.insert(keeper);

        if (rowsAffected == 1) {
            out.println("Successfully Inserted.");
        }
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        out.println("Error: ClassNotFoundException - " + e.getMessage());
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("Error: SQLException - " + e.getMessage());
    } catch (IncorrectDataTypeException e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: Unexpected Exception - " + e.getMessage());
    }
    %>
</body>
</html>
