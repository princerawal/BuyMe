<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check Login Details</title>
</head>
<body>
	<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
   ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection(); 	
	
	/* Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsystem","root", ""); */
	Statement stmt = con.createStatement();
	
    ResultSet rs;
    rs = stmt.executeQuery("select * from admin where username='" + userid + "'");
    if (rs.next()){
    	 ResultSet rs1;
    	    rs1 = stmt.executeQuery("select * from admin where username='" + userid + "' and password='" + pwd + "'");
    	    if (rs1.next()) {
    	    	session.setAttribute("user", userid); // the username will be stored in the session
    	        response.sendRedirect("success.jsp");
    	        out.println("welcome " + userid);
    	        out.println("<a href='logout.jsp'>Log out</a>");
    	    } else {
    	        out.println("Invalid password <a href='adminLogin.jsp'>try again</a>");
    	    }
    }
    else{
    	out.println("Invalid username <a href='adminLogin.jsp'>try again</a>");
    }
   
%>

</body>
</html>