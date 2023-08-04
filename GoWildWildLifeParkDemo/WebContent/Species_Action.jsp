<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.csm.DBManager" %>
<%@ page import="com.csm.dao.SpeciesManage" %>
<%@ page import="com.csm.entity.Species" %>
<%@ page import="com.csm.IncorrectDataTypeException" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Species Process Data</title>
</head>
<body>
    <%
    try {
        String speciesType = request.getParameter("species_type");
        String speciesGroup = request.getParameter("species_group");
        String lifestyle = request.getParameter("lifestyle");
        String conservationStatus = request.getParameter("conservation_status");

        // Calling DBManager
        DBManager dbMgr = new DBManager();

        // Using object calling jdbc getConnection
        dbMgr.getConnection();

        // Two parameters passing
        Species species = new Species(speciesType, speciesGroup, lifestyle, conservationStatus);

        // Calling SpeciesManage
        SpeciesManage speciesManager = new SpeciesManage();
        int rowsAffected = -1;

        // Calling dao
        rowsAffected = speciesManager.insert(species);

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
