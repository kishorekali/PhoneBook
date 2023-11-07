/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet;

import com.conn.DbConnect;
import com.dao.UserDAO;
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
@WebServlet("/login")
public class LoginServlet extends HttpServlet{
    @Override
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
    {
        try{
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        
        UserDAO dao=new UserDAO(DbConnect.getConn());
        User u=dao.loginUser(email,password);
        
        HttpSession session=request.getSession();
        if(u!=null)
        {
            session.setAttribute("user", u);
            response.sendRedirect("index.jsp");
        }
        else
        {
            session.setAttribute("invalidMsg", "Invalid Email & Password");
            response.sendRedirect("login.jsp");
        }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
