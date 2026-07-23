<%@page import="com.tours.dto.Users"%>
<%@page import="com.tours.daoImpl.BookingsDAOImpl"%>
<%@page import="com.tours.daoImpl.PackagesDAOImpl"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Users admin = (Users) session.getAttribute("user");

if (admin == null || admin.getUserId() != 1) {
	response.sendRedirect("sign.jsp");
	return;
}

BookingsDAOImpl bdao = new BookingsDAOImpl();
PackagesDAOImpl pdao = new PackagesDAOImpl();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard | BGS Tours & Travels</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Inter',sans-serif;
}

body{
display:flex;
background:#f4f7fb;
min-height:100vh;
}

/* Sidebar */

.sidebar{
width:260px;
background:#1a2c3e;
color:white;
padding:30px 20px;
position:fixed;
height:100%;
}

.sidebar h2{
text-align:center;
margin-bottom:40px;
color:#27ae60;
}

.sidebar a{
display:block;
padding:14px;
margin-bottom:12px;
text-decoration:none;
color:#dbe4ee;
border-radius:8px;
transition:.3s;
font-weight:600;
}

.sidebar a:hover,
.sidebar a.active{
background:#27ae60;
color:white;
}

.logout{
margin-top:35px;
background:#e74c3c;
text-align:center;
}

/* Main */

.main{
margin-left:260px;
padding:40px;
width:100%;
}

.main h1{
color:#1a2c3e;
margin-bottom:10px;
}

.main p{
color:#64748b;
margin-bottom:35px;
}

.cards{
display:grid;
grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
gap:25px;
}

.card{
background:white;
padding:30px;
border-radius:15px;
box-shadow:0 10px 25px rgba(0,0,0,.08);
text-align:center;
}

.card h3{
color:#64748b;
margin-bottom:15px;
}

.value{
font-size:38px;
font-weight:bold;
color:#115eb6;
}

.actions{
margin-top:40px;
display:flex;
gap:20px;
flex-wrap:wrap;
}

.btn{
background:#115eb6;
color:white;
padding:14px 25px;
border-radius:8px;
text-decoration:none;
font-weight:600;
transition:.3s;
}

.btn:hover{
background:#0c478b;
}

.footer{
margin-top:60px;
text-align:center;
color:gray;
font-size:14px;
}

</style>

</head>

<body>

<div class="sidebar">

<h2>BGS Admin</h2>

<a href="admin.jsp" class="active">🏠 Dashboard</a>

<a href="adminBookings.jsp">📖 View Bookings</a>

<a href="packages.jsp">🎒 Packages</a>

<a href="destinations.jsp">🌍 Destinations</a>

<a href="index.jsp">🏡 Home</a>

<a href="logout" class="logout">Logout</a>

</div>

<div class="main">

<h1>Welcome, <%=admin.getUserName()%> 👋</h1>

<p>
Manage bookings, tour packages and destinations from your admin dashboard.
</p>

<div class="cards">

<div class="card">

<h3>Total Bookings</h3>

<div class="value">
<%=bdao.findAll().size()%>
</div>

</div>

<div class="card">

<h3>Total Packages</h3>

<div class="value">
<%=pdao.findAll().size()%>
</div>

</div>

<div class="card">

<h3>Administrator</h3>

<div class="value" style="font-size:26px;">
<%=admin.getUserName()%>
</div>

</div>

</div>

<div class="actions">

<a href="adminBookings.jsp" class="btn">
View Bookings
</a>

<a href="packages.jsp" class="btn">
View Packages
</a>

<a href="destinations.jsp" class="btn">
View Destinations
</a>

</div>

<div class="footer">

© 2026 BGS Tours & Travels | Admin Dashboard

</div>

</div>

</body>
</html>