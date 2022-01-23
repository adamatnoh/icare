<%-- 
    Document   : appointmentHistoryReceptionist
    Created on : Jan 19, 2022, 2:23:56 AM
    Author     : adamn
--%>

<%@page import="java.time.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<!DOCTYPE html>
<html>
    <head>
      <meta charset="utf-8">
      <meta content="width=device-width, initial-scale=1.0" name="viewport">

      <title>iCare</title>
      <meta content="" name="description">
      <meta content="" name="keywords">

      <!-- Favicons -->
      <link href="assets/img/icarekecik.jpg" rel="icon">
      <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

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
      <link rel="stylesheet" href="assets/vendor/bootstrap/*" type="text/css"/>
      
      <style>
          button{
            color: white;
            background-color: #3eb8bd;
            width: 80px;
            height: 30px;
            border-radius: 9px !important;
          }
      </style>

    </head>
    
    <body>

        <%
        if((Integer)session.getAttribute("userLoginID")==3|(Integer)session.getAttribute("userLoginID")==2){    
            
        try{
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "icare";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pass = "";
        int nombor=1;
       
        Class.forName(driver); //2- Load & Register driver
        
        
        Connection con = DriverManager.getConnection(url, userName, pass); 

        Statement statement = con.createStatement() ; 
        resultset =statement.executeQuery("select appointment.*, user.name, user.userID, medicalreport.reportID, medicalreport.nextAppoint from medicalreport join appointment on (medicalreport.appointmentID=appointment.appointmentID) join user on (medicalreport.userID=user.userID) where status='finished'") ;
        %>
        
        <%@include file="navbar_receptionist.jsp" %>
         
        <section id="appointmentPatient" class="appointmentPatient">
          <div class="container">

            <div class="section-title">
              <h2>List of Past Appointment</h2>
            </div>

          </div>
            <div class="container">
            <table class="table table-hover">
                <thead class="thead-light">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">App. ID</th>
                        <th scope="col">Patient's Name</th>
                        <th scope="col">Type</th>
                        <th scope="col">Date</th>
                        <th scope="col">Time</th>
                        <th scope="col">Department</th>
                        <th scope="col">Doctor's Name</th>
                        <th scope="col">Details</th>
                    </tr>
                </thead>
                <tbody>
                    <%  
                        while(resultset.next()){ 
                    %>
                    <tr>
                    <th scope="row"><%= nombor++ %></th>
                        <td><%= resultset.getString(1)%></td>
                        <td><%= resultset.getString(11)%></td>
                        <td><%= resultset.getString(2)%></td>
                        <td><%= resultset.getString(3)%></td>
                        <td><%= resultset.getString(4)%></td>
                        <td><%= resultset.getString(5)%></td>
                        <td><%= resultset.getString(6)%></td>
                        <form name="editDr" method="post" action="medReport.jsp">
                            <td><button type="submit" value="details"><i class="fas fa-user"></i>&nbsp&nbspmore</button></td>
                            <input type="hidden" id="reportID" name="reportID" value=<%= resultset.getString(13)%>>
                            <input type="hidden" id="userID" name="userID" value=<%= resultset.getString(12)%>>
                        </form>
                    <% } %>                
                    </tr>

                </tbody>
            </table>
        </section>  
        <%

        }
        catch(Exception e)
        {
             out.println("Error: "+e);
        }
%>

  <%@include file="footer.jsp" %>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/purecounter/purecounter.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
    <% }else{ %>
    <section id="appointmentPatient" class="appointmentPatient">
          <div class="container">

            <div class="section-title">
              <h2>Sorry, you have no access to this page !</h2>
            </div>
          </div>
    </section>
    <% } %>
    </body>
</html>

