<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%ResultSet rs =null;%>
<%ResultSet rs1 =null;%>
<%ResultSet rs2 =null;%>
<%ResultSet rsm =null;%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>iCare | Pending Appointment</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="assets/img/icarekecik.jpg" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">

    <style>

        table {
        border-collapse: collapse !important;
        }

        tr {
        border-bottom: 1pt solid black !important;
        }

        button{
            color: white;
            background-color: #3eb8bd;
            width: 80px;
            height: 30px;
            border-radius: 9px !important;
        }
        form button{
            color: white;
            background-color: #3eb8bd;
            width: 150px;
            height: 30px;
            border-radius: 9px !important;
        }
        .msg{
          text-align: center;
          background-color: #3eb8bd;
          color: white;
          padding: 15px;
        }
        div.displayed {
            display: block;
            margin-left: auto;
            margin-right: auto }

    </style>

</head>

<body>

    <%
        try{
        if((Integer)session.getAttribute("loggedIn")==3){

        try{
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "icare";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pass = "";

        Class.forName(driver); //2- Load & Register driver


        Connection con = DriverManager.getConnection(url, userName, pass);

        Statement statement = con.createStatement() ;
        int numOfDoc=0;
        int numOfDep=0;
        int numOfUser=0;
        int numOfGuest=0;

        rs =statement.executeQuery("select *  FROM doctor") ;
        while(rs.next()){
            ++numOfDoc;
        }
        rs1 =statement.executeQuery("select *  FROM department") ;
        while(rs1.next()){
            ++numOfDep;
        }
        rs1 =statement.executeQuery("select *  FROM user") ;
        while(rs1.next()){
            ++numOfUser;
        }
        rs1 =statement.executeQuery("select *  FROM user where userType='guest'") ;
        while(rs1.next()){
            ++numOfGuest;
        }
        rsm =statement.executeQuery("select departmentID, count(doctorID)  from doctor group by departmentID order by count(doctorID) desc") ;
        
    %>
    <%@include file="navbar_admin.jsp" %><br/>
    <h1 style="text-align:center">Summary of iCare</h1><br/><br/>
        
      
        <div class="card text-white bg-primary mb-3 displayed" style="max-width: 18rem;">
            <div class="card-header">Doctor Summary</div>
            <div class="card-body">
              <h5 class="card-title">Total Number of Doctor</h5>
              <p class="card-text"><%=numOfDoc%></p>
            </div>
          </div>
          <div class="card text-white bg-secondary mb-3 displayed" style="max-width: 18rem;">
            <div class="card-header">Department Summary</div>
            <div class="card-body">
              <h5 class="card-title">Total Number of Department</h5>
              <p class="card-text"><%=numOfDep%></p>
            </div>
          </div>
          <div class="card text-white bg-success mb-3 displayed" style="max-width: 18rem;">
            <div class="card-header">User Summary</div>
            <div class="card-body">
              <h5 class="card-title">Total Number of Online User in iCare</h5>
              <p class="card-text"><%=numOfUser%></p>
            </div>
          </div>
          <div class="card text-white bg-danger mb-3 displayed" style="max-width: 18rem;">
            <div class="card-header">Guest Summary</div>
            <div class="card-body">
              <h5 class="card-title">Total Number of Online Guest/Patient in iCare</h5>
              <p class="card-text"><%=numOfGuest%></p>
            </div>
          </div>
            
          <div class="card bg-warning mb-3 displayed" style="max-width: 18rem;">
            <div class="card-header">Doctor by Department</div>
            <div class="card-body">
              <h5 class="card-title">Number of Doctor by Department ID Descending</h5>
              <p class="card-text">
                  <%while(rsm.next()){%>
                       Department ID:<%= rsm.getString(1)%><br/>
                       Number of Doctor:<%= rsm.getString(2)%><br/><br/>
                       
                       <%}%>
              </p>
            </div>
              <!--
          </div>
          <div class="card text-body bg-info mb-3 displayed" style="max-width: 18rem;">
            <div class="card-header">Header</div>
            <div class="card-body">
              <h5 class="card-title">Info card title</h5>
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            </div>
          </div>
          <div class="card bg-light mb-3 displayed" style="max-width: 18rem;">
            <div class="card-header">Header</div>
            <div class="card-body">
              <h5 class="card-title">Light card title</h5>
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            </div>
          </div>
          <div class="card text-white bg-dark mb-3 displayed" style="max-width: 18rem;">
            <div class="card-header">Header</div>
            <div class="card-body">
              <h5 class="card-title">Dark card title</h5>
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            </div>-->
          </div>




  <%
            statement.close();
            con.close();
        }
        catch(Exception e)
        {
             out.println("wrong entry "+e);
        }
  %>
<br/><br/><br/><br/><br/><br/><br/><br/><br/>
  <%@include file="footer.jsp" %>

    <% }else{ %>
    <section id="appointmentPatient" class="appointmentPatient">
          <div class="container">
            <div class="section-title">
              <h2>Sorry, you have no access to this page !</h2>
            </div>
          </div>
    </section>
    <% 
        }}
        catch(Exception NullPointerException)
        {%>
          <section id="appointmentPatient" class="appointmentPatient">
            <div class="container">
              <div class="section-title">
                <h2>Sorry, you have no access to this page !</h2>
              </div>
            </div>
          </section>
       <% } %>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/purecounter/purecounter.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>
</html>

