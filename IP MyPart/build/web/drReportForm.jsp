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
          bottom: 20px; 
          right: 40px;
          color: white;
          background-color: black;
          border-radius: 9px;
        }
        
    </style>
    
</head>

<body>

        <%@include file="navbar_receptionist.jsp" %>

  <!-- ======= Frequently Asked Questioins Section ======= -->
  <section id="faq" class="faq section-bg">
    <div class="container" data-aos="fade-up">

        <div class="section-title">
            <h2>Patient Medical Report Form</h2>
        </div>
        
        <div class="bungkus">
            <form name="PReport" method="post" action="reportController">
                <b>Patient ID:</b>               
                <input type="text" name="userID" class="form-control" placeholder="patient id" required/><br>
                <b>Appointment ID:</b>               
                <input type="text" name="appointmentID" class="form-control" placeholder="appointment id" required/><br>
                <b>Subject:</b> 
                <input type="text" name="subject" class="form-control" placeholder="appointment subject" required/><br>
                <b>Appointment description:</b>
                <textarea name="details" class="form-control" placeholder="descriptions" required></textarea><br>
                <b>Patient's condition:</b> 
                <select name="PCondition" required> 
                      <option selected value="undetermined">Undetermined
                      <option value="Good">Good
                      <option value="Fair">Fair
                      <option value="Serious">Serious
                      <option value="Critical">Critical
                      <option value="Treated and Released">Treated and Released 
                </select><br/><br/>
                <b>Next appointment:</b><br>
                    <input type="radio" name="nxtApp" value="yes" />Yes
                    <input type="radio" name="nxtApp" value="no" />No need<br><br>
                <b>Next appointment date:</b> 
                <input type="date" name="nxtApptD" class="form-control"/><br><br>
                <button type="submit" name="submit" id="button"><span style="color: #3eb8bd;"><i class="fas fa-save"></i></span>&nbsp&nbspSave</button>
            </form>  
        </div>
 
    </div>
  </section><!-- End Frequently Asked Questioins Section -->

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