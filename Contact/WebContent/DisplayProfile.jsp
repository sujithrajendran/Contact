<%@page import="java.awt.Window"%>
<%@ page import="java.sql.*" %>
    <%@ page import="com.moonproduct.Util.DBConnectivity" %> 
    <%@ page import="java.sql.Connection" %>  
    <%@ page import="java.sql.ResultSet" %>
    <%@page import="javax.servlet.http.HttpSession"%>
    <%@page import="java.text.SimpleDateFormat" %>
    <%@page import=" java.text.ParseException" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DisplayPage</title>
<link rel="stylesheet" type="text/css" href="UserProfile.css">
<body>
<form action="DisplayProfile.jsp" method="post" name='form'>
<header id="header">
			<div id="logo">
				<h1>Contact</h1>	
			</div>
</header>
<main>
<%Connection con=DBConnectivity.getDBConnection();%>
<%String name="";
String number="";
String mailid="";
String snumber="";
String address="";

name=(String) session.getAttribute("name");
number=(String) session.getAttribute("number");
mailid=(String) session.getAttribute("mailid");
System.out.println("name-"+name);
System.out.println("number-"+number);
System.out.println("mailid-"+mailid);
if(con!=null)
{
	try
	{
		
		Statement st = con.createStatement();
	    ResultSet rs=st.executeQuery("select snumber,address from contact where name='"+name+"' and mnumber='"+number+"' and mail='"+mailid+"' ");
	    while(rs.next()) 
	    { 
	    	snumber=rs.getString(1);
	    	address=rs.getString(2);

	        System.out.println("name-" +name+" "+"mobilenumber-"+number+"  address-"+address+"emailid-"+mailid+"snumber-"+snumber); 
	  	    
	   
	}
	}
		catch(Exception e)
	 	{
		System.out.println(e.toString()); 
		 }
} %>
<div class="tube">
<div class="container">
      <div class="cover-photo">
        <img src="display.png" class="profile">
      </div> 
       <h3 class="about">
       </br></br>
       <span style="font-size:120%; color:#ffffff;">   Name -</span>
       <span style="font-size:120%; color:#99ffff;">  <%=name%>
       </span>
       </h3>
       <h3 class="about">
      <span style="font-size:120%; color:#ffffff;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  Mobile Number -</span>
      <span style="font-size:120%; color:#99ffff;"> <%=number%>
      </span> 
       </h3>
       <h3 class="about">
      <span style="font-size:120%; color:#ffffff;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  Secondary Number -</span>
       <span style="font-size:120%; color:#99ffff;"> <%=snumber%>
      </span>
       </h3>
       <h3 class="about">
      <span style="font-size:120%; color:#ffffff;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  EmailId-</span>
     <span style="font-size:120%; color:#99ffff;"> <%=mailid%>
      </span>
       </h3>
       <h3 class="about">
     <span style="font-size:120%; color:#ffffff;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  Address -</span>
      <span style="font-size:120%; color:#99ffff;"> <%=address%>
      </span> 
       </h3>
       <br>
 </div>
  </div> 
  </div>
    </form>
    </main>
    <nav id="nav">
			<div class="innertube">
				<h2>User</h2>
				<ul>
				    <li><a href="Home.jsp">Home</a></li>
					<li><a href="Add.jsp">Add Contact</a></li>	
					<li><a href="Search.jsp">Search Contact</a></li>
					<li><a href="Update.jsp">Update Contact</a></li>	
					<li><a href="Delete.jsp">Delete Contact</a></li>
					
				</ul>
			</div>
		</nav>
		
</body>
</html>
