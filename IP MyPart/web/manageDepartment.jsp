<%-- 
    Document   : manageDepartment
    Created on : Jan 13, 2022, 4:26:34 PM
    Author     : Asus VivoBook S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>iCare | Manage Department</title>
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
        border-collapse: collapse;
        text-align:center;
        }

        tr {
        border-bottom: 1pt solid black;
        }

        button{
            color: white;
            background-color: #3eb8bd;
            width: 80px;
            height: 30px;
            border-radius: 9px;
        }
        
    </style>
    
 </head>

 <body>
        <%@include file="navbar_admin.jsp" %>
        
        </br></br>
        <div class="section-title">
            <h2>Manage Department</h2>
        </div>
        
        <form action="">
            <input type="text" placeholder="Search" name="search" style="background-color: #cef7f8; border-radius:9px;">
            <button type="submit"><i class="fa fa-search"></i></button>
        </form>
        <br><br>

        <table width="100%">
            <tr>
                <th>No</th>
                <th>Department Name</th>
                <th>Number of Doctors</th>
                <th>Manage Department</th>
            </tr>
            
            <tr>
                <td>1</td>
                <td>Accident and Emergency</td>
                <td>23</td>
                <td><a class="btn btn-default" href="manageDr.jsp" style="background-color:#3eb8bd"> View List of Doctors</a></td>
            </tr>
             <tr>
                <td>2</td>
                <td>Cardiology</td>
                <td>10</td>
                <td><a class="btn btn-default" href="manageDr.jsp" style="background-color:#cef7f8"> View List of Doctors</a></td>
            </tr>
             <tr>
                <td>3</td>
                <td>Endocerinology</td>
                <td>8</td>
                <td><a class="btn btn-default" href="manageDr.jsp" style="background-color:#3eb8bd"> View List of Doctors</a></td>
            </tr>
             <tr>
                <td>4</td>
                <td>General Paediatrics</td>
                <td>8</td>
                <td><a class="btn btn-default" href="manageDr.jsp" style="background-color:#cef7f8"> View List of Doctors</a></td>
            </tr>
             <tr>
                <td>5</td>
                <td>General Surgery</td>
                <td>12</td>
                <td><a class="btn btn-default" href="manageDr.jsp" style="background-color:#3eb8bd"> View List of Doctors</a></td>
            </tr>
             <tr>
                <td>6</td>
                <td>Neurology</td>
                <td>23</td>
                <td><a class="btn btn-default" href="manageDr.jsp" style="background-color:#cef7f8"> View List of Doctors</a></td>
            </tr>
             <tr>
                <td>7</td>
                <td>Neurosurgery</td>
                <td>53</td>
                <td><a class="btn btn-default" href="manageDr.jsp" style="background-color:#3eb8bd"> View List of Doctors</a></td>
            </tr>
             <tr>
                <td>8</td>
                <td>Radiology and Imaging</td>
                <td>13</td>
                <td><a class="btn btn-default" href="manageDr.jsp" style="background-color:#cef7f8"> View List of Doctors</a></td>
            </tr>
             <tr>
                <td>9</td>
                <td>Respiratory Medicine</td>
                <td>9</td>
                <td><a class="btn btn-default" href="manageDr.jsp" style="background-color:#3eb8bd"> View List of Doctors</a></td>
            </tr>
             <tr>
                <td>10</td>
                <td>Vascular Surgery</td>
                <td>5</td>
                <td><a class="btn btn-default" href="manageDr.jsp" style="background-color:#cef7f8"> View List of Doctors</a></td>
            </tr>
        </table>
        
        
    </body>
</html>
