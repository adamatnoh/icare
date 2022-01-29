<%-- 
    Document   : editDepartment
    Created on : Jan 30, 2022, 12:29:22 AM
    Author     : zulhu
--%>

<%-- 
    Document   : drProfile
    Created on : Jan 19, 2022, 12:38:11 AM
    Author     : adamn
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
        try{
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "icare";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pass = "";
       
        Class.forName(driver); //2- Load & Register driver
        
        
        Connection con = DriverManager.getConnection(url, userName, pass); 

            Statement statement = con.createStatement() ;
            String id= (String) session.getAttribute("depID");

            resultset =statement.executeQuery("select * from department where departmentID="+id) ;
            
        %>

        <%@include file="navbar_admin.jsp" %>
         
              <!-- ======= Contact Section ======= -->
                <section id="contact" class="contact">
                  <div class="container">

                    <div class="section-title">
                      <h2>Department Information</h2>
                    </div>

                  </div>

                  <div class="container">

                    <div class="row mt-5">

                      <div class="col-lg-6">

                        <div class="row">
                          <div class="col-md-12">
                            <div class="info-box">
                              <i class="bx bx-user"></i>
                              <%  if(resultset.next()){ %>
                              <h3>Department Name</h3>
                              <p><%= resultset.getString(2)%></p>
                            </div>
                          </div>  
                        </div>

                      </div>

                      <div class="col-lg-6">
                        <form action="departmentController?action=UPDATE" method="post">
                          <div class="row">
                            <div class="col form-group mt-3">
                              <h6>Name</h6>
                              <input type="text" name="depName" class="form-control" id="depName" value='<%= resultset.getString(2)%>' required>
                            </div>
                            
                          <div class="row">
                            <div class="col form-group mt-3 mx-3">
                                <input type="hidden" id="depID" name="depID" value=<%= resultset.getString(1)%>>
                                <div class="text-center"><button button type="submit" name="submit" class="appointment-btn scrollto">Update Department</button></div>
                        
                            </div>
   
                          </div>
                        </div>
                        </form>
                    </div>

                  </div>
                </section><!-- End Contact Section -->

        
        <%
            }
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

