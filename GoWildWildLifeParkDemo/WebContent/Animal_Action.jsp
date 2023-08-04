<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.csm.DBManager" %>
<%@ page import="com.csm.dao.AnimalManage" %>
<%@ page import="com.csm.entity.Animal" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.csm.IncorrectDataTypeException" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Animals Process Data</title>
</head>
<body>
<%
    try {
        String AN = request.getParameter("animal_name");
        String GD = request.getParameter("gender");
        int YO = Integer.parseInt(request.getParameter("year_of_arrival"));
        int SSID = Integer.parseInt(request.getParameter("species_species_id"));
        int KID = Integer.parseInt(request.getParameter("keeper_keeper_id"));
        int EID = Integer.parseInt(request.getParameter("enclosures_enclosure_id"));
        int DID = Integer.parseInt(request.getParameter("diet_diet_id"));

        // Two parameters passing
        Animal animal = new Animal(AN, GD, YO, SSID, KID, EID, DID);

        // Calling AnimalManage
        AnimalManage aMag = new AnimalManage();
        int affectedRows = -1;

        // Calling dao
        affectedRows = aMag.insert(animal);

        if (affectedRows == 1) {
            out.println("Successfully Inserted.");
        } else {
            out.println("Failed to Insert.");
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
