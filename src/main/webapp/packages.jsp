<%@page import="java.util.List"%>
<%@page import="com.tours.dto.Packages"%>
<%@page import="com.tours.dto.Destinations"%>
<%@page import="com.tours.daoImpl.PackagesDAOImpl"%>
<%@page import="com.tours.daoImpl.DestinationsDAOImpl"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Karnataka Tour Packages | BGS Tours & Travels</title>

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
background:#f8fafc;
color:#1a2c3e;
}

/* Header */

.header{
background:white;
padding:18px 5%;
display:flex;
justify-content:space-between;
align-items:center;
box-shadow:0 2px 12px rgba(0,0,0,.08);
position:sticky;
top:0;
z-index:100;
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

.nav-links a{
margin-left:25px;
text-decoration:none;
font-weight:600;
color:#1a2c3e;
transition:.3s;
}

.nav-links a:hover{
color:#115eb6;
}

/* Hero */

.hero-banner{

background:
linear-gradient(rgba(17,94,182,.72),
rgba(17,94,182,.72)),
url("https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg")
center/cover;

padding:90px 20px;

text-align:center;

color:white;

}

.hero-banner h1{

font-size:50px;

margin-bottom:18px;

}

.hero-banner p{

font-size:18px;

max-width:700px;

margin:auto;

line-height:1.8;

}

/* Packages */

.container{

max-width:1400px;

margin:60px auto;

padding:0 20px;

}

.grid{

display:grid;

grid-template-columns:
repeat(auto-fill,minmax(340px,1fr));

gap:35px;

}

.card{

background:white;

border-radius:18px;

overflow:hidden;

box-shadow:0 10px 25px rgba(0,0,0,.08);

transition:.35s;

display:flex;

flex-direction:column;

}

.card:hover{

transform:translateY(-8px);

}

.card-img{

width:100%;

height:230px;

object-fit:cover;

}

.card-body{

padding:25px;

display:flex;

flex-direction:column;

flex-grow:1;

}

.destination-tag{

display:inline-block;

padding:7px 14px;

background:#e8f0fe;

color:#115eb6;

font-size:12px;

font-weight:700;

border-radius:20px;

margin-bottom:15px;

}

.pkg-title{

font-size:22px;

font-weight:700;

margin-bottom:12px;

}

.pkg-desc{

font-size:14px;

line-height:1.7;

color:#5d7086;

margin-bottom:20px;

flex-grow:1;

}

.pkg-meta{

display:flex;

justify-content:space-between;

border-bottom:1px solid #eee;

padding-bottom:18px;

margin-bottom:20px;

font-size:14px;

}

.price{

font-size:28px;

font-weight:800;

color:#27ae60;

}

.card-footer{

display:flex;

justify-content:space-between;

align-items:center;

}

.btn-book{

padding:12px 22px;

background:#115eb6;

color:white;

text-decoration:none;

border:none;

border-radius:30px;

font-weight:600;

cursor:pointer;

transition:.3s;

}

.btn-book:hover{

background:#0d4c94;

}

</style>

</head>

<body>

<div class="header">

<a href="index.jsp" class="logo">
BGS <span>TOURS & TRAVELS</span>
</a>

<div class="nav-links">

<a href="index.jsp">Home</a>

<a href="destinations.jsp">Destinations</a>

<a href="myBookings.jsp">My Bookings</a>

</div>

</div>

<div class="hero-banner">

<h1>Karnataka Tour Packages</h1>

<p>

Explore the royal heritage, hill stations,
waterfalls, beaches, temples and wildlife
through our specially curated Karnataka tour packages.

</p>

</div>

<div class="container">

<div class="grid">

<%
PackagesDAOImpl pdao = new PackagesDAOImpl();
DestinationsDAOImpl ddao = new DestinationsDAOImpl();

List<Packages> packageList = pdao.findAll();

if(packageList != null && !packageList.isEmpty()){

for(Packages p : packageList){

Destinations dest = ddao.findById(p.getDestId());

String destName = (dest != null)
? dest.getCity()
: "Karnataka";
%>
<%
String image = "images/default.jpg";

switch(destName){

case "Mysuru":
image="images/mysore.jpg";
break;

case "Chikkamagaluru":
image="images/mullayanagiri.jpg";
break;

case "Hampi":
image="images/hampi.jpg";
break;

case "Kolar":
image="images/kotilingeshwar.jpg";
break;

case "Sakleshpur":
image="images/sakleshpur.jpg";
break;

case "Shivamogga":
image="images/jogfalls.jpg";
break;

case "Chitradurga":
image="images/chitradurga.jpg";
break;

case "Madikeri":
image="images/coorg.jpg";
break;

case "Murudeshwar":
image="images/murudeshwar.jpg";
break;

case "Gokarna":
image="images/gokarna.jpg";
break;

case "Belur":
image="images/belur.jpg";
break;

case "Bandipur":
image="images/bandipur.jpg";
break;

default:
image="images/default.jpg";

}
%>

<div class="card">

<img src="<%=image%>"
class="card-img"
alt="<%=destName%>">

<div class="card-body">

<div>

<span class="destination-tag">

<i class="fas fa-map-marker-alt"></i>

<%=destName%>

</span>

</div>

<h3 class="pkg-title">

<%=p.getPackageName()%>

</h3>

<p class="pkg-desc">

<%=p.getDescription()%>

</p>

<div class="pkg-meta">

<span>

<i class="fas fa-clock"></i>

<%=p.getDuration()%>

</span>

<span>

<i class="fas fa-star"></i>

Premium Package

</span>

</div>

<div class="card-footer">

<div>

<div style="
font-size:12px;
color:#64748b;
text-transform:uppercase;
font-weight:600;
">

Starting From

</div>

<div class="price">

₹<%=String.format("%.0f",p.getPrice())%>

</div>

</div>

<form action="checkout.jsp"
method="post"
style="margin:0;">

<input
type="hidden"
name="packageId"
value="<%=p.getPackageId()%>">

<button
type="submit"
class="btn-book">

Book Now

</button>

</form>

</div>

</div>

</div>
<%
    }   // End for loop
} else {
%>

<div style="
grid-column:1/-1;
text-align:center;
padding:80px;
background:white;
border-radius:15px;
box-shadow:0 10px 25px rgba(0,0,0,.08);
">

<h2 style="color:#1a2c3e;margin-bottom:15px;">

No Tour Packages Available

</h2>

<p style="color:#64748b;font-size:16px;">

Currently there are no tour packages available.
Please check again later.

</p>

</div>

<%
}
%>

</div>

</div>

<footer style="
background:#1a2c3e;
color:white;
text-align:center;
padding:30px;
margin-top:70px;
">

<h3>BGS Tours & Travels</h3>

<p style="margin-top:10px;">
Explore Karnataka with Comfort, Adventure & Happiness.
</p>

<p style="margin-top:15px;font-size:14px;color:#d1d5db;">
© 2026 BGS Tours & Travels. All Rights Reserved.
</p>

</footer>

</body>

</html>