<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="com.moonproduct.Util.DBConnectivity" %> 
    <%@ page import="java.sql.Connection" %>  
    <%@ page import="java.sql.ResultSet" %>
    <%@page import="javax.servlet.http.HttpSession"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete contact</title>
<link rel="stylesheet" type="text/css" href="mainstyle.css">
<form action="Update.jsp" method="post">			
<%session.setAttribute("contact","update"); %>
<header id="header">
			<div id="logo">
				<h1>Contact</h1>
			</div>
</header>
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
<main>		
<div class="tube">
<div class="form-style-2">
<div class="form-style-2-heading">Enter Mobile Number To Update</h2></div>

<label><span>Mobile Number <font color="red">*</font></span>
<input type="text" class="input-field" name="Number" id="number"  ></label>

<label><span>Name <font color="red">*</font></span>
<input type="text" class="input-field" name="Name" id="name"></label>

<label><span>Secondary Number <font color="red">*</font></span>
<input type="text" class="input-field" name="Snumber" id="snumber"></label>

<label><span>Mail <font color="red">*</font></span>
<input type="text" class="input-field" name="Mail" id="mail"></label>

<label><span>Address <font color="red">*</font></span>
<input type="text" class="input-field" name="Address" id="address"></label>

 <div class="button"><input type="submit" onclick="form.action='Servlet'" value="update" />
<input type="button" onclick="window.location.href='Home.jsp'" value="Cancel"/></label></div>
</div>
</main>
</body>
</html>
 
 

