<%-- 
    Document   : manageAppointment
    Created on : Jan 7, 2022, 4:28:12 PM
    Author     : Asus VivoBook S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html>
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
        border-collapse: collapse;
        }

        tr {
        border-bottom: 1pt solid black;
        }

        button{
            color: white;
            background-color: #3eb8bd;
            width: 80px;
            height: 30px;
            border-radius: 9px;
        }
        
    </style>
    
 </head>

 <body>
  
 <%@include file="navbar_receptionist.jsp" %>

 <!-- ======= Frequently Asked Questioins Section ======= -->
  <section id="faq" class="faq section-bg">
    <div class="container" data-aos="fade-up">

        <br><br><br>

        <div class="section-title">
            <h2>Pending Appointment</h2>
        </div>

        <form action="">
            <input type="text" placeholder="Search" name="search" style="background-color: #cef7f8; border-radius:9px;">
            <button type="submit"><i class="fa fa-search"></i></button>
        </form>
        <br><br>

        <table width="100%">
            <tr>
                <th>Time</th>
                <th>Date</th>
                <th>Patient</th>
                <th>Phone No</th>
                <th>Appointment Details</th>
                <th>Patient Details</th>
                <th>Status</th>
            </tr>
            <tr>
                <td>10:00<br><span style="font-size: small; color: #3eb8bd;">10:30</span></td>
                <td>15-01-2022</td>
                <td>Tan Sri Abu Ali Bin Kassim</td>
                <td>013-2225454</td>
                <td>Stomach ache</td>
                <td><button type="submit" value="details"><i class="fas fa-user"></i>&nbsp&nbspmore</button></td>
                <td><form action="#" required>
                                 <select id="user" name="user">
                                 <option value="Approve">Approved</option>
                                 <option value="Reject">Rejected</option>
                                 <option value="Finish">Finished</option>
                     </select> </br></td>
            </tr>
            <tr>
                <td>9:00<br><span style="font-size: small; color: #3eb8bd;">9:30</span></td>
                <td>22-01-2022</td>
                <td>Husni Azhar Bin Zul Muhammad</td>
                <td>013-543543</td>
                <td>Rehab check-up</td>
                <td><button type="submit" value="details"><i class="fas fa-user"></i>&nbsp&nbspmore</button></td>
                <td><form action="#" required>
                                 <select id="user" name="user">
                                 <option value="Approve">Approved</option>
                                 <option value="Reject" selected>Rejected</option>
                                 <option value="Finish">Finished</option>
                     </select> </br></td>
            </tr>
            <tr>
                <td>15:00<br><span style="font-size: small; color: #3eb8bd;">15:30</span></td>
                <td>15-01-2022</td>
                <td>&nbsp&nbspHafifi Ismail Bin Hasif Haza</td>
                <td>019-5756765</td>
                <td>Influenza</td>
                <td><button type="submit" value="details"><i class="fas fa-user"></i>&nbsp&nbspmore</button></td>
                <td><form action="#" required>
                                 <select id="user" name="user">
                                 <option value="Approve">Approved</option>
                                 <option value="Reject">Rejected</option> 
                                 <option value="Finish" selected>Finished</option>
                     </select> </br></td>
            </tr>
        </table>
        
        </br></br>
         <a href="appointmentHistory.jsp" class="appointment-btn scrollto"><span class="d-none d-md-inline">View Appointment</span> History</a>
    </div>
  </section><!-- End Frequently Asked Questioins Section -->

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
