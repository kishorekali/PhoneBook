<%-- 
    Document   : index
    Created on : Nov 6, 2023, 9:36:44 PM
    Author     : DELL
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="component/allCss.jsp"%>
        <style type="text/css">
            .back-img{
                background: url("img/phonebook1.jpg");
                width:100%;
                height:85vh;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
    </head>
    <body>
        
        <%@include file="component/navbar.jsp" %>
        <div class="container-fluid back-img text-center text-success">
            <h1>Welcome to PhoneBook App</h1>
        </div>
        <%@include file="component/footer.jsp" %>
    </body>
</html>