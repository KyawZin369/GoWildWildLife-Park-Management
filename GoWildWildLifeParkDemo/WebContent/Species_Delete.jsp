<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.csm.DBManager" %>
<%@ page import="com.csm.dao.SpeciesManage" %>
<%@ page import="com.csm.entity.Species" %>

<%@ include file="Species_List.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Species Deletion</title>
</head>
<body>

<%
    String speciesId = request.getParameter("SpeciesId");

    if (speciesId == null || speciesId.trim().isEmpty()) {
        // Handle the case where speciesId is missing or empty
        out.println("<h2>Error: SpeciesId parameter is missing or empty.</h2>");
    } else {
        try {
            int idToDelete = Integer.parseInt(speciesId);
            SpeciesManage dao = new SpeciesManage();
            int rowAffected = dao.delete(idToDelete);
            
            if (rowAffected > 0) {
                out.println("<h2>The data has been deleted.</h2>");
            } else {
                out.println("<h2>Error: The SpeciesId does not exist in the database.</h2>");
            }
        } catch (NumberFormatException ex) {
            // Handle the case where speciesId is not a valid integer
            out.println("<h2>Error: Invalid SpeciesId parameter.</h2>");
        } catch (ClassNotFoundException ex) {
            out.println(ex.getMessage());
        } catch (SQLException e) {
            out.println(e.getMessage());
        }
    }
%>

</body>
</html>
