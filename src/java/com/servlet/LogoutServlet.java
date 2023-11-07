/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;
import javax.servlet.ServletException;
/**
 *
 * @author DELL
 */
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet{
    @Override
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException
    {
        HttpSession session=request.getSession();
        session.removeAttribute("user");
        
        HttpSession session2=request.getSession();
        session2.setAttribute("logMsg", "Logout Successfully...");
        
        response.sendRedirect("login.jsp");
        
    }
}
