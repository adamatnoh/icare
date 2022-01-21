<%-- 
    Document   : profile
    Created on : Jan 6, 2022, 9:34:59 PM
    Author     : zulhu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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


    </head>
    
    <body>
        
        <%
            
            Integer id =  (Integer) session.getAttribute("userLoginID");
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

            resultset =statement.executeQuery("SELECT * FROM appointment WHERE status='finished' AND userID="+id) ;
            
        %>

        <!-- ======= Header ======= -->
        <header id="header" >
            <div class="container d-flex align-items-center">

            <a href="index.jsp" class="logo me-auto"><img src="assets/img/icare.jpg" alt=""></a>


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
         
        <!-- ======= Contact Section ======= -->
                <section id="appointmentPatient" class="appointmentPatient">
                  <div class="container">

                    <div class="section-title">
                      <h2>Appointment History</h2>
                    </div>

                  </div>
                    <div class="container">
                    <table class="table table-hover">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Type</th>
                                <th scope="col">Date</th>
                                <th scope="col">Time</th>
                                <th scope="col">Department</th>
                                <th scope="col">Doctor's Name</th>
                                <th scope="col">Message</th>

                            </tr>
                        </thead>
                        <tbody>
                            <%  while(resultset.next()){ %>
                            <tr>
                            <th scope="row"><%= nombor++ %></th>
                                <td><%= resultset.getString(2)%></td>
                                <td><%= resultset.getString(3)%></td>
                                <td><%= resultset.getString(4)%></td>
                                <td><%= resultset.getString(5)%></td>
                                <td><%= resultset.getString(6)%></td>
                                <td><%= resultset.getString(9)%></td>
                            <% } %>                
                            </tr>
                           
                        </tbody>
                    </table>

   
                         <a href="appointmentPatient.jsp" class="btn btn-secondary btn-sm active" type="button" >Back</a>
                    </div>
                       
                </section>
                
                  

        
        <%

        }
        catch(Exception e)
        {
             out.println("Error:"+e);
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
