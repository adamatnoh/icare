<%-- 
    Document   : approval
    Created on : Jan 29, 2022, 11:34:27 PM
    Author     : adamn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%ResultSet rs =null;%>
<!DOCTYPE html>
<html>
    <head>
      <meta charset="utf-8">
      <meta content="width=device-width, initial-scale=1.0" name="viewport">

      <title>iCare | Approval</title>
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
    </head>
    
    <body>
        
        <%
            try{
            if((Integer)session.getAttribute("loggedIn")==2){
            
            String driver = "com.mysql.jdbc.Driver";
            String dbName = "icare";
            String url = "jdbc:mysql://localhost/" + dbName + "?";
            String userName = "root";
            String pass = "";

            Class.forName(driver); //2- Load & Register driver


            Connection con = DriverManager.getConnection(url, userName, pass); 

            Statement statement = con.createStatement() ;
            int d = Integer.parseInt(request.getParameter("appointmentID"));

            rs =statement.executeQuery("select appointment.*, user.* from appointment inner join user on appointment.userID=user.userID where appointment.appointmentID="+d) ;
            rs.next();
        %>

        <%@include file="navbar_receptionist.jsp" %>
         
        <!-- ======= Appointment Section ======= -->
        <section id="appointment" class="appointment section-bg">
            <div class="container" >
                <div class="section-title">

                 <h2>Appointment Approval</h2>
                 <p>Please determine the approval status for this appointment.</p>
               </div>
                <form action="apprController" method="get" >
                    <div class="row">
                        <div class="col-md-4 form-group mt-3">
                            <label for="appointdate">Appointment Date</label>
                            <input type="date" name="appointdate" class="form-control datepicker" value="<%= rs.getString(3)%>" disabled>
                        </div>

                        <div class="col-md-4 form-group mt-3">
                            <label for="appointtime">Appointment Time</label>
                            <input type="time" class="form-control " value="<%= rs.getString(4)%>"  disabled>
                        </div>

                        <br/>
                        
                        <div class="col-md-4 form-group mt-3">
                            <label for="appointdepartment">Appointment Department</label>
                            <br/>
                            <input type="text" class="form-control " value="<%= rs.getString(5)%>"  disabled>
                        </div>

                        <div class="col-md-4 form-group mt-3">
                            <label for="appointdoctor">Doctor In Charged</label>
                            <br/>
                            <input type="text" class="form-control " value="<%= rs.getString(6)%>"  disabled>
                        </div> 
                
                        <div class="col-md-4 form-group mt-3">
                            <h6>Appointment Status Approval</h6>
                            <select name="status" id="status" class="form-select">
                              <option value="Pending">Pending</option>
                              <option value="Approved">Approved</option>
                              <option value="Finished">Finished</option>
                              <option value="Rejected">Rejected</option>
                            </select>
                        </div>
                    </div>
                    <br/>

                    <input type="hidden" id="appointmentID" name="appointmentID" value=<%= rs.getString(1)%>>
                    
                    <div class="text-center">
                        <button type="submit" class="appointment-btn scrollto">Save</button>
                    </div>
                </form>
            </div>
        </section>

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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
  
  </body>
</html>


