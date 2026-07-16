<%@page import="com.tours.dto.Users"%>
<%@page import="com.tours.dto.Packages"%>
<%@page import="com.tours.dto.Destinations"%>
<%@page import="com.tours.dto.Images"%>
<%@page import="com.tours.dao.PackagesDAO"%>
<%@page import="com.tours.daoImpl.PackagesDAOImpl"%>
<%@page import="com.tours.dao.DestinationDAO"%>
<%@page import="com.tours.daoImpl.DestinationsDAOImpl"%>
<%@page import="com.tours.dao.ImagesDAO"%>
<%@page import="com.tours.daoImpl.ImagesDAOImpl"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BGS Tours and Travels | Explore Karnataka</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            color: #1a2c3e;
            overflow-x: hidden;
        }

        /* Navbar Styling */
        .navbar {
            display: flex;
            height: 70px;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 5%;
            background: rgba(255, 255, 255, 0.95);
            box-shadow: 0 2px 15px rgba(0,0,0,0.05);
            position: fixed;
            width: 100%;
            z-index: 1000;
            top: 0;
        }

        .logo-text {
            font-size: 24px;
            font-weight: 800;
            color: #1a2c3e;
            text-decoration: none;
            letter-spacing: 1px;
        }

        .logo-text span {
            color: #27ae60;
        }

        .nav-links {
            display: flex;
            list-style: none;
            gap: 2.5rem;
        }

        .nav-links li a {
            text-decoration: none;
            color: #4a5568;
            font-weight: 600;
            font-size: 14px;
            transition: color 0.3s ease;
        }

        .nav-links li a:hover {
            color: #27ae60;
        }

        .nav-actions a {
            padding: 10px 24px;
            background: #27ae60;
            color: white;
            text-decoration: none;
            border-radius: 30px;
            font-weight: 600;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .nav-actions a:hover {
            background: #219653;
            box-shadow: 0 4px 10px rgba(39, 174, 96, 0.3);
        }

        /* Hero Section */
        .hero {
            position: relative;
            height: 100vh;
            min-height: 600px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            background: url('https://images.unsplash.com/photo-1600100397608-f010f4198753?q=80&w=2000&auto=format&fit=crop') center/cover no-repeat;
            margin-top: 70px;
        }

        .hero-overlay {
            position: absolute;
            top: 0; left: 0; width: 100%; height: 100%;
            background: linear-gradient(to bottom, rgba(26, 44, 62, 0.7), rgba(39, 174, 96, 0.4));
        }

        .hero-content {
            position: relative;
            z-index: 2;
            max-width: 800px;
            padding: 2rem;
            color: white;
        }

        .hero-subtitle {
            font-size: 1rem;
            text-transform: uppercase;
            letter-spacing: 4px;
            margin-bottom: 1rem;
            font-weight: 600;
            color: #f1c40f;
        }

        .hero-title {
            font-size: 4.5rem;
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            line-height: 1.1;
            margin-bottom: 1.5rem;
        }

        .hero-description {
            font-size: 1.2rem;
            margin-bottom: 2.5rem;
            line-height: 1.6;
            opacity: 0.9;
        }

        /* Packages Section */
        .packages-section {
            padding: 80px 5%;
            max-width: 1400px;
            margin: 0 auto;
        }

        .section-header {
            text-align: center;
            margin-bottom: 50px;
        }

        .section-badge {
            display: inline-block;
            font-size: 12px;
            letter-spacing: 2px;
            text-transform: uppercase;
            color: #27ae60;
            font-weight: 700;
            background: rgba(39, 174, 96, 0.1);
            padding: 6px 16px;
            border-radius: 30px;
            margin-bottom: 15px;
        }

        .section-title {
            font-size: 36px;
            font-family: 'Playfair Display', serif;
            color: #1a2c3e;
            margin-bottom: 15px;
        }

        /* Grid & Cards */
        .packages-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 30px;
        }

        .package-card {
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            display: flex;
            flex-direction: column;
        }

        .package-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.12);
        }

        .card-image {
            height: 240px;
            position: relative;
            overflow: hidden;
        }

        .card-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .package-card:hover .card-image img {
            transform: scale(1.08);
        }

        .destination-badge {
            position: absolute;
            top: 15px;
            left: 15px;
            background: rgba(26, 44, 62, 0.8);
            color: white;
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            backdrop-filter: blur(4px);
        }

        .duration-badge {
            position: absolute;
            bottom: 15px;
            right: 15px;
            background: #f1c40f;
            color: #1a2c3e;
            padding: 4px 12px;
            border-radius: 15px;
            font-size: 12px;
            font-weight: 700;
        }

        .card-body {
            padding: 25px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }

        .package-title {
            font-size: 22px;
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            color: #1a2c3e;
            margin-bottom: 10px;
        }

        .package-desc {
            color: #64748b;
            font-size: 14px;
            line-height: 1.6;
            margin-bottom: 20px;
            flex-grow: 1;
        }

        .card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 20px;
            border-top: 1px solid #e2e8f0;
        }

        .price-box {
            display: flex;
            flex-direction: column;
        }

        .price-label {
            font-size: 12px;
            color: #94a3b8;
        }

        .price-amount {
            font-size: 24px;
            font-weight: 700;
            color: #27ae60;
        }

        .book-btn {
            padding: 10px 24px;
            background: #1a2c3e;
            color: white;
            border: none;
            border-radius: 30px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .book-btn:hover {
            background: #27ae60;
        }

    </style>
</head>
<body>

    <% 
        // Retrieve the logged-in user from the session
        Users user = (Users)session.getAttribute("user"); 
    %>

    <!-- Navigation -->
    <nav class="navbar">
        <a href="index.jsp" class="logo-text">BGS<span>Tours</span></a>
        <ul class="nav-links">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="#destinations">Destinations</a></li>
            <li><a href="#packages">Tour Packages</a></li>
            <% if(user != null) { %>
                <li><a href="myBookings.jsp">My Bookings</a></li>
            <% } %>
        </ul>
        <div class="nav-actions">
            <% if(user == null) { %>
                <a href="sign.jsp">Login / Sign Up</a>
            <% } else { %>
                <a href="logout" style="background: #e74c3c;">Logout</a>
            <% } %>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-overlay"></div>
        <div class="hero-content">
            <div class="hero-subtitle">One State, Many Worlds</div>
            <h1 class="hero-title">Discover the Heritage of Karnataka</h1>
            <p class="hero-description">From the ancient ruins of Hampi and the coffee estates of Coorg, to the pristine beaches of Gokarna. Your ultimate Karnataka adventure starts here.</p>
            <a href="#packages" style="padding: 15px 35px; background: #27ae60; color: white; text-decoration: none; border-radius: 40px; font-weight: 700; font-size: 16px;">Explore Packages</a>
        </div>
    </section>

    <!-- Tour Packages Section -->
    <section id="packages" class="packages-section">
        <div class="section-header">
            <span class="section-badge">Featured Trips</span>
            <h2 class="section-title">Trending Karnataka Packages</h2>
            <p style="color: #64748b;">Carefully curated itineraries for the perfect getaway.</p>
        </div>

        <div class="packages-grid">
            
            <%
                // Initialize DAOs
                PackagesDAO pdao = new PackagesDAOImpl();
                DestinationDAO ddao = new DestinationsDAOImpl();
                ImagesDAO idao = new ImagesDAOImpl();
                
                // Fetch all packages
                List<Packages> packagesList = pdao.findAll();

                if(packagesList != null && !packagesList.isEmpty()) {
                    for(Packages p : packagesList) {
                        // Fetch associated destination and image
                        Destinations dest = ddao.findById(p.getDestId());
                        Images img = idao.getImageById(p.getImageId());
                        
                        // Fallback data if DB links are broken
                        String cityName = (dest != null) ? dest.getCity() : "Karnataka";
                        String imageUrl = (img != null) ? img.getImageUrl() : "https://images.unsplash.com/photo-1596423735880-5c6a5a9d80d2?q=80&w=800&auto=format&fit=crop"; 
            %>
            
            <!-- Dynamic Package Card -->
            <div class="package-card">
                <div class="card-image">
                    <img src="<%=imageUrl%>" alt="<%=p.getPackageName()%>">
                    <div class="destination-badge">📍 <%=cityName%></div>
                    <div class="duration-badge">⏱ <%=p.getDuration()%></div>
                </div>
                
                <div class="card-body">
                    <h3 class="package-title"><%=p.getPackageName()%></h3>
                    <p class="package-desc"><%=p.getDescription()%></p>
                    
                    <!-- Form submitting to your Servlet mapping -->
                <form action="checkout.jsp" method="POST" style="margin-top: auto;">
                        <!-- Hidden inputs to pass data to the Servlet -->
                        <input type="hidden" name="packageId" value="<%=p.getPackageId()%>">
                        <input type="hidden" name="price" value="<%=p.getPrice()%>">
                        
                        <div class="card-footer">
                            <div class="price-box">
                                <span class="price-label">Starting from</span>
                                <span class="price-amount">₹<%=p.getPrice()%></span>
                            </div>
                            
                            <% if(user != null) { %>
                                <button type="submit" class="book-btn">Book Now</button>
                            <% } else { %>
                                <a href="sign.jsp" class="book-btn" style="text-decoration: none; text-align: center;">Login to Book</a>
                            <% } %>
                        </div>
                    </form>
                </div>
            </div>
            
            <%      } 
                } else { 
            %>
                <div style="grid-column: 1 / -1; text-align: center; padding: 50px; color: #64748b;">
                    <h3>No packages available right now. Please check back later!</h3>
                </div>
            <% } %>

        </div>
    </section>

</body>
</html>