<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%ResultSet rs =null;%>
<%ResultSet rs2 =null;%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>iCare | Medical Report</title>
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
          bottom: 10px; 
          right: 20px;
          color: white;
          background-color: black;
          border-radius: 9px;
        }
        
    </style>
    
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
        session = request.getSession(true);
        String rid = (String)session.getAttribute("reportID");
        String uid = (String)session.getAttribute("userID");
        
        rs2 = statement.executeQuery("select * from user where userID ="+uid); 
        
        rs2.next();
    %>

    <!-- ======= Header ======= -->
    <header id="header" >
        <div class="container d-flex align-items-center">

        <a href="index.html" class="logo me-auto"><img src="assets/img/icare.jpg" alt=""></a>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <h1 class="logo me-auto"><a href="index.html">Medicio</a></h1> -->

        <nav id="navbar" class="navbar order-last order-lg-0">
            <ul>
            <li><a class="nav-link scrollto" href="appointmentHistory.html">Appointment</a></li>
            <li><a class="nav-link scrollto" href="profile.html">Profile</a></li>
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
                    <li><a href="index.html"><span>Appointment</span></a></li>
                    <li><a href="onlineConsultation.html"><span>Online Consultation</span></a></li>
                </ul>
            </li>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav><!-- .navbar -->
        </div>
    </header><!-- End Header -->

  <!-- ======= Frequently Asked Questioins Section ======= -->
  <section id="faq" class="faq section-bg">
    <div class="container" data-aos="fade-up">

        <div class="section-title">
            <h2>Medical Report</h2>
        </div>

        <div class="bungkus">
          <b>Name:                  </b><%= rs2.getString(3)%> <br><br>
          <b>Identity No:           </b><%= rs2.getString(4)%> <br><br>
          <b>Gender:                </b><%= rs2.getString(5)%> <br><br>
          <% 
              rs = statement.executeQuery("select * from medicalreport where reportID="+rid);
              rs.next();   
          %>
          <b>Condition:             </b><%= rs.getString(5)%> <br><br>
          <b>Appointment subject:   </b><%= rs.getString(4)%> <br><br>
          <b>Remarks:           </b><br><%= rs.getString(2)%> <br><br>
          <b>Next appointment:      </b><%= rs.getString(6)%>
<!--          <br>
          <button type="submit" value="details" id="button"><span style="color: red;"><i class="fas fa-file-pdf"></i></span>&nbsp&nbspPrint as PDF</button>-->
        </div>
 
    </div>
  </section><!-- End Frequently Asked Questioins Section -->

  <%
            statement.close();
            con.close();
        }
        catch(Exception e)
        {
             out.println("wrong entry "+e);
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