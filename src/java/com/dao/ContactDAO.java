/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import java.sql.Connection;
import java.sql.*;
import com.entity.Contact;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author DELL
 */
public class ContactDAO {
    private Connection conn;
    
    public ContactDAO(Connection conn)
    {
        super();
        this.conn=conn;
    }
    
    public boolean saveContact(Contact c)
    {
        boolean f=false;
        try
        {
            String sql="insert into contact(name,email,phno,about,userid)values(?,?,?,?,?)";
            
            PreparedStatement pst=conn.prepareStatement(sql);
            pst.setString(1,c.getName());
            pst.setString(2,c.getEmail());
            pst.setString(3,c.getPhno());
            pst.setString(4,c.getAbout());
            pst.setInt(5,c.getUserId());
            
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
    
    public List<Contact> getAllContact(int uId)
    {
        List<Contact> list=new ArrayList<>();
        Contact c=null;
        try
        {
            String sql="select * from contact where userid=?";
            
            PreparedStatement pst=conn.prepareStatement(sql);
            pst.setInt(1,uId);
            
            ResultSet rs=pst.executeQuery();
            while(rs.next())
            {
                c=new Contact();
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                c.setEmail(rs.getString(3));
                c.setPhno(rs.getString(4));
                c.setAbout(rs.getString(5));
                list.add(c);
            }

        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return list;

    }
    
    
    public Contact getContactByID(int cid)
    {
        Contact c=new Contact();
        try
        {
            String sql="select * from contact where id=?";
            
            PreparedStatement pst=conn.prepareStatement(sql);
            pst.setInt(1,cid);
            
            ResultSet rs=pst.executeQuery();
            while(rs.next())
            {
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                c.setEmail(rs.getString(3));
                c.setPhno(rs.getString(4));
                c.setAbout(rs.getString(5));
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return c;
    }
    
    public boolean deleteContactById(int cid)
    {
        boolean f=false;
        try
        {
            String sql="delete from contact where id=?";
            
            PreparedStatement pst=conn.prepareStatement(sql);
            pst.setInt(1,cid);
            
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

   
}

