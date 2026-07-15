<%@page import="com.tours.dto.Packages"%>
<%@page import="com.tours.dto.Destinations"%>
<%@page import="com.tours.daoImpl.PackagesDAOImpl"%>
<%@page import="com.tours.daoImpl.DestinationsDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Package Details - BGS Tours</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { font-family: 'Inter', sans-serif; background: #f8fafc; margin: 0; color: #1a2c3e; }
        .navbar { background: white; padding: 20px 5%; box-shadow: 0 2px 10px rgba(0,0,0,0.05); display: flex; justify-content: space-between; }
        .logo { font-size: 24px; font-weight: 700; color: #1a2c3e; text-decoration: none; }
        .logo span { color: #27ae60; }
        .container { max-width: 1200px; margin: 40px auto; padding: 0 20px; display: flex; gap: 40px; }
        .content-section { flex: 2; }
        .booking-sidebar { flex: 1; }
        .hero-image { width: 100%; height: 400px; object-fit: cover; border-radius: 20px; margin-bottom: 20px; }
        .destination-badge { background: #e8f0fe; color: #115eb6; padding: 6px 16px; border-radius: 30px; font-size: 14px; font-weight: 600; display: inline-block; margin-bottom: 15px; }
        .package-title { font-size: 36px; margin: 0 0 20px 0; }
        .package-description { font-size: 16px; color: #5a6e85; line-height: 1.8; margin-bottom: 30px; }
        .booking-card { background: white; border-radius: 24px; padding: 30px; box-shadow: 0 20px 40px rgba(0,0,0,0.08); position: sticky; top: 40px; }
        .price-amount { font-size: 42px; font-weight: 700; color: #27ae60; }
        .btn-book { display: block; width: 100%; text-align: center; padding: 16px; background: #1a2c3e; color: white; border-radius: 40px; font-size: 18px; font-weight: 600; text-decoration: none; transition: all 0.3s; margin-top: 20px; }
        .btn-book:hover { background: #27ae60; }
    </style>
</head>
<body>
    <%
        String pkgIdStr = request.getParameter("packageId");
        if(pkgIdStr == null) { response.sendRedirect("packages.jsp"); return; }
        
        PackagesDAOImpl pdao = new PackagesDAOImpl();
        Packages pkg = pdao.findById(Integer.parseInt(pkgIdStr));
        
        DestinationsDAOImpl ddao = new DestinationsDAOImpl();
        Destinations dest = ddao.findById(pkg.getDestId());
        String destName = (dest != null) ? dest.getCity() : "Karnataka";
    %>

    <nav class="navbar">
        <a href="index.jsp" class="logo">BGS <span>TOURS</span></a>
        <a href="packages.jsp" style="text-decoration: none; color: #1a2c3e; font-weight: 600;">&larr; Back to Packages</a>
    </nav>

    <div class="container">
        <div class="content-section">
            <img src="https://images.unsplash.com/photo-1596423735880-5c6a5a9d80d2?q=80&w=1200" class="hero-image" alt="Destination">
            
            <div class="destination-badge"><i class="fas fa-map-marker-alt"></i> <%=destName%></div>
            <h1 class="package-title"><%=pkg.getPackageName()%></h1>
            <p class="package-description"><%=pkg.getDescription()%></p>
            
            <h3 style="margin-top: 30px;">Trip Highlights</h3>
            <div style="background: white; padding: 20px; border-radius: 12px; border: 1px solid #eef2f8;">
                <p><strong><i class="fas fa-clock"></i> Duration:</strong> <%=pkg.getDuration()%></p>
            </div>
        </div>

        <div class="booking-sidebar">
            <div class="booking-card">
                <div style="margin-bottom: 25px; border-bottom: 1px solid #eef2f8; padding-bottom: 20px;">
                    <div style="font-size: 14px; color: #5a6e85;">Starting from</div>
                    <div class="price-amount">₹<%=pkg.getPrice()%></div>
                    <div style="font-size: 14px; color: #5a6e85;">per person</div>
                </div>

                <!-- Send to checkout -->
                <a href="checkout.jsp?packageId=<%=pkg.getPackageId()%>" class="btn-book">Proceed to Book</a>
            </div>
        </div>
    </div>
</body>
</html>