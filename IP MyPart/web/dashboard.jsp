<%-- 
    Document   : manageDashboard
    Created on : Jan 25, 2022, 4:32:59 PM
    Author     : Asus VivoBook S
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

    <title>iCare | Dashboard </title>
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

        button{
            color: #ffffff;
            background-color: #055160;
            width: 250px;
            height: 50px;
            border-radius: 9px;
        }
        
        div1{
            width: 28%;
            float: left;
            height: 300px;
            background-color: #b2e4e6;
            margin: 20px;
            display: flex;
            padding: 10px;
            border: solid;
            border-color: #055160;
            border-radius: 10px;
            flex-direction: row;
        }
        
    </style>
    
 </head>

 <body>
        
        </br></br>
        <div class="section-title">
            <h2>Doctor List</h2>
        </div>
       

       <div1 class="dr1"> 
           
           <a><img src="assets/img/doctors/doctors-1.jpg" alt="Doctor"  width="150" ></a>
           <a><b>&nbsp&nbsp Dr Sivaraju Buchanan </b></br></br>
           &nbsp&nbsp Specialist in </br>
           &nbsp&nbsp CARDIOLOGY </br></br>
           &nbsp&nbsp Location </br>
           &nbsp&nbsp HOSPITAL BESAR SELAYANG </br></br> 
           <button a href="bookappointment1.jsp"> MAKE AN APPOINTMENT OR ENQUIRIES</button>
           </a>
           
           
        </div1>

        <div1 class="dr2"> 
            
            <a><img src="assets/img/doctors/doctors-3.jpg" alt="Doctor"  width="150"></a>
            <a><b>&nbsp&nbsp Dr Muhd Azmir</b></br></br>
           &nbsp&nbsp Specialist in </br>
           &nbsp&nbsp NEUROLOGY </br></br>
           &nbsp&nbsp Location </br>
           &nbsp&nbsp HOSPITAL PANTAI KASIH </br></br>>
           <button a href="bookappointment1.jsp"> MAKE AN APPOINTMENT OR ENQUIRIES</button>
           </a>
         </div1>
 
        <div1 class="dr3">
            
            <a><img src="assets/img/doctors/doctors-2.jpg" alt="Doctor"  width="150"></a>
            <a><b>&nbsp&nbsp Dr Yvonne Ng </b></br></br>
           &nbsp&nbsp Specialist in </br>
           &nbsp&nbsp VASCULAR SURGERY </br></br>
           &nbsp&nbsp Location </br>
           &nbsp&nbsp HOSPITAL AMPANG </br></br>
           <button a href="bookappointment1.jsp"> MAKE AN APPOINTMENT OR ENQUIRIES</button>
           </a>
         </div1>
        
        </br></br>
       
        <form method="get" action="/drProfile.jsp">
          <button type="submit">Load More</button>
        </form>
      
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
