<%-- 
    Document   : addContact
    Created on : Nov 6, 2023, 9:43:33 PM
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
    <body>
        <%@include file="component/navbar.jsp" %>
            <%
            if(user==null)
            {
                session.setAttribute("invalidMsg","Login please..");
                response.sendRedirect("login.jsp");
            }
            %>
        <div class="container-fluid">
            <div class="row p-4">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center text-success">Add Contact Page</h4>
                            <%
                            String successMsg=(String)session.getAttribute("successMsg");
                            String failedMsg=(String)session.getAttribute("failedMsg");
                                
                            if(successMsg!=null)
                            {
                            %>
                            <p class="text-success text-center"><%=successMsg%></p>
                            <%
                            session.removeAttribute("successMsg");
                            }
                            
                            if(failedMsg!=null)
                            {
                            %>
                            <p class="text-danger text-center"><%=failedMsg%></p>
                            <%
                            session.removeAttribute("failedMsg");
                             }
                            %>
                            <form action="addContact" method="post">
                                    <%
                                        if(user!=null)
                                        {%>
                                        <input type="hidden" value="<%=user.getId()%>" name="userid">
                                        <%}
                                    %>
                                    <div class="form-group">
                                        <label for="exampleInputName">Enter Name</label>
                                        <input type="text" name="name" class="form-control" id="exampleInputName" aria-describedby="emailHelp">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPhoneNo">Enter Phone No</label>
                                        <input type="text" name="phno" class="form-control" id="exampleInputPhoneNo" aria-describedby="emailHelp">
                                    </div>    
                                    <div class="form-group">
                                        <textarea rows="3" cols="" name="about" class="form-control" placeholder="Enter About"></textarea>
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
        <div style="margin-top:20px">
            <%@include file="component/footer.jsp" %>
        </div>
    </body>
</html>
