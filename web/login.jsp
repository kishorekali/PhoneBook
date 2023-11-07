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
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center text-success">Login Page</h4>
                            <%
                            String invalidMsg=(String)session.getAttribute("invalidMsg");
                            if(invalidMsg!=null)
                            {%>
                            <p class="text-danger text-center"><%=invalidMsg%></p>
                            <%
                            session.removeAttribute("invalidMsg");    
                            }
                            %>
                            <%
                            String logMsg=(String)session.getAttribute("logMsg");
                            if(logMsg!=null)
                            {%>
                            <p class="text-success text-center"><%=logMsg%></p>
                            <%
                            session.removeAttribute("logMsg");    
                            }
                            %>                            
                            <form method="post" action="login">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" name="password" class="form-control" id="exampleInputPassword1">
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary">Login</button>
                                    </div>
                                </form>                                        
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="margin-top:160px">
            <%@include file="component/footer.jsp" %>
        </div>
    </body>
</html>
