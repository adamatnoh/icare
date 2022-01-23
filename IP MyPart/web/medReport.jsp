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
        String reportid = request.getParameter("reportID");
        String userid = request.getParameter("userID");
        
        rs2 = statement.executeQuery("select * from user where userID ="+userid); 
        
        rs2.next();
    %>

    <% 
        if((Integer)session.getAttribute("userLoginID")==1){ 
    %>
        <%@include file="navbar_guest.jsp" %>
    <% 
        }else if((Integer)session.getAttribute("userLoginID")==2) {
    %>
        <%@include file="navbar_receptionist.jsp" %>   
    <% 
        }else{
    %>
        <%@include file="navbar_admin.jsp" %>
    <% } %> 
        
  <!-- ======= Frequently Asked Questioins Section ======= -->
  <section id="faq" class="faq section-bg">
    <div class="container" data-aos="fade-up">

        <div class="section-title">
            <h2>Medical Report</h2>
        </div>

        <div class="bungkus">
          <b>Name:                  </b><%= rs2.getString(3)%> <br><br>
          <b>Identity No:           </b><%= rs2.getString(4)%> <br><br>
          <% 
              rs = statement.executeQuery("select * from medicalreport where reportID="+reportid);
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
  
</body>
</html>