<%-- 
    Document   : viewDepartment
    Created on : Jan 29, 2022, 11:30:36 PM
    Author     : zulhu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%ResultSet rs =null;%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>iCare | Doctors</title>
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
        border-collapse: collapse !important;
        }

        tr {
        border-bottom: 1pt solid black !important;
        }

        button{
            color: white;
            background-color: #3eb8bd;
            width: 80px;
            height: 30px;
            border-radius: 9px !important;
        }
        form button{
            color: white;
            background-color: #3eb8bd;
            width: 150px;
            height: 30px;
            border-radius: 9px !important;
        }
        .msg{
          text-align: center;
          background-color: #3eb8bd;
          color: white;
          padding: 15px;
        }
      

            a.hijau:hover, a.hijau:active {
              background-color: red;
            }
            a.hijau
            {
                background-color: #4CAF50; 
                color: white;
                padding: 10px;
                text-align: center;
                text-decoration: none;
                font-size: 12px;
                border-radius: 12px;
            }

            a.hijau:hover, a.hijau:active {
                background-color: greenyellow;
            }
            .center {
                    margin-left: auto;
                    margin-right: auto;
                  }

    </style>

</head>

<body>

    <%
        try{
        if((Integer)session.getAttribute("loggedIn")==3){

        try{
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "icare";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pass = "";

        Class.forName(driver); //2- Load & Register driver


        Connection con = DriverManager.getConnection(url, userName, pass);

        Statement statement = con.createStatement() ;

        rs =statement.executeQuery("select * from department") ;
    %>

        <%@include file="navbar_admin.jsp" %>
        <%
            String msg = request.getParameter("msg");
            if("successful".equals(msg))
            {
        %>
        <div class="msg">Data saved successfully!</div>
        <% }else if("deleted".equals(msg)){ %>
        <div class="msg" style="color:red">Department deleted successfully!</div>
        <% } %>

  <section id="faq" class="faq section-bg">
    <div class="container" data-aos="fade-up">

        <div class="section-title">
            <h2>List of Department</h2>
        </div>

        <a  href="addDep.jsp" class="hijau">Add Department</a>
        <br/><br/><br/>

        <table class="table center">
            <thead class="thead-dark">
                
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th colspan="2">Action</th>

            </tr>
             </thead>
            <%  while(rs.next()){ %>
                <tr>
                    <td><%= rs.getString(1)%></td>
                    <td><%= rs.getString(2)%></td>

                    <td><a href="departmentController?action=EDIT&id=<%= rs.getString(1)%>" >Edit</a></td>
                    <td><a href="departmentController?action=DELETE&id=<%= rs.getString(1)%>" onclick="return confirm('Are you sure you want to delete?')" >Delete</a></td>
 
                </tr>

            <% } %>
             

        </table>
        
    </div>
  </section>



  <%
            statement.close();
            con.close();
        }
        catch(Exception e)
        {
             out.println("wrong entry "+e);
        }
  %>

  <%@include file="footer.jsp" %>

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

