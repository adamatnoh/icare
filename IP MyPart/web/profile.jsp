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
       
        Class.forName(driver); //2- Load & Register driver
        
        
        Connection con = DriverManager.getConnection(url, userName, pass); 

            Statement statement = con.createStatement() ;

            resultset =statement.executeQuery("SELECT * FROM user WHERE userID ="+id) ;
            
        %>

        <%@include file="navbar_guest.jsp" %>
         
              <!-- ======= Contact Section ======= -->
                <section id="contact" class="contact">
                  <div class="container">

                    <div class="section-title">
                      <h2>Profile Information</h2>
                    </div>

                  </div>

                  <div class="container">

                    <div class="row mt-5">

                      <div class="col-lg-6">

                        <div class="row">
                          <div class="col-md-12">
                            <div class="info-box">
                              <i class="bx bx-map"></i>
                              <%  if(resultset.next()){ %>
                              <h3><%= resultset.getString(3)%></h3>
                              <p><%= resultset.getString(4)%></p>
                            </div>
                          </div>
                          <div class="col-md-6">
                            <div class="info-box mt-4">
                              <i class="bx bx-envelope"></i>
                              <i class="bx bx-phone-call"></i>
                              <h3>Email & No.</h3>
                              <p><%= resultset.getString(5)%><br><%= resultset.getString(6)%></p>
                            </div>
                          </div>
                          <div class="col-md-6">
                            <div class="info-box mt-4"> 
                              <i class="bx bx-user"></i>
                              <h3><%= resultset.getString(2)%></h3>
                              
                            </div>
                          </div>
                        </div>

                      </div>

                      <div class="col-lg-6">
                        <form action="profileControllers" method="post" >
                          <div class="row">
                            <div class="col form-group mt-3">
                              <input type="text" name="name" class="form-control" id="name" value='<%= resultset.getString(3)%>' required>
                            </div>
                            <div class="col form-group mt-3">
                              <input type="email" class="form-control" name="email" id="email" value='<%= resultset.getString(5)%>' required>
                            </div>
                          </div>
                          <div class="form-group mt-3">
                            <input type="text" class="form-control" name="mobile" id="mobile" value='<%= resultset.getString(6)%>' required>
                          </div>
                          <div class="form-group mt-3">
                            <input type="text" class="form-control" name="userAddress" id="userAddress" value='<%=resultset.getString(4)%>' required></input>
                            <% } %>
                          </div>
                          <br/>
                          <div class="text-center"><button button type="submit" name="submit" class="appointment-btn scrollto">Update Profile</button></div>
                        </form>
                      </div>

                    </div>

                  </div>
                </section><!-- End Contact Section -->

        
        <%

        }
        catch(Exception e)
        {
             out.println("Error:"+e);
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
