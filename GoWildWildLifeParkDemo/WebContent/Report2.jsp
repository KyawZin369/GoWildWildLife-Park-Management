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
    <title>Report 2</title>

    <!-- Bootstrap CSS link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-repeat: no-repeat;
            background-size: cover;
            background-color: #f8f9fa;
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
            background-color: rgba(0, 0, 0, 0.5);
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
        <h1 class="header-text">Report 2</h1>
    </div>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                 <h1 class="text-center">Report 2</h1>
                <table class="table table-bordered table-striped mt-4">
                    <thead class="thead-dark">
                        <tr>
                            <th>Keeper Name</th>
                            <th>Total Animals</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            try {
                                AnimalManage aMgr = new AnimalManage();
                                ArrayList<Animal> animals = aMgr.fetchAnimalGroupByKeeper();

                                for (Animal a : animals) {
                        %>
                        <tr>
                            <td><%= a.getKeeper_Name() %></td>
                            <td><%= a.getTotalAnimals() %></td>
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
