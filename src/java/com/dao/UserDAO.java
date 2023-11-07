/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import java.sql.Connection;
import java.sql.*;
import com.entity.User;
/**
 *
 * @author DELL
 */
public class UserDAO {
    private Connection conn;
    
    public UserDAO(Connection conn)
    {
        super();
        this.conn=conn;
    }
    
    public boolean userRegister(User u)
    {
        boolean f=false;
        try
        {
            String sql="insert into user(name,email,password)values(?,?,?)";
            
            PreparedStatement pst=conn.prepareStatement(sql);
            pst.setString(1,u.getName());
            pst.setString(2,u.getEmail());
            pst.setString(3,u.getPassword());
            
            int i=pst.executeUpdate();
            if(i==1)
            {
                f=true;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
     public User loginUser(String e,String p)
    {
        User user=null;
        try
        {
            String sql="select * from user where email=? and password=?";
            
            PreparedStatement pst=conn.prepareStatement(sql);
            pst.setString(1,e);
            pst.setString(2,p);
            
            ResultSet rs=pst.executeQuery();
            
            while(rs.next())
            {
                user=new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setPassword(rs.getString(4));
            }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        return user;
    }

}

