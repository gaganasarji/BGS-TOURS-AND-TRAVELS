<%@page import="com.tours.dto.Packages"%>
<%@page import="com.tours.dto.Destinations"%>
<%@page import="com.tours.daoImpl.PackagesDAOImpl"%>
<%@page import="com.tours.daoImpl.DestinationsDAOImpl"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String pkgIdStr = request.getParameter("packageId");

if (pkgIdStr == null) {
	response.sendRedirect("packages.jsp");
	return;
}

PackagesDAOImpl pdao = new PackagesDAOImpl();
Packages pkg = pdao.findById(Integer.parseInt(pkgIdStr));

if (pkg == null) {
	response.sendRedirect("packages.jsp");
	return;
}

DestinationsDAOImpl ddao = new DestinationsDAOImpl();
Destinations dest = ddao.findById(pkg.getDestId());

String destName = (dest != null) ? dest.getCity() : "Karnataka";

String image = "images/default.jpg";

switch (destName) {

case "Mysuru":
	image = "images/mysore.jpg";
	break;

case "Chikkamagaluru":
	image = "images/mullayanagiri.jpg";
	break;

case "Hampi":
	image = "images/hampi.jpg";
	break;

case "Kolar":
	image = "images/kotilingeshwar.jpg";
	break;

case "Sakleshpur":
	image = "images/sakleshpur.jpg";
	break;

case "Shivamogga":
	image = "images/jogfalls.jpg";
	break;

case "Chitradurga":
	image = "images/chitradurga.jpg";
	break;

case "Madikeri":
	image = "images/coorg.jpg";
	break;

case "Murudeshwar":
	image = "images/murudeshwar.jpg";
	break;

case "Gokarna":
	image = "images/gokarna.jpg";
	break;

case "Belur":
	image = "images/belur.jpg";
	break;

case "Bandipur":
	image = "images/bandipur.jpg";
	break;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title><%=pkg.getPackageName()%> | BGS Tours & Travels</title>

<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Inter',sans-serif;
}

body{
background:#f5f7fb;
color:#1a2c3e;
}

.navbar{
background:white;
padding:18px 5%;
display:flex;
justify-content:space-between;
align-items:center;
box-shadow:0 2px 12px rgba(0,0,0,.08);
}

.logo{
text-decoration:none;
font-size:26px;
font-weight:800;
color:#1a2c3e;
}

.logo span{
color:#115eb6;
}

.back-btn{
text-decoration:none;
font-weight:600;
color:#115eb6;
}

.container{
max-width:1300px;
margin:40px auto;
padding:0 20px;
display:flex;
gap:40px;
}

.left{
flex:2;
}

.right{
flex:1;
}

.hero-image{
width:100%;
height:450px;
object-fit:cover;
border-radius:18px;
}

.badge{
display:inline-block;
background:#e8f0fe;
color:#115eb6;
padding:8px 18px;
border-radius:25px;
font-size:13px;
font-weight:700;
margin-top:25px;
margin-bottom:18px;
}

.title{
font-size:40px;
font-weight:800;
margin-bottom:18px;
}

.desc{
font-size:16px;
line-height:1.8;
color:#5d7086;
margin-bottom:30px;
}

.btn-book{
display:block;
width:100%;
padding:15px;
background:#115eb6;
color:white;
text-align:center;
text-decoration:none;
font-size:18px;
font-weight:600;
border-radius:35px;
transition:.3s;
}

.btn-book:hover{
background:#0b4d94;
}

</style>

</head>

<body>

<nav class="navbar">

<a href="index.jsp" class="logo">
BGS <span>TOURS & TRAVELS</span>
</a>

<a href="packages.jsp" class="back-btn">
<i class="fas fa-arrow-left"></i> Back to Packages
</a>

</nav>

<div class="container">

<div class="left">

<img src="<%=image%>" class="hero-image" alt="<%=destName%>">

<div class="badge">

<i class="fas fa-map-marker-alt"></i>

<%=destName%>

</div>

<h1 class="title">

<%=pkg.getPackageName()%>

</h1>

<p class="desc">

<%=pkg.getDescription()%>

</p>

<div style="background:white;
padding:30px;
border-radius:15px;
margin-bottom:25px;
box-shadow:0 5px 15px rgba(0,0,0,.08);">

<h2 style="margin-bottom:20px;color:#115eb6;">

Trip Highlights

</h2>

<ul style="line-height:2;font-size:16px;color:#555;">

<li>
<i class="fas fa-check-circle" style="color:green;"></i>
Comfortable transportation throughout the trip.
</li>

<li>
<i class="fas fa-check-circle" style="color:green;"></i>
Premium hotel accommodation.
</li>

<li>
<i class="fas fa-check-circle" style="color:green;"></i>
Sightseeing at major tourist attractions.
</li>

<li>
<i class="fas fa-check-circle" style="color:green;"></i>
Experienced local guide.
</li>

<li>
<i class="fas fa-check-circle" style="color:green;"></i>
Perfect for families, couples and friends.
</li>

</ul>

</div>

<div style="background:white;
padding:30px;
border-radius:15px;
box-shadow:0 5px 15px rgba(0,0,0,.08);">

<h2 style="margin-bottom:20px;color:#115eb6;">

Package Information

</h2>

<table style="width:100%;border-collapse:collapse;">

<tr>

<td style="padding:12px;font-weight:bold;">
Destination
</td>

<td>
<%=destName%>
</td>

</tr>

<tr>

<td style="padding:12px;font-weight:bold;">
Duration
</td>

<td>
<%=pkg.getDuration()%>
</td>

</tr>

<tr>

<td style="padding:12px;font-weight:bold;">
Package Price
</td>

<td style="color:green;font-weight:bold;">
₹<%=pkg.getPrice()%>
</td>

</tr>

<tr>

<td style="padding:12px;font-weight:bold;">
Food
</td>

<td>
Breakfast Included
</td>

</tr>

<tr>

<td style="padding:12px;font-weight:bold;">
Accommodation
</td>

<td>
3★ / 4★ Hotel Stay
</td>

</tr>

<tr>

<td style="padding:12px;font-weight:bold;">
Transportation
</td>

<td>
Private Tourist Vehicle
</td>

</tr>

</table>

</div>

</div>

<div class="right">

<div style="
background:white;
padding:30px;
border-radius:18px;
box-shadow:0 15px 30px rgba(0,0,0,.08);
position:sticky;
top:30px;
">

<div style="font-size:14px;color:#666;">
Starting From
</div>

<div style="
font-size:42px;
font-weight:800;
color:#27ae60;
margin:15px 0;
">

₹<%=pkg.getPrice()%>

</div>

<div style="color:#666;margin-bottom:25px;">
per person
</div>
<div style="margin-bottom:25px;">

<h3 style="margin-bottom:15px;color:#115eb6;">
Package Includes
</h3>

<ul style="line-height:2;color:#555;padding-left:20px;">

<li>✔ Comfortable Hotel Accommodation</li>

<li>✔ Daily Breakfast</li>

<li>✔ Sightseeing as per Itinerary</li>

<li>✔ Transportation</li>

<li>✔ Driver Allowance & Toll Charges</li>

<li>✔ Professional Tour Assistance</li>

</ul>

</div>

<a href="checkout.jsp?packageId=<%=pkg.getPackageId()%>"
class="btn-book">

<i class="fas fa-credit-card"></i>

Proceed to Book

</a>

<p style="
margin-top:20px;
font-size:13px;
color:#666;
text-align:center;
line-height:1.7;">

Book now and experience the beauty of Karnataka with
BGS Tours & Travels. Safe journey, comfortable stay,
and unforgettable memories await you!

</p>

</div>

</div>

</div>

<footer style="
margin-top:70px;
background:#1a2c3e;
color:white;
text-align:center;
padding:35px;
">

<h2>BGS Tours & Travels</h2>

<p style="margin-top:10px;">
Discover Karnataka's Heritage, Nature & Adventure
</p>

<p style="margin-top:15px;font-size:14px;color:#cbd5e1;">
© 2026 BGS Tours & Travels. All Rights Reserved.
</p>

</footer>

</body>

</html>