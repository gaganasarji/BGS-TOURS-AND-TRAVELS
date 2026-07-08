<%@page import="com.tours.dto.Packages"%>
<%@page import="com.tours.dto.Destinations"%>
<%@page import="com.tours.dto.Images"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Explore Packages - Sapphire Tours</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { font-family: 'Inter', sans-serif; background: linear-gradient(135deg, #FFFFFF 0%, #FFFFF4 50%, #F5E6C2 100%); margin: 0; padding: 0; }
        .header { background: white; padding: 20px 5%; box-shadow: 0 2px 10px rgba(0,0,0,0.1); display: flex; justify-content: space-between; align-items: center; }
        .logo { font-size: 24px; font-weight: 700; color: #1a2c3e; text-decoration: none; }
        .logo span { color: #115eb6; }
        
        .container { max-width: 1300px; margin: 40px auto; padding: 0 20px; }
        .page-title { text-align: center; font-size: 36px; color: #1a2c3e; margin-bottom: 40px; }
        
        .grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(320px, 1fr)); gap: 30px; }
        .card { background: white; border-radius: 16px; overflow: hidden; box-shadow: 0 10px 25px rgba(0,0,0,0.06); transition: transform 0.3s; }
        .card:hover { transform: translateY(-5px); box-shadow: 0 15px 35px rgba(0,0,0,0.1); }
        .card-img { width: 100%; height: 220px; object-fit: cover; }
        .card-body { padding: 25px; }
        
        .destination-tag { background: #e8f0fe; color: #115eb6; padding: 5px 12px; border-radius: 20px; font-size: 12px; font-weight: 600; display: inline-block; margin-bottom: 10px; }
        .pkg-title { font-size: 20px; font-weight: 700; color: #1a2c3e; margin-bottom: 10px; }
        .pkg-desc { color: #5a6e85; font-size: 14px; line-height: 1.5; margin-bottom: 15px; }
        .pkg-meta { display: flex; justify-content: space-between; font-size: 13px; color: #6c86a3; padding-top: 15px; border-top: 1px solid #eef2f8; margin-bottom: 15px; }
        
        .price-row { display: flex; justify-content: space-between; align-items: center; }
        .price { font-size: 22px; font-weight: 700; color: #115eb6; }
        .btn-view { padding: 10px 20px; background: #115eb6; color: white; border-radius: 30px; text-decoration: none; font-size: 14px; font-weight: 600; transition: 0.3s; }
        .btn-view:hover { background: #0a4a8c; }
    </style>
</head>
<body>
    <div class="header">
        <a href="index.jsp" class="logo">SAPPHIRE <span>TOURS</span></a>
    </div>

    <div class="container">
        <h1 class="page-title">Curated Holiday Packages</h1>
        
        <div class="grid">
            <% 
                // Simulated Backend Data Fetch
                // List<Packages> packageList = packageDAO.getAllPackages();
                for(int i = 1; i <= 6; i++) { 
                    // Assume these come from your DTOs:
                    // String destName = dest.getDestinationName();
                    // String imgUrl = img.getImageUrl();
            %>
            <div class="card">
                <img src="https://images.pexels.com/photos/3225531/pexels-photo-3225531.jpeg" class="card-img" alt="Package Image">
                <div class="card-body">
                    <span class="destination-tag"><i class="fas fa-map-marker-alt"></i> Bali, Indonesia</span>
                    <h3 class="pkg-title">Tropical Paradise Getaway</h3>
                    <p class="pkg-desc">Experience the serene beaches, ancient temples, and vibrant culture of Bali over an unforgettable week.</p>
                    
                    <div class="pkg-meta">
                        <span><i class="fas fa-clock"></i> 6 Days / 5 Nights</span>
                        <span><i class="fas fa-hotel"></i> 4-Star Stay</span>
                    </div>
                    
                    <div class="price-row">
                        <div class="price">₹45,000<span style="font-size: 12px; font-weight: normal; color: #5a6e85;">/pp</span></div>
                        <a href="packageDetails.jsp?id=<%=i%>" class="btn-view">View Details</a>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</body>
</html>