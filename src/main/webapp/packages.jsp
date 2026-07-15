<%@page import="com.tours.dto.Packages"%>
<%@page import="com.tours.dto.Destinations"%>
<%@page import="com.tours.daoImpl.PackagesDAOImpl"%>
<%@page import="com.tours.daoImpl.DestinationsDAOImpl"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Packages - BGS Tours</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { font-family: 'Inter', sans-serif; background: #f8f9fa; margin: 0; padding: 0; }
        .header { background: white; padding: 20px 5%; box-shadow: 0 2px 10px rgba(0,0,0,0.1); display: flex; justify-content: space-between; align-items: center; position: sticky; top: 0; z-index: 100;}
        .logo { font-size: 24px; font-weight: 800; color: #1a2c3e; text-decoration: none; }
        .logo span { color: #27ae60; }
        .nav-links a { color: #1a2c3e; text-decoration: none; font-weight: 600; margin-left: 20px;}
        
        .hero-banner { background: linear-gradient(rgba(26, 44, 62, 0.8), rgba(26, 44, 62, 0.8)), url('https://images.unsplash.com/photo-1524492412937-b28074a5d7da?q=80&w=2000&auto=format&fit=crop') center/cover; padding: 80px 20px; text-align: center; color: white; }
        .hero-banner h1 { font-size: 3rem; margin-bottom: 15px; }

        .container { max-width: 1400px; margin: 60px auto; padding: 0 20px; }
        .grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(320px, 1fr)); gap: 35px; }
        
        .card { background: white; border-radius: 16px; overflow: hidden; box-shadow: 0 10px 25px rgba(0,0,0,0.06); transition: transform 0.3s; display: flex; flex-direction: column; }
        .card:hover { transform: translateY(-8px); box-shadow: 0 15px 35px rgba(0,0,0,0.1); }
        .card-img { width: 100%; height: 220px; object-fit: cover; }
        
        .card-body { padding: 25px; flex-grow: 1; display: flex; flex-direction: column; }
        .destination-tag { background: #e8f0fe; color: #115eb6; padding: 6px 14px; border-radius: 20px; font-size: 12px; font-weight: 700; display: inline-block; margin-bottom: 15px; }
        .pkg-title { font-size: 20px; font-weight: 800; color: #1a2c3e; margin-bottom: 10px; line-height: 1.3;}
        .pkg-desc { color: #5a6e85; font-size: 14px; line-height: 1.6; margin-bottom: 20px; flex-grow: 1; }
        
        .pkg-meta { display: flex; justify-content: space-between; font-size: 13px; color: #6c86a3; padding-bottom: 15px; border-bottom: 1px solid #eef2f8; margin-bottom: 15px; }
        
        .card-footer { display: flex; justify-content: space-between; align-items: center; }
        .price { font-size: 24px; font-weight: 800; color: #27ae60; }
        .btn-view { padding: 12px 24px; background: #1a2c3e; color: white; border-radius: 30px; text-decoration: none; font-size: 14px; font-weight: 600; transition: 0.3s; border: none; cursor: pointer;}
        .btn-view:hover { background: #27ae60; }
    </style>
</head>
<body>
    <div class="header">
        <a href="index.jsp" class="logo">BGS <span>TOURS</span></a>
        <div class="nav-links">
            <a href="index.jsp">Home</a>
            <a href="myBookings.jsp">My Bookings</a>
        </div>
    </div>

    <div class="hero-banner">
        <h1>Discover India's Wonders</h1>
        <p>From the snowy peaks of Manali to the tranquil backwaters of Kerala.</p>
    </div>

    <div class="container">
        <div class="grid">
            <% 
                PackagesDAOImpl pdao = new PackagesDAOImpl();
                DestinationsDAOImpl ddao = new DestinationsDAOImpl();
                List<Packages> packageList = pdao.findAll();
                
                if(packageList != null && !packageList.isEmpty()) {
                    for(Packages p : packageList) { 
                        Destinations dest = ddao.findById(p.getDestId());
                        String destName = (dest != null) ? dest.getCity() : "India";
            %>
            <div class="card">
                <!-- Using a placeholder image generator for visual variety -->
                <img src="https://source.unsplash.com/600x400/?<%=destName.toLowerCase().replace(" ", "")%>,travel" class="card-img" alt="<%=destName%>" onerror="this.src='https://images.unsplash.com/photo-1524492412937-b28074a5d7da?q=80&w=600'">
                
                <div class="card-body">
                    <div>
                        <span class="destination-tag"><i class="fas fa-map-marker-alt"></i> <%=destName%></span>
                    </div>
                    <h3 class="pkg-title"><%=p.getPackageName()%></h3>
                    <p class="pkg-desc"><%=p.getDescription()%></p>
                    
                    <div class="pkg-meta">
                        <span><i class="fas fa-clock"></i> <%=p.getDuration()%></span>
                        <span><i class="fas fa-star"></i> Featured</span>
                    </div>
                    
                    <div class="card-footer">
                        <div>
                            <div style="font-size: 11px; color: #6c86a3; font-weight: 600; text-transform: uppercase;">Starting from</div>
                            <div class="price">₹<%=p.getPrice()%></div>
                        </div>
                        
                        <!-- Form submits directly to checkout flow -->
                        <form action="checkout.jsp" method="POST" style="margin: 0;">
                            <input type="hidden" name="packageId" value="<%=p.getPackageId()%>">
                            <button type="submit" class="btn-view">Book Now</button>
                        </form>
                    </div>
                </div>
            </div>
            <% 
                    } 
                } else {
            %>
                <div style="grid-column: 1 / -1; text-align: center; padding: 50px;">
                    <h2>No packages found in the database. Please run the SQL script!</h2>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html> 