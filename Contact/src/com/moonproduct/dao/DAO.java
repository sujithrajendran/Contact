package com.moonproduct.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.moonproduct.Util.DBConnectivity;
import com.moonproduct.bean.Bean;


public class DAO {
	Connection con=DBConnectivity.getDBConnection();
	public String contact(Bean bean) {
		String result="Fail";
		if(con!=null)
		{
		try
		{
			PreparedStatement pst=con.prepareStatement("insert into Contact(Name,Mnumber,Snumber,Address,Mail) values (?,?,?,?,?) ");
			pst.setString(1,bean.getName());
			pst.setString(2,bean.getMnumber());
			pst.setString(3,bean.getSnumber());
			pst.setString(4,bean.getAddress());
			pst.setString(5,bean.getMail());
			if(pst.executeUpdate()>0)
         {
         	result="done";
         }
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		} 
		
		}
		System.out.println(result);
		return result;
	}
	public String update(String name, String mnumber, String snumber, String address, String mail) {
		
		String result="FAIL";
		if(con!=null)
		{
			try 
			{
				PreparedStatement pst1=con.prepareStatement("update contact set Name='"+name+"', Mail='"+mail+"',Snumber='"+snumber+"', Address='"+address+"' where Mnumber='"+mnumber+"' ");
				if(pst1.executeUpdate()>0)
                {
                	result="success";
                }
		    }
			catch (SQLException e) 
			{
				e.printStackTrace();
			} 
	}
		System.out.println("result -" +result);
		System.out.println(name+" "+snumber+" "+address+" "+mail);
		return result;
	}
	public String delete(String mnumber) {
		String result="FAIL";
		if(con!=null)
		{
			try 
			{
				PreparedStatement pst1=con.prepareStatement("delete contact where mnumber='"+mnumber+"'");
				if(pst1.executeUpdate()>0)
                {
                	result="success";
                }
		    }
			catch (SQLException e) 
			{
				e.printStackTrace();
			} 
	}
		System.out.println("result -" +result);
		System.out.println(mnumber);
		return result;
	}
	public String search(String searchname, String mnumber) 
	{
		String result="fail";
		System.out.println("DAO search");
		if(con!=null)
		{
			try 
			{
				Statement st = con.createStatement();
				ResultSet rs=st.executeQuery("select mail from contact where name='"+searchname+"' and mnumber='"+mnumber+"'");
				while(rs.next())
				{
					result=rs.getString(1);
					
				}
			} 
			catch (SQLException e)
			{
				e.printStackTrace();
			}
		
			System.out.println("mail id--" + result);
	}
		return result;
	}
}

