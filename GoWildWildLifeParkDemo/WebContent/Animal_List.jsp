<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.csm.dao.AnimalManage" %>
<%@ page import="com.csm.entity.Animal" %>
<%@ page import="com.csm.DBManager" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Animal List</title>

    <!-- Bootstrap CSS link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa; /* Light Gray */
            background-image: url('https://example.com/path-to-your-image.jpg'); /* Replace with your image URL */
            background-repeat: no-repeat;
            background-size: cover;
        }

        #home {
            border: 2px solid;
            border-radius: 10px;
            padding: 10px 20px;
            text-decoration: none;
            color: #005580;
            background-color: #8a8a5c;
            position: fixed;
            top: 20px;
            right: 20px;
        }

        #home:hover {
            color: #ff8080;
        }

        .header-container {
            background-color: rgba(0, 0, 0, 0.5); /* Dark transparent overlay */
            padding: 30px;
            color: white;
            text-align: center;
        }

        .header-text {
            font-size: 36px;
            font-weight: bold;
        }
        
        .text-center{
        	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        	font-weight:600;
        }
    </style>
</head>
<body>
    <a href="Main.jsp" id="home">Home</a>
    <div class="header-container">
        <h1 class="header-text">Animal List</h1>
        <p>Welcome to our Animal List page. Explore the wonderful world of animals.</p>
    </div>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                 <h1 class="text-center">Animal List</h1>
                <table class="table table-bordered table-striped mt-4">
                    <thead class="thead-dark">
                        <tr>
                            <th>Animal ID</th>
                            <th>Animal Name</th>
                            <th>Gender</th>
                            <th>Year of Arrival</th>
                            <th>Species ID</th>
                            <th>Keeper ID</th>
                            <th>Enclosure ID</th>
                            <th>Diet ID</th>
                           	<th>Delete Animal</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            try {
                                DBManager dbMgr = new DBManager();
                                dbMgr.getConnection();

                                AnimalManage eMgr = new AnimalManage();
                                ArrayList<Animal> animals = eMgr.fetchAll();

                                for (Animal animal : animals) {
                        %>
                        <tr>
                            <td><%= animal.getAnimal_Id() %></td>
                            <td><%= animal.getAnimal_Name() %></td>
                            <td><%= animal.getGender() %></td>
                            <td><%= animal.getYear_of_Arrival() %></td>
                            <td><%= animal.getSpecies_Species_Id() %></td>
                            <td><%= animal.getKeeper_Keeper_Id() %></td>
                            <td><%= animal.getEnclosures_Enclosure_Id() %></td>
                            <td><%= animal.getDiet_Diet_Id() %></td>
                            <td><a href="Animal_Delete.jsp?AnimalId=<%= animal.getAnimal_Id()%>">Delete</a></td>

                        </tr>
                        <% 
                                }
                            } catch (ClassNotFoundException e) {
                                e.printStackTrace();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        %>
                    </tbody>
                </table>
            </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS link (required for Bootstrap features) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
