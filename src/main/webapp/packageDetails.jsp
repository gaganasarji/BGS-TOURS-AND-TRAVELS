<%@page import="com.travel.dto.Packages"%>
<%@page import="com.travel.dto.Destinations"%>
<%@page import="com.travel.dto.Images"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Package Details - Sapphire Tours</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: #f8fafc;
            margin: 0;
            padding: 0;
            color: #1a2c3e;
        }

        /* Navbar */
        .navbar {
            background: white;
            padding: 20px 5%;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .logo { font-size: 24px; font-weight: 700; color: #1a2c3e; text-decoration: none; }
        .logo span { color: #115eb6; }

        /* Main Layout */
        .container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 0 20px;
            display: flex;
            gap: 40px;
        }
        .content-section { flex: 2; }
        .booking-sidebar { flex: 1; }

        /* Image Gallery */
        .hero-image {
            width: 100%;
            height: 400px;
            object-fit: cover;
            border-radius: 20px;
            margin-bottom: 20px;
        }
        .image-thumbnails {
            display: flex;
            gap: 15px;
            margin-bottom: 40px;
        }
        .thumb {
            width: calc(33.333% - 10px);
            height: 120px;
            object-fit: cover;
            border-radius: 12px;
            cursor: pointer;
            transition: transform 0.2s;
        }
        .thumb:hover { transform: scale(1.05); }

        /* Package Details */
        .destination-badge {
            background: #e8f0fe;
            color: #115eb6;
            padding: 6px 16px;
            border-radius: 30px;
            font-size: 14px;
            font-weight: 600;
            display: inline-block;
            margin-bottom: 15px;
        }
        h1.package-title {
            font-size: 36px;
            margin: 0 0 20px 0;
            line-height: 1.2;
        }
        .package-description {
            font-size: 16px;
            color: #5a6e85;
            line-height: 1.8;
            margin-bottom: 30px;
        }

        /* Highlights Grid */
        .highlights {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            background: white;
            padding: 25px;
            border-radius: 16px;
            border: 1px solid #eef2f8;
            margin-bottom: 40px;
        }
        .highlight-item { display: flex; align-items: center; gap: 12px; color: #4a627a; }
        .highlight-item i { color: #115eb6; font-size: 20px; }

        /* Floating Booking Card */
        .booking-card {
            background: white;
            border-radius: 24px;
            padding: 30px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.08);
            position: sticky;
            top: 40px;
        }
        .price-header { margin-bottom: 25px; border-bottom: 1px solid #eef2f8; padding-bottom: 20px; }
        .price-amount { font-size: 42px; font-weight: 700; color: #115eb6; }
        .price-label { font-size: 14px; color: #5a6e85; }
        
        .btn-book {
            display: block;
            width: 100%;
            text-align: center;
            padding: 16px;
            background: #115eb6;
            color: white;
            border: none;
            border-radius: 40px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s;
            box-sizing: border-box;
        }
        .btn-book:hover {
            background: #0a4a8c;
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(17,94,182,0.2);
        }

        /* Responsive */
        @media (max-width: 900px) {
            .container { flex-direction: column; }
            .booking-card { position: static; margin-top: 30px; }
        }
    </style>
</head>
<body>

    <%
        // Packages pkg = (Packages) request.getAttribute("packageDetails");
        // Destinations dest = (Destinations) request.getAttribute("destination");
        // List<Images> images = (List<Images>) request.getAttribute("packageImages");
    %>

    <nav class="navbar">
        <a href="index.jsp" class="logo">SAPPHIRE <span>TOURS</span></a>
        <a href="packages.jsp" style="text-decoration: none; color: #1a2c3e; font-weight: 500;">Back to Packages</a>
    </nav>

    <div class="container">
        <div class="content-section">
            <img src="https://images.pexels.com/photos/3225531/pexels-photo-3225531.jpeg" class="hero-image" id="mainImage" alt="Main Destination Image">
            
            <div class="image-thumbnails">
                <img src="https://images.pexels.com/photos/3225531/pexels-photo-3225531.jpeg" class="thumb" onclick="changeImage(this.src)">
                <img src="https://images.pexels.com/photos/164041/pexels-photo-164041.jpeg" class="thumb" onclick="changeImage(this.src)">
                <img src="https://images.pexels.com/photos/1371360/pexels-photo-1371360.jpeg" class="thumb" onclick="changeImage(this.src)">
            </div>

            <div class="destination-badge">
                <i class="fas fa-map-marker-alt"></i> 
                Bali, Indonesia
            </div>
            
            <h1 class="package-title">
                7 Days Magical Bali Experience
            </h1>
            
            <p class="package-description">
                Discover the island of the gods with our comprehensive 7-day tour. Experience lush rice terraces, ancient sea temples, and pristine beaches. This carefully curated package blends cultural exploration with ultimate relaxation, ensuring an unforgettable getaway.
            </p>

            <div class="highlights">
                <div class="highlight-item"><i class="fas fa-clock"></i> 7 Days / 6 Nights</div>
                <div class="highlight-item"><i class="fas fa-hotel"></i> 5-Star Accommodation</div>
                <div class="highlight-item"><i class="fas fa-plane"></i> Round-trip Flights</div>
                <div class="highlight-item"><i class="fas fa-utensils"></i> All Meals Included</div>
                <div class="highlight-item"><i class="fas fa-bus"></i> Airport Transfers</div>
                <div class="highlight-item"><i class="fas fa-camera"></i> Guided Sightseeing</div>
            </div>
        </div>

        <div class="booking-sidebar">
            <div class="booking-card">
                <div class="price-header">
                    <div class="price-label">Starting from</div>
                    <div class="price-amount">
                        ₹65,000
                    </div>
                    <div class="price-label">per person (inclusive of taxes)</div>
                </div>

                <ul style="list-style: none; padding: 0; margin: 0 0 30px 0; color: #5a6e85; font-size: 15px; line-height: 2;">
                    <li><i class="fas fa-check-circle" style="color: #27ae60; margin-right: 10px;"></i> Instant Confirmation</li>
                    <li><i class="fas fa-check-circle" style="color: #27ae60; margin-right: 10px;"></i> Flexible Cancellation</li>
                    <li><i class="fas fa-check-circle" style="color: #27ae60; margin-right: 10px;"></i> 24/7 Support on Trip</li>
                </ul>

                <a href="checkout.jsp?packageId=1" class="btn-book">Proceed to Book</a>
                
                <p style="text-align: center; font-size: 13px; color: #8a9bb0; margin-top: 20px;">
                    <i class="fas fa-shield-alt"></i> 100% Secure Checkout
                </p>
            </div>
        </div>
    </div>

    <script>
        function changeImage(src) {
            document.getElementById('mainImage').src = src;
        }
    </script>
</body>
</html>