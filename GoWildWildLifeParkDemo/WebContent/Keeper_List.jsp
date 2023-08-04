<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.csm.dao.KeeperManage" %>
<%@ page import="com.csm.entity.Keeper" %>
<%@ page import="com.csm.DBManager" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Keeper List</title>

    <!-- Bootstrap CSS link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa; /* Light Gray */
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
        
        .table-container {
            margin-top: 40px;
        }
    </style>
</head>
<body>
    <a href="Main.jsp" id="home">Home</a>
    <div class="header-container">
        <h1 class="header-text">Keeper List</h1>
        <p>Welcome to our Keeper List page. Meet our dedicated keepers.</p>
    </div>
    <div class="container table-container">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <h1 class="text-center">Keeper List</h1>
                <table class="table table-bordered table-striped mt-4">
                    <thead class="thead-dark">
                        <tr>
                            <th>Keeper Name</th>
                            <th>Date Of Birth</th>
                            <th>Rank</th>
                            <th>Delete Keeper</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            try {
                                DBManager dbMgr = new DBManager();
                                dbMgr.getConnection();

                                KeeperManage eMgr = new KeeperManage();
                                ArrayList<Keeper> keepers = eMgr.fetchAll();

                                for (Keeper keeper : keepers) {
                        %>
                        <tr>
                            <td><%= keeper.getKeeper_Name() %></td>
                            <td><%= keeper.getDate_of_Birth() %></td>
                            <td><%= keeper.getRank() %></td>
                            <td><a href="Keeper_Delete.jsp?KeeperId=<%= keeper.getKeeper_Id()%>">Delete</a></td>
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

    <!-- Bootstrap 5 JS link (required for Bootstrap features) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
