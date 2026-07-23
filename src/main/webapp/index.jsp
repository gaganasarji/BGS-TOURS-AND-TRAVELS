<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>

<%@ page import="com.tours.dto.Users"%>
<%@ page import="com.tours.dto.Packages"%>
<%@ page import="com.tours.dto.Destinations"%>
<%@ page import="com.tours.dto.Images"%>

<%@ page import="com.tours.dao.PackagesDAO"%>
<%@ page import="com.tours.dao.DestinationDAO"%>
<%@ page import="com.tours.dao.ImagesDAO"%>

<%@ page import="com.tours.daoImpl.PackagesDAOImpl"%>
<%@ page import="com.tours.daoImpl.DestinationsDAOImpl"%>
<%@ page import="com.tours.daoImpl.ImagesDAOImpl"%>

<%
    Users user = (Users) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>BGS Tours and Travels</title>

<link
    href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600;700&display=swap"
    rel="stylesheet">

<link
    href="https://fonts.googleapis.com/icon?family=Material+Icons"
    rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{

    font-family:'Inter',sans-serif;
    background:linear-gradient(135deg,#f8f9fa 0%,#e9ecef 100%);
    color:#1a2c3e;
    overflow-x:hidden;

}

.navbar{

    display:flex;
    justify-content:space-between;
    align-items:center;

    position:fixed;
    top:0;

    width:100%;

    height:70px;

    padding:0 5%;

    background:white;

    box-shadow:0 2px 10px rgba(0,0,0,.08);

    z-index:1000;

}

.logo-text{

    text-decoration:none;
    color:#1a2c3e;

    font-size:26px;
    font-weight:800;

}

.logo-text span{

    color:#27ae60;

}

.nav-links{

    display:flex;
    list-style:none;

    gap:30px;

}

.nav-links a{

    text-decoration:none;

    color:#333;

    font-weight:600;

}

.nav-links a:hover{

    color:#27ae60;

}

.nav-actions a{

    text-decoration:none;

    padding:10px 24px;

    border-radius:30px;

    background:#27ae60;

    color:white;

    font-weight:600;

}

.nav-actions a:hover{

    background:#219150;

}

.hero{

    height:100vh;

    margin-top:70px;

    display:flex;

    justify-content:center;

    align-items:center;

    text-align:center;

    background:url("https://images.unsplash.com/photo-1600100397608-f010f4198753?q=80&w=2000&auto=format&fit=crop")
    center/cover;

    position:relative;

}

.hero::before{

    content:"";

    position:absolute;

    width:100%;
    height:100%;

    background:rgba(0,0,0,.45);

}

.hero-content{

    position:relative;

    color:white;

    z-index:2;

    max-width:800px;

}

.hero-subtitle{

    letter-spacing:4px;

    color:#ffd54f;

    margin-bottom:20px;

}

.hero-title{

    font-size:60px;

    font-family:'Playfair Display',serif;

    margin-bottom:20px;

}

.hero-description{

    font-size:18px;

    line-height:1.7;

    margin-bottom:35px;

}

.hero-content a{

    display:inline-block;

    padding:15px 35px;

    border-radius:40px;

    background:#27ae60;

    color:white;

    text-decoration:none;

    font-weight:bold;

}

.packages-section{

    max-width:1400px;

    margin:auto;

    padding:80px 5%;

}

.section-header{

    text-align:center;

    margin-bottom:50px;

}

.section-title{

    font-size:40px;

    margin-top:10px;

    font-family:'Playfair Display',serif;

}

.section-badge{

    color:#27ae60;

    font-weight:bold;

}

.packages-grid{

    display:grid;

    grid-template-columns:repeat(auto-fit,minmax(350px,1fr));

    gap:30px;

}

.package-card{

    background:white;

    border-radius:20px;

    overflow:hidden;

    box-shadow:0 10px 20px rgba(0,0,0,.08);

    transition:.3s;

}

.package-card:hover{

    transform:translateY(-8px);

}

.card-image{

    height:230px;

    overflow:hidden;

}

.card-image img{

    width:100%;

    height:100%;

    object-fit:cover;

}

.card-body{

    padding:20px;

}

.package-title{

    font-size:24px;

    font-family:'Playfair Display',serif;

}

.package-desc{

    color:#666;

    margin:15px 0;

    line-height:1.6;

}


.price-box{
    display:flex;
    flex-direction:column;
}

.price-label{
    font-size:12px;
    color:#777;
}

.price-amount{
    font-size:26px;
    font-weight:bold;
    color:#27ae60;
}

.card-footer{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-top:20px;
}

.book-btn{

    background:#1a2c3e;
    color:white;

    border:none;

    padding:10px 22px;

    border-radius:25px;

    cursor:pointer;

    font-weight:600;

}

.book-btn:hover{

    background:#27ae60;

}

</style>

</head>

<body>

<!-- ================= NAVBAR ================= -->

<nav class="navbar">

    <a href="index.jsp" class="logo-text">
        BGS<span>Tours</span>
    </a>

    <ul class="nav-links">

        <li><a href="index.jsp">Home</a></li>

        <li><a href="#packages">Packages</a></li>

        <% if(user!=null){ %>

            <li><a href="myBookings.jsp">My Bookings</a></li>

        <% } %>

    </ul>

    <div class="nav-actions">

        <% if(user==null){ %>

            <a href="sign.jsp">Login / Signup</a>

        <% }else{ %>

            <a href="logout" style="background:#e74c3c;">
                Logout
            </a>

        <% } %>

    </div>

</nav>

<!-- ================= HERO ================= -->

<section class="hero">

    <div class="hero-content">

        <div class="hero-subtitle">

            ONE STATE • MANY DESTINATIONS

        </div>

        <h1 class="hero-title">

            Discover Karnataka

        </h1>

        <p class="hero-description">

            Explore the beauty of Karnataka with our
            affordable tour packages.

            Visit Coorg, Chikmagalur, Mysore, Hampi,
            Gokarna, Jog Falls and many more.

        </p>

        <a href="#packages">

            Explore Packages

        </a>

    </div>

</section>

<!-- ================= PACKAGES ================= -->

<section class="packages-section" id="packages">

    <div class="section-header">

        <div class="section-badge">

            TRENDING TOURS

        </div>

        <h2 class="section-title">

            Popular Packages

        </h2>

    </div>

    <div class="packages-grid">

<%

PackagesDAO pdao = new PackagesDAOImpl();

DestinationDAO ddao = new DestinationsDAOImpl();

ImagesDAO idao = new ImagesDAOImpl();

List<Packages> packagesList = pdao.findAll();

if(packagesList!=null && !packagesList.isEmpty()){

    for(Packages p : packagesList){

        Destinations dest = ddao.findById(p.getDestId());

        Images img = idao.getImageById(p.getImageId());

        String cityName = "Karnataka";

        if(dest!=null){

            cityName = dest.getCity();

        }

        String imageUrl="https://images.unsplash.com/photo-1596423735880-5c6a5a9d80d2?q=80&w=800&auto=format&fit=crop";

        if(img!=null){

            imageUrl = img.getImageUrl();

        }

%>

<div class="package-card">

    <div class="card-image">

        <img src="<%=imageUrl%>">

    </div>

    <div class="card-body">

        <h2 class="package-title">

            <%=p.getPackageName()%>

        </h2>

        <p>

            <strong>Destination :</strong>

            <%=cityName%>

        </p>

        <p>

            <strong>Duration :</strong>

            <%=p.getDuration()%>

        </p>

        <p class="package-desc">

            <%=p.getDescription()%>

        </p>

        <form action="checkout.jsp" method="post">

            <input
                type="hidden"
                name="packageId"
                value="<%=p.getPackageId()%>">

            <input
                type="hidden"
                name="price"
                value="<%=p.getPrice()%>">

            <div class="card-footer">

                <div class="price-box">

                    <span class="price-label">

                        Starting From

                    </span>

                    <span class="price-amount">

                        ₹ <%=p.getPrice()%>

                    </span>

                </div>

                <% if(user!=null){ %>

                    <button
                        type="submit"
                        class="book-btn">

                        Book Now

                    </button>

                <% }else{ %>

                    <a
                        href="sign.jsp"
                        class="book-btn"
                        style="text-decoration:none;">

                        Login To Book

                    </a>

                <% } %>

            </div>

        </form>

    </div>

</div>

<%
    }   // End of for loop

} else {
%>

<div style="grid-column:1/-1;
            text-align:center;
            padding:60px;
            background:#ffffff;
            border-radius:15px;
            box-shadow:0 5px 15px rgba(0,0,0,0.08);">

    <h2 style="color:#e74c3c;">
        No Packages Available
    </h2>

    <br>

    <p style="font-size:18px;color:#555;">
        Tour packages are currently unavailable.
        Please check again later.
    </p>

</div>

<%
}
%>

    </div>

</section>

<!-- ================= FOOTER ================= -->

<footer
style="
background:#1a2c3e;
color:white;
text-align:center;
padding:30px;
margin-top:80px;">

    <h3>BGS Tours & Travels</h3>

    <br>

    <p>

        Explore Karnataka with comfort,
        safety and unforgettable memories.

    </p>

    <br>

    <p>

        &copy; 2026 BGS Tours & Travels.
        All Rights Reserved.

    </p>

</footer>

</body>

</html>