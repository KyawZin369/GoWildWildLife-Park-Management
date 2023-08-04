<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Go Wild WildLife Park</title>
<!-- Bootstrap 5 CSS link -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome CSS link -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<style>
  body {
    background-image: url('Main4.jpg');
    background-repeat: no-repeat;
    background-size: cover;
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
  }

  .menu_bar {
    background-color: rgb(0, 196, 0);
    text-align: left;
    height: 60px;
    display: flex;
    align-items: center;
  }

  .menu_bar ul {
    list-style: none;
    color: white;
    font-size: 20px;
    margin: 0;
    display: flex;
    align-items: center;
    gap: 15px;
  }

  .menu_bar ul li a {
    text-decoration: none;
    color: rgb(0, 0, 0);
    padding: 10px;
    border-radius: 5px;
    font-weight: 700;
  }

  .menu_bar ul li a:hover {
    color: #a64dff;
    background-color: #006400;
  }

  .sub-menu {
    display: none;
  }

  .menu_bar ul li:hover .sub-menu {
    display: block;
  }

  .sub-menu ul {
    background: rgb(0, 100, 0);
    margin-top: 10px;
    border-radius: 5px;
  }

  .sub-menu ul li {
    width: 150px;
    padding: 10px;
  }

  .sub-menu ul li:hover {
    background-color: #134d00;
  }

  h1 {
    margin: 50px 80px 10px;
    color: #51ff00;
    font-weight: 1000;
    background-color: #004d00;
    border-radius: 10px;
  }

  h2 {
    margin: 20px 150px 10px;
    color: #ff8000;
    font-weight: 700;
  }

  p {
    margin: 20px 75px 10px;
    font-weight: 1000;
  }

  .active {
    border: 1px solid #004d00;
    border-radius: 7px;
    background-color: #03d403;
    padding: 13px;
  }

  .active:hover {
    color: #66ff66;
  }

  /* Additional Style Improvements */
  .container {
    padding: 20px;
  }

  .jumbotron {
    background-color: #004d00;
    color: #51ff00;
    border-radius: 10px;
    padding: 20px;
  }

  .jumbotron h1 {
    margin-bottom: 20px;
  }

</style>

<body>

  <div class="menu_bar">
    <ul>
      <li><a href="main.jsp" class="active">Home</a></li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Diet</a>
        <div class="dropdown-menu sub-menu">
          <a class="dropdown-item" href="Diet.jsp">Add Diet</a>
          <a class="dropdown-item" href="Diet_List.jsp">View Diet</a>
        </div>
      </li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Keepers</a>
        <div class="dropdown-menu sub-menu">
          <a class="dropdown-item" href="Keeper.jsp">Add Keepers</a>
          <a class="dropdown-item" href="Keeper_List.jsp">View Keepers</a>
        </div>
      </li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Animals</a>
        <div class="dropdown-menu sub-menu">
          <a class="dropdown-item" href="Animal.jsp">Add Animals</a>
          <a class="dropdown-item" href="Animal_List.jsp">View Animals</a>
        </div>
      </li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Enclosures</a>
        <div class="dropdown-menu sub-menu">
          <a class="dropdown-item" href="Enclosure.jsp">Add Enclosures</a>
          <a class="dropdown-item" href="Enclosure_List.jsp">View Enclosures</a>
        </div>
      </li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Species</a>
        <div class="dropdown-menu sub-menu">
          <a class="dropdown-item" href="Species.jsp">Add Species</a>
          <a class="dropdown-item" href="Species_List.jsp">View Species</a>
        </div>
      </li>
       <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Keeper Report</a>
        <div class="dropdown-menu sub-menu">
          <a class="dropdown-item" href="Report-1.jsp">Report1</a>
          <a class="dropdown-item" href="Report2.jsp">Report 2</a>
        </div>
      </li>
    </ul>
  </div>
  
  <div class="container">
    <div class="jumbotron">
      <h1>Welcome To Go Wild WildLife Park</h1>
      <h2>Discover the animal world !!!!!!</h2>
      <p>Over 2000 animals with new challenges and excitement. Just enjoy the moment.</p>
    </div>
  </div>

  <!-- Bootstrap 5 JS link (required for Bootstrap features like dropdowns) -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
