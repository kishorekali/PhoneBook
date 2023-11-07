/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet;


import com.conn.DbConnect;
import com.dao.ContactDAO;
import java.io.IOException;
import java.sql.*;
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
@WebServlet("/delete")
public class DeleteContact extends HttpServlet{
    @Override
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
    {
        try{
        
        int cid=Integer.parseInt(request.getParameter("cid"));
         
	ContactDAO dao=new ContactDAO(DbConnect.getConn());
	
	boolean f=dao.deleteContactById(cid);
        HttpSession session=request.getSession();
        if(f)
        {
            session.setAttribute("successMsg","Contact Delete Succesfully");
            response.sendRedirect("viewContact.jsp");
        }
        else
        {
            session.setAttribute("errorMsg","Something Wrong on server");
            response.sendRedirect("viewContact.jsp");
        }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
