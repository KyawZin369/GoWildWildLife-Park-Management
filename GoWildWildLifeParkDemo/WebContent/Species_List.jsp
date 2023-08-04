<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.csm.dao.SpeciesManage" %>
<%@ page import="com.csm.entity.Species" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Species Lists</title>
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

    <center>
        <h1>Species Lists</h1>
    </center>

    <a href="main.jsp" id="home">Home</a>

    <%
        try {
            SpeciesManage speciesMgr = new SpeciesManage();
            ArrayList<Species> speciesList = speciesMgr.fetchAll();
        %>

        <center>
            <table border="1">
                <tr>
                    <th>Species ID</th>
                    <th>Species Type</th>
                    <th>Species Group</th>
                    <th>LifeStyle</th>
                    <th>Conservation Status</th>
                    <th>Delete Species</th> 
                </tr>
                <% for (Species species : speciesList) { %>
                    <tr>
                        <td><%= species.getSpecies_Id() %></td>
                        <td><%= species.getSpecies_Type() %></td>
                        <td><%= species.getSpecies_Group() %></td>
                        <td><%= species.getLifestyle() %></td>
                        <td><%= species.getConservation_status() %></td>
                        <td><a href="Species_Delete.jsp?SpeciesId=<%= species.getSpecies_Id() %>">Delete</a></td>
                    </tr>
                <% } %>
            </table>
        </center>

    <%
        } catch (ClassNotFoundException e) {
            // Handle ClassNotFoundException
            e.printStackTrace();
    %>
        <center>
            <p>Error: Unable to load class.</p>
        </center>
    <%
        } catch (SQLException e) {
            // Handle SQLException
            e.printStackTrace();
    %>
        <center>
            <p>Error: Unable to fetch data from the database.</p>
        </center>
    <%
        }
    %>

</body>
</html>
