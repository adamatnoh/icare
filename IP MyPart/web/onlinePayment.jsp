

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>iCare | Online Payment</title>
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
        <link rel="stylesheet" href="assets/css/payment.css">
    </head>
    <body>
                <!-- ======= Header ======= -->
        <header id="header" >
            <div class="container d-flex align-items-center">

            <a href="index.jsp" class="logo me-auto"><img src="assets/img/icare.jpg" alt=""></a>
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

          <section id="payment">
            <div class="container">
                <div class="insidecontainer">
                    <div class="section-title">
                        <h2>Online Payment</h2>
                    </div>
                    <br><br>
                    <div class="childd boxx">
                        <h2 class="h2title">Billing Details</h2>
                        <hr>
                        <b>Online Consultation:</b>
                        <div class="detaill">
                            <p>Date: 12/12/2021</p>
                            <p>Consultant: Dr Muthu A/L Raj</p>
                            <p>Time: 3:00 P.M.</p>
                            <p>Platform: Google Meet</p>
                        </div>
                        <br><br>
                        <hr>
                        <div class="total"><b>Total price: RM50.00</b></div>
                        <br><br>
                    </div>
                    <div class="childd boxx2">
                        <b>Choose payment method:</b>
                        <br><br>
                        <form action="">
                            Credit / Debit cards:
                            <br>
                            <button type="submit" name="submitcard">&plus;Add Card Detail</button>
                        </form>
                        <br><br>
                        <form action="">
                            Online banking via FPX:
                            <br>
                            <img src="assets/img/fpx.png" alt="fpx"><br>
                            <button type="submit" name="submitcard">Pay</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        
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
