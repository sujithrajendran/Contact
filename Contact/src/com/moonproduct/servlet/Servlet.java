package com.moonproduct.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.moonproduct.bean.Bean;
import com.moonproduct.dao.DAO;


/**
 * Servlet implementation class FoodServlet
 */
@WebServlet("/Servlet")
	
public class Servlet extends HttpServlet{

		private static final long serialVersionUID = 1L;
	       
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			HttpSession session=request.getSession();
			String page=(String) session.getAttribute("contact");
			DAO dao=new DAO();
			String result="";
			PrintWriter out = response.getWriter();
			if(page.equals("display"))
			{
			   //System.out.println("Servlet");
		       String name=request.getParameter("Name");
		       String mnumber=request.getParameter("Number");
		       String snumber=request.getParameter("Snumber");
		       String address=request.getParameter("Address");
		       String mail=request.getParameter("Email");
		       if(mnumber.length()==10 && snumber.length()==10)
		       {
		       Bean bean=new Bean();
		       bean.setName(name);
               bean.setMnumber(mnumber);
               bean.setSnumber(snumber);
               bean.setAddress(address);
               bean.setMail(mail);
               //System.out.println(name+" "+mnumber+" "+snumber+" "+address+" "+mail);
               result=dao.contact(bean);
               if(result.equals("done"))
   			   {
   			out.println("<script type=\"text/javascript\">");
   			out.println("alert('Added Successfully');");
   			out.println("location='Home.jsp';");
   			out.println("</script>");
   			}
   			else 
   			{
   				out.println("<script type=\"text/javascript\">");
   				out.println("alert('mobile number & mail already exist!!!');");
   				out.println("location='Add.jsp';");
   				out.println("</script>");
   			}
		       }
		       else 
	   			{
	   				out.println("<script type=\"text/javascript\">");
	   				out.println("alert('Enter 10 digit mobile number');");
	   				out.println("location='Add.jsp';");
	   				out.println("</script>");
	   			}
		       
   } 
			else if(page.equals("update"))
			   {
				   System.out.println("update");
					String name=request.getParameter("Name");
				       String mnumber=request.getParameter("Number");
				       String snumber=request.getParameter("Snumber");
				       String address=request.getParameter("Address");
				       String mail=request.getParameter("Mail");
				       System.out.println(""+name +""+mnumber+" "+snumber+" "+address+" "+mail);
					result=dao.update(name,mnumber,snumber,address,mail);
					if(result.equalsIgnoreCase("success"))	
					   {
						out.println("<script type=\"text/javascript\">");
						out.println("alert('contact updated successfully');");
						out.println("location='Home.jsp';");
						out.println("</script>");
						 }
						 else
							 {
							out.println("<script type=\"text/javascript\">");
							out.println("alert('Enter Correct Mobile Number');");
							out.println("location='Home.jsp';");
							out.println("</script>");
							 }

   	}
			else if(page.equalsIgnoreCase("delete"))
			{
				 System.out.println("delete");
					String mnumber=request.getParameter("Number");
					result=dao.delete(mnumber);
					if(result.equalsIgnoreCase("success"))	
					   {
						out.println("<script type=\"text/javascript\">");
						out.println("alert('contatc deleted successfully');");
						out.println("location='Home.jsp';");
						out.println("</script>");
						 }
						 else
							 {
							out.println("<script type=\"text/javascript\">");
							out.println("alert('Contact not found');");
							out.println("location='Home.jsp';");
							out.println("</script>");
							 }

			}
			else if(page.equalsIgnoreCase("search"))
			{
				 System.out.println("search");
				 System.out.println(request.getParameter("Accept"));
				 String index = request.getParameter("Accept").substring(6);
				 System.out.println("index-"+index);
					String searchname=request.getParameter("searchname"+index);
					String mnumber=request.getParameter("mnumber"+index);
					result=dao.search(searchname,mnumber);
					
					if(result.equalsIgnoreCase("fail"))	
					   {
						out.println("<script type=\"text/javascript\">");
						out.println("alert('error in displaying contact');");
						out.println("location='Search.jsp';");
						out.println("</script>");
						 }
						 else
							 {
							 out.println("<script type=\"text/javascript\">");
							out.println("location='DisplayProfile.jsp';");
							session.setAttribute("name",searchname);
							session.setAttribute("number",mnumber);
							session.setAttribute("mailid",result);
							out.println("</script>");
							 }

			}
			
   }
		}
