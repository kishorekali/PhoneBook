<%-- 
    Document   : viewContact
    Created on : Nov 6, 2023, 9:43:44 PM
    Author     : DELL
--%>

<%@page import="java.util.List"%>
<%@page import="com.dao.ContactDAO"%>
<%@page import="com.entity.Contact"%>
<%@page import="com.conn.DbConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="component/allCss.jsp"%>
        <style type="text/css">
            .crd-ho:hover{
                background-color:#f7f7f7;
            }
        </style>
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
        
        <%
            String successMsg=(String)session.getAttribute("successMsg");
            String errorMsg=(String)session.getAttribute("errorMsg");
            if(successMsg!=null){
            %>
            <div class="alert alert-success" role="alert"><%=successMsg%></div>
            <%
            session.removeAttribute("successMsg");
            }
            if(errorMsg!=null){
            %>
            <p class="text-danger text-center" ><%=errorMsg%></div>
            <%
            session.removeAttribute("errorMsg");
            }
         %>
            
        <div class="container">
            <div class="row p-4">
                    
                    <%
                        if(user!=null)
                        {
                        ContactDAO dao=new ContactDAO(DbConnect.getConn());
                        List<Contact> contact=dao.getAllContact(user.getId());
                        
                        for(Contact c:contact)
                        {%>
                        <div class="col-md-3">
                        <div class="card crd-ho">
                        <div class="card-body">
                            <h5>
                                Name:
                                <%=c.getName()%></h5>
                            <p>
                                Ph no:
                                <%=c.getPhno()%></p>
                            <p>
                                Email:
                                <%=c.getEmail()%></p>
                            <p>
                                About:
                                <%=c.getAbout()%></p>
                            <div class="text-center">
                                <a href="editContact.jsp?cid=<%=c.getId()%>" class="btn btn-success btn-sm text-white">Edit</a>
                                <a href="delete?cid=<%=c.getId()%>" class="btn btn-danger btn-sm text-white">Delete</a>
                            </div>
                        </div>
                    </div>
                </div>                            
                <%     
                }
                }
                %>
                        
                    
            </div>
        </div>
    </body>
</html>
