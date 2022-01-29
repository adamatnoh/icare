<%-- 
    Document   : index
    Created on : Jan 19, 2022, 12:52:31 AM
    Author     : hasifhafifi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%ResultSet rs =null;%>
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

        button{
            color: white;
            background-color: #3eb8bd;
            width: 80px;
            height: 30px;
            border-radius: 9px !important;
        }
        
        div1{
            width: 15%;
            float: left;
            height: 390px;
            background-color: #b2e4e6;
            margin: 20px;
            display: flex;
            padding: 10px;
            border: solid;
            border-color: #055160;
            border-radius: 10px;
            flex-direction: row;
        }
        
        .mid{
            margin-right: auto !important;
            margin-left: auto !important;
        }
        
        .box{
            padding-left: 150px;
        }
        
        .box2{
            padding-left: 500px;
        }
        
        .box2 img{
            width: 1100px;
            height: 650px;
        }
    </style>
    </head>
    <body>
        <% 
           Integer id =  (Integer) session.getAttribute("userLoginID"); 
           Integer loggedIn =  (Integer) session.getAttribute("loggedIn");
           
        try{
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "icare";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pass = "";

        Class.forName(driver); //2- Load & Register driver


        Connection con = DriverManager.getConnection(url, userName, pass);

        Statement statement = con.createStatement() ;

        rs =statement.executeQuery("select doctor.*, department.* from doctor inner join department on doctor.departmentID=department.departmentID") ;
        %>

        <%
            if(loggedIn != null)
            {
        %>
        <%
        if(loggedIn==1){ 
        %>
            <%@include file="navbar_guest.jsp" %>
        <% 
            }else if(loggedIn==2) {
        %>
            <%@include file="navbar_receptionist.jsp" %>   
        <% 
            }else{
        %>
            <%@include file="navbar_admin.jsp" %>
        <% } %>
        
        <%@include file="messageSuccess.jsp" %>
        <%--@include file="dashboard.jsp" --%>
        </br></br>
        
        <div class="mid box2">
            <img src="assets/img/slide/slide-1.jpg" alt="dr">
        </div>
        <br><br>
        <div class="section-title">
            <h2>Doctor List</h2>
        </div>
       
        <%  while(rs.next()){ %>
        <% if(rs.getString(6).contentEquals("Yes")){ %>
        <div class="mid box">
            <div1 class="dr1"> 
                <div class="mid">
                    <i class="fas fa-user"></i>
                    <b> <%= rs.getString(2)%></b></br></br>
                    Grade: </br>
                    <%= rs.getString(2)%></br></br>
                    Specialist in: </br>
                    <%= rs.getString(9)%></br></br>
                    Email: </br>
                    <%= rs.getString(4)%> </br></br>
                    Phone Number: </br>
                    <%= rs.getString(5)%> </br></br> 
                    
                    <% if(loggedIn==3){ %>
                    <form name="editDr" method="post" action="drProfile.jsp">
                        <input type="hidden" id="doctorID" name="doctorID" value=<%= rs.getString(1)%>>
                        <td><button type="submit" value="details">Update</button></td>
                    </form>
                    <br>
                    <% } %>
                </div>
            </div1>
        </div>
        <% } %>
        <% } %>
        
        <%
            }
            else{
                RequestDispatcher rd  = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            }
        %>
        
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
