<%-- 
    Document   : addContact
    Created on : Nov 6, 2023, 9:43:33 PM
    Author     : DELL
--%>

<%@page import="com.entity.Contact"%>
<%@page import="com.dao.ContactDAO"%>
<%@page import="com.conn.DbConnect"%>
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
                            String failedMsg=(String)session.getAttribute("failedMsg");
                                
                            
                            if(failedMsg!=null)
                            {
                            %>
                            <p class="text-danger text-center"><%=failedMsg%></p>
                            <%
                            session.removeAttribute("failedMsg");
                             }
                            %>
                            <form>
  
                                    <%
                                        int cid=Integer.parseInt(request.getParameter("cid"));
                                        ContactDAO dao=new ContactDAO(DbConnect.getConn());
                                        Contact c=dao.getContactByID(cid);
                                    %>
                                    <div class="form-group">
                                        <label for="exampleInputName1">Enter Name</label>
                                        <input type="text" value="<%=c.getName()%>" name="name" class="form-control" id="exampleInputName1" aria-describedby="emailHelp">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail11">Email address</label>
                                        <input type="email" value="<%=c.getEmail()%>" name="email" class="form-control" id="exampleInputEmail11" aria-describedby="emailHelp">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPhoneNo1">Enter Phone No</label>
                                        <input type="text" value="<%=c.getPhno()%>" name="phno" class="form-control" id="exampleInputPhoneNo1" aria-describedby="emailHelp">
                                    </div>    
                                    <div class="form-group">
                                        <textarea rows="3" cols="" name="about" class="form-control" placeholder="Enter About"><%=c.getAbout()%></textarea>
                                    </div>      
                                    <div class="text-center">  
                                        <button type="submit" class="btn white"><a href="viewContact.jsp">Update Contact</a></button>
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

