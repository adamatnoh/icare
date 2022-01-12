<%-- 
    Document   : profile
    Created on : Jan 6, 2022, 9:34:59 PM
    Author     : zulhu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<%ResultSet resultDr =null;%>
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


    </head>
    
    <body>
        
        <%
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

        <!-- ======= Header ======= -->
        <header id="header" >
            <div class="container d-flex align-items-center">

            <a href="index.html" class="logo me-auto"><img src="assets/img/icare.jpg" alt=""></a>
            <!-- Uncomment below if you prefer to use an image logo -->
            <!-- <h1 class="logo me-auto"><a href="index.html">Medicio</a></h1> -->

            <nav id="navbar" class="navbar order-last order-lg-0">
                <ul>
                <li><a class="nav-link scrollto" href="appointmentPatient.jsp">Appointment</a></li>
                <li><a class="nav-link scrollto" href="profile.jsp">Profile</a></li>
                <li class="dropdown"><a href="#"><span>Notification</span> <i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <li><a href="#"><img src="assets/img/bell.png" width="15px" style="display:block; float: left">UPCOMING EVENTS</a></li>
                        <li class="dropdown"><a href="#"><span>Annual Check-ups</span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                            <li><a href="#">Appointment with<br>Dr Subramaniam<br>[1 January 2022,<br>8.00am - 10.30am]</a></li>
                            <li><a href="#"></a></li>
                            <li><a href="#"></a></li>
                            <li><a href="#"></a></li>
                            <hr>
                            <li><a href="#">Clear</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li><a class="nav-link scrollto" href="login.html">Sign Out</a></li>
                <li class="dropdown"><div class="appointment-btn scrollto"><span>Make an</span> Appointment<i class="bi bi-chevron-down"></i></div>
                    <ul>
                        <li><a href="bookappointment.jsp"><span>Appointment</span></a></li>
                        <li><a href="onlineConsultation.jsp"><span>Online Consultation</span></a></li>
                    </ul>
                </li>
                </ul>
                <i class="bi bi-list mobile-nav-toggle"></i>
            </nav><!-- .navbar -->
            </div>
        </header><!-- End Header -->
         
        <!-- ======= Appointment Section ======= -->
        <section id="appointment" class="appointment section-bg">
            <div class="container" >
                <div class="section-title">

                 <h2>Make an Appointment</h2>
                 <p>Please enter the details as requested.</p>
               </div>
                
                <form action="appointmentController" method="post" >

                    <div class="row">
                        <div class="col-md-4 form-group mt-3">
                            <label for="appointdate">Appointment Date</label>
                            <input type="date" name="appointdate" class="form-control datepicker" id="appointdate" required>
                        </div>

                        <div class="col-md-4 form-group mt-3">
                            <label for="appointtime">Appointment Time</label>
                            <input type="time" name="appointtime" class="form-control " id="appointtime" min="09:00" max="18:00"  required>
                            <small>Office hours are 9am to 6pm</small>
                        </div>

                        <br/>

                        <div class="col-md-4 form-group mt-3">
                            <label for="appointdepartment">Appointment Department</label>
                            <br/>
                            <select name="appointdepartment" class="btn btn-success dropdown-toggle">  
                                <%  while(resultset.next()){ %>
                                    <option><%= resultset.getString(2)%></option> <!--taking scnd column in table-->
                                <% } resultDr =statement.executeQuery("select * from doctor") ;%>
                            </select>
                            
                            <!--input type="text" name="appointdepartment" class="form-control datepicker" id="appointdepartment" required-->
                        </div>

                        <div class="col-md-4 form-group mt-3">
                            <label for="appointdoctor">Appointment Doctor</label>
                            <br/>
                                <select name="appointdoctor" class="btn btn-success dropdown-toggle">  
                                <%  while(resultDr.next()){ %>
                                    <option><%= resultDr.getString(2)%></option> <!--taking scnd column in table-->
                                <% } %>
                                </select>
                            <!--input type="text" name="appointdoctor" class="form-control datepicker" id="appointdoctor" required-->
                        </div> 

                        <div class="form-group mt-3">
                          <textarea class="form-control" name="message" rows="5" placeholder="Message (Optional)"></textarea>
                        </div>
                    </div>
                    <br/>
                  <div class="text-center"><button type="submit" name="submit" class="appointment-btn scrollto">Make an Appointment</button></div>
                </form>
            </div>
        </section>
        
        <%

        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>

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

