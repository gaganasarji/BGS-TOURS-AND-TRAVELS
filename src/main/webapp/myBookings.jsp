<%@page import="java.util.List"%>
<%@page import="com.tours.dto.Users"%>
<%@page import="com.tours.dto.Bookings"%>
<%@page import="com.tours.dto.Packages"%>
<%@page import="com.tours.daoImpl.BookingsDAOImpl"%>
<%@page import="com.tours.daoImpl.PackagesDAOImpl"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Users user = (Users) session.getAttribute("user");

if (user == null) {
	response.sendRedirect("sign.jsp");
	return;
}

BookingsDAOImpl bdao = new BookingsDAOImpl();
PackagesDAOImpl pdao = new PackagesDAOImpl();

List<Bookings> bookings = bdao.findByUserId(user.getUserId());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Bookings | BGS Tours & Travels</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
	margin:0;
	padding:0;
	box-sizing:border-box;
	font-family:'Inter',sans-serif;
}

body{
	background:#f5f7fb;
	padding:40px;
}

.container{
	max-width:1100px;
	margin:auto;
}

h1{
	color:#1a2c3e;
	margin-bottom:25px;
}

.back-btn{
	display:inline-block;
	margin-bottom:20px;
	padding:12px 20px;
	background:#115eb6;
	color:white;
	text-decoration:none;
	border-radius:8px;
	font-weight:600;
}

.back-btn:hover{
	background:#0d4c94;
}

table{
	width:100%;
	border-collapse:collapse;
	background:white;
	box-shadow:0 10px 25px rgba(0,0,0,.08);
	border-radius:12px;
	overflow:hidden;
}

th{
	background:#115eb6;
	color:white;
	padding:15px;
}

td{
	padding:15px;
	text-align:center;
	border-bottom:1px solid #eee;
}

tr:hover{
	background:#f8fbff;
}

.pending{
	color:#f39c12;
	font-weight:bold;
}

.confirmed{
	color:#2ecc71;
	font-weight:bold;
}

.completed{
	color:#27ae60;
	font-weight:bold;
}

.cancelled{
	color:#e74c3c;
	font-weight:bold;
}

.footer{
	margin-top:30px;
	text-align:center;
	color:gray;
	font-size:14px;
}

</style>

</head>

<body>

<div class="container">

<a href="packages.jsp" class="back-btn">← Back to Packages</a>

<h1>My Bookings</h1>

<table>

<tr>
<th>Booking ID</th>
<th>Package Name</th>
<th>Travel Date</th>
<th>Booking Date</th>
<th>Status</th>
</tr>

<%
if(bookings.isEmpty()){
%>

<tr>
<td colspan="5">No bookings found.</td>
</tr>

<%
}else{

for(Bookings b : bookings){

Packages pack = pdao.findById(b.getPackageId());
%>

<tr>

<td><%=b.getBookingId()%></td>

<td>
<%= (pack != null) ? pack.getPackageName() : "Package Not Found" %>
</td>

<td><%=b.getTravelDate()%></td>

<td><%=b.getBookingDate()%></td>

<td>

<%
String status = b.getBookingStatus();

if("PENDING".equalsIgnoreCase(status)){
%>

<span class="pending">Pending</span>

<%
}else if("CONFIRMED".equalsIgnoreCase(status)){
%>

<span class="confirmed">Confirmed</span>

<%
}else if("COMPLETED".equalsIgnoreCase(status)){
%>

<span class="completed">Completed</span>

<%
}else{
%>

<span class="cancelled">Cancelled</span>

<%
}
%>

</td>

</tr>

<%
}
}
%>

</table>

<div class="footer">
© 2026 BGS Tours & Travels
</div>

</div>

</body>
</html>