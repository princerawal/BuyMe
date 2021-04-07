<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create Auction</title>
</head>
<body>
	<% if(session.getAttribute("user") == null) {
    	 	response.sendRedirect("login.jsp");
        } else { %>
        
	<div class="content">
		<form action="checkCreateAuction.jsp" method="POST">	
	<table>
	<tr> 
	<td>Product ID: </td><td><input type="hidden" name="product_id" value =  <%=request.getParameter("auction")%> ></td>
	</tr>
<!-- 	<tr> 
	<td>Start Date: </td><td><input type="datetime-local" name="start_datetime" id="start_datetime"  placeholder="mm/dd/yyyy --:-- --" required></td>
	</tr> -->
	<tr>    
	<td>End Date: </td><td><input type="datetime-local" name="end_datetime" id="end_datetime" placeholder="mm/dd/yyyy --:-- --"></td>
	</tr> 
	<tr>    
	<td>Minimum Price: </td><td><input type="text" name="min_price"  placeholder="0.00" min="0.00" required></td>
	</tr>	
	<tr>    
	<td>Starting Price: </td><td><input type="text" name="starting_price" placeholder="0.00" min="0.00" required></td>
	</tr>	
	</table>
	<input type="submit" value="Create Auction">
		</form>
	</div>
	<% } %>
</body>
</html>
