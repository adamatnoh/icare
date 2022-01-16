

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>iCare | Registration</title>
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
        <link rel="stylesheet" href="assets/css/register.css">
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
                <li><a class="nav-link scrollto" href="registration.jsp">Registration</a></li>
                </ul>
                <i class="bi bi-list mobile-nav-toggle"></i>
            </nav><!-- .navbar -->
            <a href="login.jsp" class="appointment-btn scrollto"><span class="d-none d-md-inline">Login</a>
            </div>
        </header>
        <!-- End Header -->

        <section id="registration">
            <div class="container d-flex align-items-center">
                <div class="insidecontainer">
                    <div class="insidecontainer-child">
                        <h2 class="title">REGISTRATION</h2>
                        <br>
                        <form action="registrationController" method="post" name="registerform">
                            <label for="userType">User Type: </label>
                            <select name="userType">
                                 <option value="guest">Guest</option>
                                 <option value="receptionist">Receptionist</option>
                            </select> </br></br>
                            <label for="name">Name</label><br>
                            <input type="text" name="name" class="form-control" placeholder="Your Name" required/><br>
                            <label for="address">Address</label><br>
                            <input type="text" name="address" class="form-control" placeholder="Your Address" required/><br>
                            <label for="email">Email</label><br>
                            <input type="email" name="email" class="form-control" placeholder="Your Email" required/><br>
                            <label for="mobile">Mobile No</label><br>
                            <input type="tel" name="mobile" class="form-control" placeholder="012-3456789" pattern="[0-9]{3}-[0-9]{7}" required/><br>
                            <label for="password">Password</label><br>
                            <input type="password" name="password" class="form-control" placeholder="Your Password" required/><br>
        
                            <center>
                            <button type="submit" name="submit" value="SIGN UP">SIGN UP</button>
                            </center>
                        </form>
                        <center>
                        <div>Already have an account? Click <a href="login.jsp">here.</a></div>
                        </center>
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

