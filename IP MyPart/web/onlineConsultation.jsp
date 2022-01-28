

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<%ResultSet resultDr =null;%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>iCare | Online Consultation</title>
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
        <!--link rel="stylesheet" href="assets/css/onlineConsultation.css"-->
    </head>
    <body>
        <%
        try{
        if((Integer)session.getAttribute("loggedIn")==1){  
            
   
            
        %>
        
        <%@include file="navbar_guest.jsp" %>

        <section id="appointment" class="appointment section-bg">
            <div class="container" >

                <div class="section-title">

                 <h2>Online Consultation</h2>
                 <p>Please enter the details as requested.</p>
               </div>
                
                <form action="appointmentController" method="post" >

                    <div class="row">
                        <div class="col-md-4 form-group mt-3">
                            <label for="appointdate">Appointment Date</label>
                            <input type="date" name="appointdate" class="form-control datepicker" id="appointdate" required>
                        </div>

                        <div class="col-md-4 form-group mt-3">
                            <label for="appointtime">Appointment Time</label>
                            <input type="time" name="appointtime" class="form-control " id="appointtime" min="09:00" max="18:00"  required>
                            <small>Office hours are 9am to 6pm</small>
                        </div>

                        <br/><br/>

                         <div class="col-md-4 form-group mt-3">
                            <label for="appointdepartment">Appointment Department</label>
                            <br/>
                            <select name="appointdepartment" id="department" class="btn btn-success dropdown-toggle">  
                                <option>Select Department</option>
                            </select>
                        </div>
    

                        <div class="col-md-4 form-group mt-3">
                            <label for="appointdoctor">Appointment Doctor</label>
                            <br/>
                                <select name="appointdoctor" id="doctor" class="btn btn-success dropdown-toggle">  
                                    <option>Select Doctor</option>
                                </select>

                        </div> 
                                
                        <div class="col-md-4 form-group mt-3">
                            <label for="platform">Meeting Platform</label>
                            <br/>
                            <select name="platform" class="btn btn-success dropdown-toggle">   
                                <option value="googleMeet">Google Meet</option>
                                <option value="webex">Webex</option>
                                <option value="zoom">Zoom</option>
                                <option value="whatsapp">Whatsapp</option>
                            </select>
<!--                            <input type="text" name="platform" class="form-control" id="platform">-->
                        </div> 

                        <div class="form-group mt-3">
                          <textarea class="form-control" name="message" rows="5" placeholder="Message (Optional)"></textarea>
                        </div>
                    </div>
                    <br/>
                    <input type="text" name="appointmentType" value="online" hidden/>
                  <div class="text-center"><button type="submit" name="submit" class="appointment-btn scrollto">Book Online Consultation</button></div>
                </form>
            </div>
        </section>
        

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
          <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var depid='';
                $.ajax({
                    url: "DepartmentDoctorServlet",
                    method: "GET",
                    data: {operation: 'department'},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        let obj = $.parseJSON(data);
                        $.each(obj, function (key, value) {
                            $('#department').append('<option value="' + value.departmentID  + '">' + value.departmentName + '</option>');
                        });
                       // $('select').formSelect();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $('#department').append('<option>Department Unavailable</option>');
                    },
                    cache: false
                });


                $('#department').change(function () {
                    $('#doctor').find('option').remove();
                    $('#doctor').append('<option>Select Doctor</option>'); 

                    let cid = $('#department').val();
                    let data = {
                        operation: "doctor",
                        id: cid
                    };

                    $.ajax({
                        url: "DepartmentDoctorServlet",
                        method: "GET",
                        data: data,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            let obj = $.parseJSON(data);
                            $.each(obj, function (key, value) {
                                $('#doctor').append('<option value="' + value.name + '">' + value.name + '</option>');
                            });
                            //$('select').formSelect();
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $('#doctor').append('<option>Doctor Unavailable</option>');
                        },
                        cache: false
                    });
                });
                
    

            });
        </script>
    </body>
</html>

