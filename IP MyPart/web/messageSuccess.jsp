<%-- 
    Document   : messageSuccess
    Created on : Jan 27, 2022, 3:29:49 PM
    Author     : zulhu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
        <style>
          .msg
          {
            text-align: center;
            background-color: #3eb8bd;
            color: white;
            padding: 15px;
          }
      </style>
    </head>
    <body>
        <% 
            String msg = request.getParameter("msg");
            if("successful".equals(msg))
            {
        %>
        <div class="msg">Data saved successfully!</div>
        <% } %>
    </body>
</html>
