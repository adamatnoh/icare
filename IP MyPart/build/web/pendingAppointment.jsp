<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%ResultSet rs =null;%>
<!DOCTYPE html>
<html lang="en">

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

    </style>

</head>

<body>

    <%
        try{
        if((Integer)session.getAttribute("loggedIn")==2){

        try{
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "icare";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pass = "";

        Class.forName(driver); //2- Load & Register driver


        Connection con = DriverManager.getConnection(url, userName, pass);

        Statement statement = con.createStatement() ;

        rs =statement.executeQuery("select appointment.*, user.* from appointment inner join user on appointment.userID=user.userID where appointment.status='Pending'") ;
    %>

        <%@include file="navbar_receptionist.jsp" %>
        <%
            String msg = request.getParameter("msg");
            if("successful".equals(msg))
            {
        %>
        <div class="msg">Data saved successfully!</div>
        <% }else if("deleted".equals(msg)){ %>
        <div class="msg" style="color:red">Account deleted successfully!</div>
        <% } %>

  <section id="faq" class="faq section-bg">
    <div class="container" data-aos="fade-up">

        <div class="section-title">
            <h2>Pending Appointment</h2>
        </div>

        <br>

        <table width="100%">
            <tr>
                <th>Time</th>
                <th>Date</th>
                <th>Patient</th>
                <th>Phone No</th>
                <th>Appointment Details</th>
                <th>Status</th>
                <th>Patient Details</th>
                
            </tr>
            <%  while(rs.next()){ %>
                <tr>
                    <td><%= rs.getString(4)%></td>
                    <td><%= rs.getString(3)%></td>
                    <td><%= rs.getString(13)%></td>
                    <td><%= rs.getString(16)%></td>
                    <td><%= rs.getString(9)%></td>
                    <%
                        if(rs.getString(8).contentEquals("Approved"))
                    {%>
                            <td><div style="color: green;">Approved</div></td>
                    <%}
                        else if(rs.getString(8).contentEquals("Rejected"))
                    {%>
                            <td><div style="color: #807512;">Rejected</div></td>
                    <%}
                        else if(rs.getString(8).contentEquals("Finished"))
                    {%>
                            <td><div style="color: blue;">Finished</div></td>
                    <% }else{ %>
                            <td><div style="color: red;">Pending</div></td>
                    <% } %>
             
                <form name="approval" method="post" action="approval.jsp">
                    <input type="hidden" id="appointmentID" name="appointmentID" value=<%= rs.getString(1)%>>
                    <td><button type="submit" value="details"><i class="fas fa-user"></i>&nbsp&nbspmore</button></td>
                </form>
                </tr>

            <% } %>
        </table>
        <br>
        <form action="bookappointment.jsp" method="post">
            <button type="submit">Add New Appointment</button>
        </form>
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
