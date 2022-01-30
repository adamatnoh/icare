<%-- 
    Document   : profile
    Created on : Jan 6, 2022, 9:34:59 PM
    Author     : zulhusni
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
      <style>
       
            .hijau
            {
                background-color: #4CAF50; 
                color: white;
                padding: 10px;
                text-align: center;
                text-decoration: none;
                font-size: 12px;
                border-radius: 12px;
            }
            a.merah
            {
                background-color: #f44336; 
                color: white;
                padding: 10px;
                text-align: center;
                text-decoration: none;
                font-size: 12px;
                border-radius: 12px;
            }
            .hijau:hover, .hijau:active {
                background-color: greenyellow;
            }
            .merah:hover, .merah:active {
                background-color: lightcoral;
            }
            

        </style>

    </head>
    
    <body>
        
        <%
            try{
        if((Integer)session.getAttribute("loggedIn")==1){
            Integer id =  (Integer) session.getAttribute("userLoginID");
        try{
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "icare";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pass = "";
        int nombor=1;
       
        Class.forName(driver); //2- Load & Register driver
        
        
        Connection con = DriverManager.getConnection(url, userName, pass); 

            Statement statement = con.createStatement() ;

            resultset =statement.executeQuery("SELECT * FROM appointment WHERE status!='finished' AND userID="+id) ;
            
        %>

        <%@include file="navbar_guest.jsp" %>
        <%@include file="messageSuccess.jsp" %>
        
         
        <!-- ======= Contact Section ======= -->
                <section id="appointmentPatient" class="appointmentPatient">
                  <div class="container">

                    <div class="section-title">
                      <h2>Appointment List</h2>
                    </div>

                  </div>
                    <div class="container">
                    <table class="table table-hover">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Type</th>
                                <th scope="col">Date</th>
                                <th scope="col">Time</th>
                                <th scope="col">Department</th>
                                <th scope="col">Doctor's Name</th>
                                <th scope="col">Status</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%  while(resultset.next()){ %>
                            <tr>
                            <th scope="row"><%= nombor++ %></th>
                                <td><%= resultset.getString(2)%></td>
                                <td><%= resultset.getString(3)%></td>
                                <td><%= resultset.getString(4)%></td>
                                <td><%= resultset.getString(5)%></td>
                                <td><%= resultset.getString(6)%></td>
                                <td><%= resultset.getString(8)%></td>
                                <td><%
                                    if ("Pending".equals(resultset.getString(8)))
                                    {%>
                                        <a href="appointmentController?action=DELETE&id=<%= resultset.getString(1)%>&type=<%= resultset.getString(2)%>" onclick="return confirm('Are you sure you want to cancel?')" class="hijau">Cancel Appointment</a>
                                    <%}
                                    else if ("Rejected".equals(resultset.getString(8)))
                                    {%>
                                        <a href="appointmentController?action=DELETE&id=<%= resultset.getString(1)%>" onclick="return confirm('Are you sure you want to delete?')" class="merah">Delete</a>
                                    <%}   

                                    %></td>
                            </tr>
                           <% } %>
                        </tbody>
                    </table>
                        <br/>
                        <a href="appointmentHistoryPatient.jsp" class="appointment-btn scrollto" type="button" >View Appointment History</a>
                    </div>
                        
                </section>
                
                  

        
        <%

        }
        catch(Exception e)
        {
             out.println("Error:"+e);
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
