

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%ResultSet resultset =null;%>
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
        <%
        try{
        if((Integer)session.getAttribute("loggedIn")==1){
            
        Integer id =  (Integer) session.getAttribute("userLoginID");
        Integer appointmentID =  (Integer) session.getAttribute("appointmentID");
        
        try{
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "icare";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pass = "";
       
        Class.forName(driver); //2- Load & Register driver
        
        
        Connection con = DriverManager.getConnection(url, userName, pass); 

            Statement statement = con.createStatement() ;

            resultset =statement.executeQuery("select * from appointment where appointmentID=\'"+appointmentID+"\'") ;//change later using session
            resultset.next();
        %>
        
        <%@include file="navbar_guest.jsp" %>

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
                            <p>Date: <%= resultset.getString(3) %></p>
                            <p>Consultant: <%= resultset.getString(6) %></p>
                            <p>Time: <%= resultset.getString(4) %></p>
                            <p>Platform: <%= resultset.getString(7) %></p>
                        </div>
                        <br><br>
                        <hr>
                        <div class="total"><b>Total price: RM50.00</b></div>
                        <br><br>
                    </div>
                    <div class="childd boxx2">
                        <b>Pay using Credit/Debit cards:</b>
                        <br><br>
                        <form action="paymentController" method="post">
                            <label for="cardNo">Card Number:</label>
                            <br>
                            <input type="text" name="cardNo" class="form-control" required/>
                            
                            <br>
                            <label for="cvv">CVV Number:</label>
                            <br>
                            <input type="text" name="cvv" class="form-control" required/>
                            
                            <br>
                            <label for="expDate">Expiry Date:</label>
                            <br>
                            <input type="date" name="expDate" class="form-control datepicker" required/>
                            
                            <br><br>
                            <input type="text" name="total" class="form-control" value="50" hidden/>
                            
                            <button type="submit" name="submit" class="appointment-btn scrollto">Make a payment</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        
        <%

            }
            catch(Exception e)
            {
                 out.println("wrong entry"+e);
            }
        %>
        
        <%@include file="footer.jsp" %>
        
        <% }else{ %>
    <section id="appointmentPatient" class="appointmentPatient">
          <div class="container">
            <div class="section-title">
              <h2>Sorry, you have no access to this page !</h2>
            </div>
          </div>
    </section>
    <% 
        }}
        catch(Exception NullPointerException)
        {%>
          <section id="appointmentPatient" class="appointmentPatient">
            <div class="container">
              <div class="section-title">
                <h2>Sorry, you have no access to this page !</h2>
              </div>
            </div>
          </section>
       <% } %>
        
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
