<%-- 
    Document   : login
    Created on : Jan 7, 2022, 4:12:53 PM
    Author     : Asus VivoBook S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>iCare | Login</title>
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
        <header id="header">
            <div class="container d-flex align-items-center">

            <a href="index.html" class="logo me-auto"><img src="assets/img/icare.jpg" alt=""></a>

           <nav id="navbar" class="navbar order-last order-lg-0">
                <ul>
                <li><a class="nav-link scrollto" href="registration.jsp">Login</a></li>
                </ul>
                <i class="bi bi-list mobile-nav-toggle"></i>
            </nav><!-- .navbar -->

            <a href="registration.jsp" class="appointment-btn scrollto"><span class="d-none d-md-inline">Register</a>

            </div>
        </header>
        <!-- End Header -->

        <section id="login">
            <div class="container d-flex align-items-center">
                <div class="insidecontainer">
                    <div class="insidecontainer-child">
                        <h2 class="title">WELCOME TO iCare!</h2>
                        <br>
                        <form action="loginController" method="post">
        
                            <label for="name">Login as:</label>
                            <select id="user" name="userType">
                            <option value="guest">Guest</option>
                            <option value="receptionist">Receptionist</option>
                            <option value="admin">Admin</option>
                            </select> </br></br>
                         
                            <label for="email">Email</label><br>
                            <input type="email" name="email" class="form-control" required/><br>
    
                            <label for="password">Password</label><br>
                            <input type="password" name="password" class="form-control"  required/><br>
        
                            <center>
                            <button type="submit" name="submit" value="Login">LOGIN</button>
                        </form>
                        
                        <div>New user? Click <a href="registration.jsp">here.</a></div>
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
