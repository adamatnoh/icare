<%-- 
    Document   : messagesignout
    Created on : Jan 27, 2022, 4:33:38 PM
    Author     : hasifhafifi
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
          .msgwrong
          {
            text-align: center;
            background-color: #3eb8bd;
            color: red;
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
        <div class="msg">Successfully Signed Out!</div>
        <% } else if("wrong".equals(msg)){ %>
            <div class="msgwrong">Wrong Detail!</div>
        <%}%>
    </body>
</html>
