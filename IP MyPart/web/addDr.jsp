<%-- 
    Document   : addDr
    Created on : Jan 29, 2022, 1:18:43 AM
    Author     : hasifhafifi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>iCare | Doctors</title>
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

        .bungkus
        {
          width: auto;
          background-color: #3eb8bd;
          color: black;
          border-radius: 9px;
          padding: 30px;
        }

        #button
        {
          position: absolute; 
          bottom: 20px; 
          right: 40px;
          color: white;
          background-color: black;
          border-radius: 9px;
        }
        
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

            resultset =statement.executeQuery("select * from department") ;
    %>

        <%@include file="navbar_admin.jsp" %>

  <section>
    <div class="container" data-aos="fade-up">

        <div class="section-title">
            <h2>Add New Doctor Form</h2>
        </div>
        
        <div class="bungkus">
            <form name="addDoctor" method="post" action="addDrServlet">
                <b>Name:</b>               
                <input type="text" name="name" class="form-control" placeholder="Doctor Name" required/><br>
                <b>Grade:</b>               
                <input type="text" name="grade" class="form-control" placeholder="Doctor Grade" required/><br>
                <b>Email:</b> 
                <input type="email" name="email" class="form-control" placeholder="Doctor Email" required/><br>
                <b>Mobile:</b>
                <input type="text" name="mobile" class="form-control" placeholder="Doctor Phone Number" required/><br>
                <label for="appointdepartment">Department :</label>
                <select name="appointdepartment" class="btn btn-success dropdown-toggle">  
                    <%  while(resultset.next()){ %>
                        <option><%= resultset.getString(2)%></option> <!--taking scnd column in table-->
                    <% }%>
                </select>
                
                <input type="text" name="available" class="form-control" value="Yes" hidden/><br>
                <button type="submit" name="submit" id="button"><span style="color: #3eb8bd;"><i class="fas fa-save"></i></span>&nbsp&nbspSave</button>
            </form>  
        </div>
 
    </div>
  </section>

  <%
            statement.close();
            con.close();
        }
        catch(Exception e)
        {
             out.println("wrong entry "+e);
        } 
  %>
  
   
  <%@include file="footer.jsp" %>
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
