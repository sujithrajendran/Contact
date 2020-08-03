<%@page import="java.awt.Window"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HomePage</title>
<link rel="stylesheet" type="text/css" href="mainstyle.css">
<body>
<form action="Home.jsp" method="post" >
<header id="header">
			<div id="logo">
				<h1>Contact</h1>
				</header>	
<nav id="nav">
			<div class="innertube">
				<h2>USER</h2>
				<ul>
				    <li><a href="Add.jsp">Add Contact</a></li>	
					<li><a href="Search.jsp">Search Contact</a></li>
					<li><a href="Update.jsp">Update Contact</a></li>	
					<li><a href="Delete.jsp">Delete Contact</a></li>	
				</ul>
			</div>
		</nav>
		</form>
</body>
</html>