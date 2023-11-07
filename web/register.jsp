<%-- 
    Document   : register
    Created on : Nov 6, 2023, 9:42:33 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="component/allCss.jsp"%>
    </head>
    <body style="background-color: #f7faf8">
        <%@include file="component/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row p-5">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center text-success">Registration Page</h4>
                            
                            <%
                            String successMsg=(String)session.getAttribute("successMsg");
                            String errorMsg=(String)session.getAttribute("errorMsg");
                                
                            if(successMsg!=null)
                            {
                            %>
                            <p class="text-success text-center"><%=successMsg%></p>
                            <%
                            session.removeAttribute("successMsg");
                            }
                            
                            if(errorMsg!=null)
                            {
                            %>
                            <p class="text-danger text-center"><%=errorMsg%></p>
                            <%
                            session.removeAttribute("errorMsg");
                             }
                            %>
                            <form action="register" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputName">Enter Name</label>
                                        <input type="text" name="name" class="form-control" id="exampleInputName" aria-describedby="emailHelp">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" name="password" class="form-control" id="exampleInputPassword1">
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary">Register</button>
                                    </div>
                            </form>                                        
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="margin-top:72px">
            <%@include file="component/footer.jsp" %>
        </div>
    </body>
</html>
