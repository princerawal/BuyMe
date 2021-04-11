<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page
	import="javax.servlet.http.*,javax.servlet.*, java.text.SimpleDateFormat"%>

<%
PreparedStatement ps = null;
ResultSet rs = null;
Connection conn = null;

try {

	ApplicationDB db = new ApplicationDB();
	conn = db.getConnection();

	int product_id = Integer.parseInt(request.getParameter("product_id"));
	String seller = (session.getAttribute("user")).toString();
	float minPrice = Float.parseFloat(request.getParameter("min_price"));
	float price = Float.parseFloat(request.getParameter("starting_price"));
	String endDate = request.getParameter("end_datetime");

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	java.util.Date date = sdf.parse(endDate);
	java.sql.Timestamp endTimestamp = new java.sql.Timestamp(date.getTime());

	// Make sure all the fields are entered
	/* 		if(category != null  && !category.isEmpty()
	&& brand != null && !brand.isEmpty() 
	&& color != null && !color.isEmpty()
			&& gender != null && !gender.isEmpty()
	&& startDate != null && !startDate.isEmpty()
	&& endDate != null && !endDate.isEmpty()
	&& minPrice >= 0.0f
	&& startingPrice >= 0.0f) { */

	String insert = "INSERT INTO auction (product_id, seller, min_price, price, status, start_date, end_date, winner, current_bid)"
	+ "VALUES(?, ?, ?, ?, ?, now(), ?, ?, ?)";
	ps = conn.prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
	ps.setInt(1, product_id);
	ps.setString(2, seller);
	ps.setFloat(3, minPrice);
	ps.setFloat(4, price);
	ps.setString(5, "open");
	ps.setTimestamp(6, endTimestamp);
	ps.setString(7, null);
	ps.setFloat(8, 0);

	int result = 0;
	result = ps.executeUpdate();
	rs = ps.getGeneratedKeys();
	rs.next();
	//int auction_id = rs.getInt(1);
	response.sendRedirect("sortAuctions.jsp");

} catch (Exception e) {
	response.sendRedirect("createAuctionError.jsp");
	e.printStackTrace();
} finally {
	try {
		ps.close();
	} catch (Exception e) {
	}
	try {
		conn.close();
	} catch (Exception e) {
	}
}
%>