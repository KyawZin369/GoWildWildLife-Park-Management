<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.csm.dao.EnclosureManage" %>
<%@ page import="com.csm.entity.Enclosure" %>
<%@ page import="com.csm.IncorrectDataTypeException" %>
<%@ page import="java.sql.SQLException" %>

<%
    try {
        String Et = request.getParameter("type");
        String El = request.getParameter("location");

        // Two parameters passing
        Enclosure c = new Enclosure(Et, El);

        // Calling EnclosureManage
        EnclosureManage eMag = new EnclosureManage();
        int Affect = -1;

        // Calling dao
        Affect = eMag.insert(c);

        if (Affect == 1) {
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
