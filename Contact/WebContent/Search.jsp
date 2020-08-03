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
<script type="text/javascript">

</script>
</head>
<meta charset="ISO-8859-1">
<title>SearchPage</title>
<link rel="stylesheet" type="text/css" href="mainstyle.css">
<body>
<% session.setAttribute("contact","search"); %>
<form action="Search.jsp" method="post">
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

<div class="form-style-2-heading">Search Contact</h2></div>

<label><span> <font color="red"></font></span>
<input type="text" class="input-field" name="Search" id="search"  placeholder="Search name"
 value='<%= request.getParameter("Search")!=null? request.getParameter("Search") :""%>' required autofocus></label>
<%
String sname=request.getParameter("Search");
System.out.println("sname-"+sname);
String name=sname;
%>
<div class="button">
<input type="submit" onclick="form.action='Search.jsp'" value="Search" />
<input type="button" onclick="window.location.href='Home.jsp'" value="Cancel"/></label></div>
</div>
</div>



<table id="tblData" border="1" align="center" cellspacing="15" bordercolor="black" class="raw-table raw-table-highlight-all" cellpadding="15">
<tr>
		<th><b><center><font color="blue" size="4">Name</font></center></b></th>
		<th><b><center><font color="blue" size="4">MobileNumber</font></center></b></th>
		<th><b><center><font color="blue" size="4">View profile</font></center></b></th>
	
<%Connection con=DBConnectivity.getDBConnection();%>
            <% String searchname="";
               String mnumber="";
               int i=0;
            if (con != null && sname!= null) {
				try {
					
					Statement st = con.createStatement();
				     
					 ResultSet rs = st.executeQuery("select name, mnumber from contact where name like'" + sname + "%'");
					 while (rs.next()) 
					{
					searchname=rs.getString(1);
					mnumber=rs.getString(2);
					  if(searchname!=null && mnumber!=null)
					  { %>
						  <tr>
						   <td><center><input type="text" value="<%=searchname%>" name=<%= "searchname"+i %> style="border:0; border-color:transparent; text-align:center" size="10" readonly="value" ></center></td>
                               
                              <td><center> <input type="text" value="<%=mnumber%>" name=<%= "mnumber"+i %> style="border:0; border-color:transparent;text-align:center" size="10"  readonly="value" ></center></td>
						    
						     <td><button name="Accept" class="new" value=<%="Accept"+i%> onclick="form.action='Servlet'" />View</button></td>
						    				     
						     </tr>
				<%	  
				i++;}
					
					}
				} 
				catch (Exception e) {
					System.out.println(e.toString());
				}
			}
            %>

</body>
</html>