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
<title>AddPage</title>
<link rel="stylesheet" type="text/css" href="mainstyle.css">
<body>
<% session.setAttribute("contact","display"); %>
<form action="Add.jsp" method="post" name='form'>
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
<div class="form-style-2" >
<div class="form-style-2-heading">Add Contact</h2></div>


<label><span>Name<font color="red" size="2">*</font></span>
<input type="text" class="input-field" name="Name" id="name" required autofocus/></label>

<label><span>Mobile Number<font color="red" size="2" >*</font></span>
<input type="number" class="input-field" name="Number" id="number"  maxlength="10" required autofocus/></label>
<label><span>Secondary Number<font color="red" size="2">*</font></span>
<input type="number" class="input-field" name="Snumber" id="snumber"  maxlength="10" required autofocus/></label>

<label><span>Email Id<font color="red" size="2">*</font></span>
<input type="email" class="input-field" name="Email" id="email" required autofocus/></label>
<label><span>Address<font color="red" size="2">*</font></span>
<input type="text" class="input-field" name="Address" id="address" required autofocus/></label>

<div class="button"><input type="submit" onclick="form.action='Servlet'" value="Add" />
<input type="button" onclick="window.location.href='Home.jsp'" value="Cancel"/></label></div>
</div>
</div>
</main>
</body>
</html>