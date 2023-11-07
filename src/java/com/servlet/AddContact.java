/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet;

import com.conn.DbConnect;
import com.dao.ContactDAO;
import com.dao.UserDAO;
import com.entity.Contact;
import com.entity.User;

import java.io.IOException;
import javax.servlet.ServletException;


import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author DELL
 */
@WebServlet("/addContact")
public class AddContact extends HttpServlet{
    @Override
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
    {
        try{
        int userId=Integer.parseInt(request.getParameter("userid"));
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String phno=request.getParameter("phno");
        String about=request.getParameter("about");
        
        Contact c=new Contact(name,email,phno,about,userId);
        
        ContactDAO dao=new ContactDAO(DbConnect.getConn());
        boolean f=dao.saveContact(c);
        
        HttpSession session=request.getSession();
        if(f)
        {
            session.setAttribute("successMsg","Your contact Saved");
            response.sendRedirect("addContact.jsp");
        }
        else
        {
            session.setAttribute("failedMsg","Something Wrong on server");
            response.sendRedirect("addContact.jsp");
        }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
