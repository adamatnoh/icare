<%-- 
    Document   : navbar_guest
    Created on : Jan 22, 2022, 12:46:18 AM
    Author     : hasifhafifi
--%>

<%@page import="java.time.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%ResultSet resultsett =null;%>
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
        <!-- ======= Header ======= -->
        <header id="header" >
            <div class="container d-flex align-items-center">

            <a href="index.jsp" class="logo me-auto"><img src="assets/img/icare.jpg" alt=""></a>


            <nav id="navbar" class="navbar order-last order-lg-0">
                <ul>
                <li><a class="nav-link scrollto" href="appointmentPatient.jsp">Appointment</a></li>
                <li><a class="nav-link scrollto" href="profile.jsp">Profile</a></li>
                <li class="dropdown"><a href="#"><span>Notification</span> <i class="bi bi-chevron-down"></i></a>
                    <%
                        try{
                        String drive = "com.mysql.jdbc.Driver";
                        String dbNam = "icare";
                        String ur = "jdbc:mysql://localhost/" + dbNam + "?";
                        String userNam = "root";
                        String pas = "";
                        
                        Integer uid = (Integer) session.getAttribute("userLoginID");
                        
                        Class.forName(drive); //2- Load & Register driver

                        Connection co = DriverManager.getConnection(ur, userNam, pas); 

                        Statement statementt = co.createStatement() ;   
                        
                        resultsett = statementt.executeQuery("select * from appointment where status='pending' and userID="+uid) ;
                        if(resultsett.next())
                        {
                            String dt = resultsett.getString(3);

                            LocalDate date = Date.valueOf(dt).toLocalDate();
                            LocalDate today = LocalDate.now(ZoneId.of("Asia/Kuala_Lumpur"));
                            if (date.isAfter(today) && resultsett.getString(3)!= null) {
                    %>
                    <ul>
                        <li><a href="#"><img src="assets/img/bell.png" width="15px" style="display:block; float: left">UPCOMING EVENTS</a></li>
                        <li class="dropdown"><a href="#"><span>Appointment</span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a href="appointmentPatient.jsp"><span style="font-size:12px;">Appointment with<br><%= resultsett.getString(6)%><br>[<%= resultsett.getString(3)%>, <%= resultsett.getString(4)%>]</span></a></li>
                                <%  while(resultsett.next()){ %>
                                <hr>
                                <li><a href="appointmentPatient.jsp"><span style="font-size:12px;">Appointment with<br><%= resultsett.getString(6)%><br>[<%= resultsett.getString(3)%>, <%= resultsett.getString(4)%>]</span></a></li>
                                <% } %>
                            </ul>
                        </li>
                    </ul>
                    <% 
                        }
                        else{
                    %>
                    <ul>
                        <li><a href="#"><img src="assets/img/bell.png" width="15px" style="display:block; float: left">UPCOMING EVENTS</a></li>
                        <li class="dropdown"><a href="#"><span>No upcoming events</span> <i class="bi bi-chevron-right"></i></a></li>
                    </ul>
                    <% }}else{ %>
                    <ul>
                        <li><a href="#"><img src="assets/img/bell.png" width="15px" style="display:block; float: left">UPCOMING EVENTS</a></li>
                        <li class="dropdown"><a href="#"><span>No upcoming events</span> <i class="bi bi-chevron-right"></i></a></li>
                    </ul>
                    <% } %>
                </li>
                <li><a class="nav-link scrollto" href="signOutController">Sign Out</a></li>
                <li class="dropdown"><div class="appointment-btn scrollto"><span>Make an</span> Appointment<i class="bi bi-chevron-down"></i></div>
                    <ul>
                        <li><a href="bookappointment1.jsp"><span>Appointment</span></a></li>
                        <li><a href="onlineConsultation.jsp"><span>Online Consultation</span></a></li>
                    </ul>
                </li>
                </ul>
                <i class="bi bi-list mobile-nav-toggle"></i>
            </nav><!-- .navbar -->
            </div>
        </header><!-- End Header -->
        <%

        }
        catch(Exception e)
        {
             out.println("Error: "+e);
        }
%>
    </body>
</html>
