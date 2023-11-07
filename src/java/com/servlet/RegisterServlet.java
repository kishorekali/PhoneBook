/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet;

import com.conn.DbConnect;
import com.entity.User;
import com.dao.UserDAO;

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
@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
    @Override
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
    {
        try{
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        
        User u=new User(name,email,password);
        UserDAO dao=new UserDAO(DbConnect.getConn());
        boolean f=dao.userRegister(u);
        
        HttpSession session=request.getSession();
        if(f)
        {
            session.setAttribute("successMsg","User Register Succesfully");
            response.sendRedirect("register.jsp");
        }
        else
        {
            session.setAttribute("errorMsg","Something Wrong on server");
            response.sendRedirect("register.jsp");
        }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
