<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Account Check Details</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%
	String userid = request.getParameter("username"); 
	String pwd = request.getParameter("password");
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	/* Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsystem","root", ""); */
	Statement stmt = con.createStatement();
    
    ResultSet rs = null;
    rs = stmt.executeQuery("select * from users where username='" + userid + "'");
    if (rs.next()) {
    	out.println("Username exists, please try another <a href='createAccount.jsp'>try again</a>");
    } else {
    	int x = stmt.executeUpdate("insert into account values('" +userid+ "', '" +pwd+ "', '" + address + "', '" + email + "', '"+ name + "')");
    	int y = stmt.executeUpdate("insert into users values('" +userid+ "', '" +pwd+ "')");
    	session.setAttribute("user", userid); 
        response.sendRedirect("success.jsp");
        out.println("welcome " + userid);
    }
%>

</body>
</html>