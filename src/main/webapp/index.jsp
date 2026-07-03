<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BGS Tours & Travels</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        /* === GLOBAL STYLES === */
        :root {
            --primary: #115eb6;
            --primary-dark: #0a4a8c;
            --bg-color: #f8fafc;
            --text-dark: #1a2c3e;
            --text-light: #5a6e85;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            background-color: var(--bg-color);
            color: var(--text-dark);
            overflow-x: hidden;
        }

        a { text-decoration: none; }

        /* === NAVBAR === */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 5%;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 20px rgba(0,0,0,0.05);
        }

        .logo {
            font-size: 26px;
            font-weight: 800;
            color: var(--text-dark);
            letter-spacing: -0.5px;
        }
        .logo span { color: var(--primary); }

        .nav-links {
            display: flex;
            gap: 30px;
            list-style: none;
            align-items: center;
        }

        .nav-links a {
            color: var(--text-dark);
            font-weight: 500;
            font-size: 15px;
            transition: color 0.3s ease;
        }

        .nav-links a:hover { color: var(--primary); }

        .btn-login {
            background: var(--primary);
            color: white !important;
            padding: 10px 24px;
            border-radius: 30px;
            font-weight: 600;
            transition: 0.3s ease;
        }
        .btn-login:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
        }

        /* === HERO SECTION === */
        .hero {
            height: 100vh;
            background: linear-gradient(rgba(17, 94, 182, 0.2), rgba(10, 42, 140, 0.8)), 
                        url('https://images.pexels.com/photos/346885/pexels-photo-346885.jpeg') center/cover no-repeat;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 0 20px;
            color: white;
            margin-top: 0;
        }

        .hero h1 {
            font-size: 4.5rem;
            font-weight: 800;
            margin-bottom: 15px;
            text-shadow: 0 2px 10px rgba(0,0,0,0.2);
        }

        .hero p {
            font-size: 1.2rem;
            margin-bottom: 40px;
            max-width: 600px;
            opacity: 0.9;
        }

        /* === SEARCH BAR === */
        .search-box {
            background: white;
            padding: 10px;
            border-radius: 50px;
            display: flex;
            gap: 10px;
            width: 100%;
            max-width: 800px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
        }

        .search-input {
            flex: 1;
            display: flex;
            align-items: center;
            padding: 10px 20px;
            border-right: 1px solid #eee;
        }

        .search-input:last-child { border-right: none; }
        
        .search-input i { color: var(--primary); margin-right: 10px; font-size: 18px; }
        
        .search-input input {
            border: none;
            outline: none;
            width: 100%;
            font-size: 15px;
            color: var(--text-dark);
        }

        .btn-search {
            background: var(--primary);
            color: white;
            border: none;
            padding: 15px 35px;
            border-radius: 40px;
            font-weight: 600;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }
        .btn-search:hover { background: var(--primary-dark); }

        /* === FEATURED DESTINATIONS === */
        .section-container {
            max-width: 1200px;
            margin: 80px auto;
            padding: 0 20px;
        }

        .section-title {
            text-align: center;
            margin-bottom: 50px;
        }

        .section-title span {
            background: #e8f0fe;
            color: var(--primary);
            padding: 6px 16px;
            border-radius: 30px;
            font-size: 13px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .section-title h2 {
            font-size: 36px;
            margin-top: 15px;
            color: var(--text-dark);
        }

        .cards-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 30px;
        }

        .tour-card {
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            transition: 0.3s ease;
        }
        .tour-card:hover { transform: translateY(-10px); box-shadow: 0 15px 40px rgba(0,0,0,0.1); }

        .card-img-wrapper { position: relative; height: 220px; }
        .card-img-wrapper img { width: 100%; height: 100%; object-fit: cover; }
        
        .badge {
            position: absolute;
            top: 15px;
            right: 15px;
            background: rgba(255,255,255,0.95);
            color: var(--text-dark);
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 700;
        }

        .card-content { padding: 25px; }
        .card-title { font-size: 20px; font-weight: 700; margin-bottom: 10px; }
        
        .card-meta {
            display: flex;
            gap: 15px;
            color: var(--text-light);
            font-size: 13px;
            margin-bottom: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid #eee;
        }
        .card-meta i { color: var(--primary); }

        .card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .price { font-size: 22px; font-weight: 700; color: var(--primary); }
        .price span { font-size: 13px; color: var(--text-light); font-weight: 400; }

        .btn-outline {
            padding: 8px 20px;
            border: 2px solid var(--primary);
            color: var(--primary);
            border-radius: 30px;
            font-weight: 600;
            font-size: 14px;
            transition: 0.3s;
        }
        .btn-outline:hover { background: var(--primary); color: white; }

        /* === FOOTER === */
        footer {
            background: #0a192f;
            color: white;
            padding: 60px 20px 20px;
            margin-top: 80px;
        }
        .footer-grid {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 1fr;
            gap: 40px;
            margin-bottom: 40px;
        }
        .footer-logo { font-size: 24px; font-weight: 700; color: white; margin-bottom: 20px; display: block; }
        .footer-logo span { color: #3b82f6; }
        .footer-text { color: #8a9bb0; font-size: 14px; line-height: 1.6; margin-bottom: 20px; }
        .social-icons a { color: white; font-size: 18px; margin-right: 15px; transition: 0.3s; }
        .social-icons a:hover { color: #3b82f6; }
        
        .footer-heading { font-size: 18px; font-weight: 600; margin-bottom: 20px; }
        .footer-links { list-style: none; }
        .footer-links li { margin-bottom: 12px; }
        .footer-links a { color: #8a9bb0; font-size: 14px; transition: 0.3s; }
        .footer-links a:hover { color: white; padding-left: 5px; }
        
        .footer-bottom {
            text-align: center;
            padding-top: 20px;
            border-top: 1px solid rgba(255,255,255,0.1);
            color: #8a9bb0;
            font-size: 13px;
        }

        /* Responsive */
        @media (max-width: 900px) {
            .hero h1 { font-size: 3rem; }
            .search-box { flex-direction: column; border-radius: 20px; padding: 15px; background: transparent; box-shadow: none; }
            .search-input { background: white; border-right: none; border-radius: 10px; margin-bottom: 10px; }
            .footer-grid { grid-template-columns: 1fr 1fr; }
        }
        @media (max-width: 768px) {
            .nav-links { display: none; } /* Add hamburger menu logic later */
            .footer-grid { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>

    <nav class="navbar">
        <a href="index.jsp" class="logo">BGS <span>TOURS</span></a>
        <ul class="nav-links">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="packages.jsp">Destinations</a></li>
            <li><a href="#">About Us</a></li>
            <li><a href="#">Contact</a></li>
            <li><a href="sign.jsp" class="btn-login">Login / Sign Up</a></li>
        </ul>
    </nav>

    <section class="hero">
        <h1>From Dreams to Destinations</h1>
        <p>Discover beautiful destinations, exclusive deals, and unforgettable experiences with BGS Tours.</p>
        
        <div class="search-box">
            <div class="search-input">
                <i class="fas fa-map-marker-alt"></i>
                <input type="text" placeholder="Where do you want to go?">
            </div>
            <div class="search-input">
                <i class="fas fa-calendar-alt"></i>
                <input type="text" placeholder="Check-in Date" onfocus="(this.type='date')">
            </div>
            <div class="search-input">
                <i class="fas fa-users"></i>
                <input type="number" placeholder="Guests" min="1">
            </div>
            <button class="btn-search">Search Tours</button>
        </div>
    </section>

    <section class="section-container">
        <div class="section-title">
            <span>Explore The World</span>
            <h2>PACKAGES</h2>
        </div>

        <div class="cards-grid">
            
            <div class="tour-card">
                <div class="card-img-wrapper">
                    <img src="https://images.pexels.com/photos/3225531/pexels-photo-3225531.jpeg" alt="Bali">
                    <div class="badge"><i class="fas fa-star" style="color: #f39c12;"></i> 4.9</div>
                </div>
                <div class="card-content">
                    <h3 class="card-title">Magical Bali Escape</h3>
                    <div class="card-meta">
                        <span><i class="fas fa-clock"></i> 6 Days</span>
                        <span><i class="fas fa-map-marker-alt"></i> Indonesia</span>
                    </div>
                    <div class="card-footer">
                        <div class="price">₹45,000 <span>/pp</span></div>
                        <a href="packageDetails.jsp" class="btn-outline">View Details</a>
                    </div>
                </div>
            </div>

            <div class="tour-card">
                <div class="card-img-wrapper">
                    <img src="https://images.pexels.com/photos/164041/pexels-photo-164041.jpeg" alt="Maldives">
                    <div class="badge"><i class="fas fa-star" style="color: #f39c12;"></i> 5.0</div>
                </div>
                <div class="card-content">
                    <h3 class="card-title">Maldives Ocean Villas</h3>
                    <div class="card-meta">
                        <span><i class="fas fa-clock"></i> 4 Days</span>
                        <span><i class="fas fa-map-marker-alt"></i> Maldives</span>
                    </div>
                    <div class="card-footer">
                        <div class="price">₹85,000 <span>/pp</span></div>
                        <a href="packageDetails.jsp" class="btn-outline">View Details</a>
                    </div>
                </div>
            </div>

            <div class="tour-card">
                <div class="card-img-wrapper">
                    <img src="https://images.pexels.com/photos/1371360/pexels-photo-1371360.jpeg" alt="Swiss Alps">
                    <div class="badge"><i class="fas fa-star" style="color: #f39c12;"></i> 4.8</div>
                </div>
                <div class="card-content">
                    <h3 class="card-title">Swiss Alpine Adventure</h3>
                    <div class="card-meta">
                        <span><i class="fas fa-clock"></i> 7 Days</span>
                        <span><i class="fas fa-map-marker-alt"></i> Switzerland</span>
                    </div>
                    <div class="card-footer">
                        <div class="price">₹1,15,000 <span>/pp</span></div>
                        <a href="packageDetails.jsp" class="btn-outline">View Details</a>
                    </div>
                </div>
            </div>

        </div>
    </section>

    <footer>
        <div class="footer-grid">
            <div>
                <a href="#" class="footer-logo">BGS <span>TOURS</span></a>
                <p class="footer-text">We make your travel dreams come true with curated packages, premium stays, and unforgettable experiences across the globe.</p>
                <div class="social-icons">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
            <div>
                <h4 class="footer-heading">Company</h4>
                <ul class="footer-links">
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Careers</a></li>
                    <li><a href="#">Travel Blog</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                </ul>
            </div>
            <div>
                <h4 class="footer-heading">Support</h4>
                <ul class="footer-links">
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="#">FAQ</a></li>
                    <li><a href="#">Cancellation Policy</a></li>
                    <li><a href="#">Customer Reviews</a></li>
                </ul>
            </div>
            <div>
                <h4 class="footer-heading">Contact Info</h4>
                <ul class="footer-links">
                    <li><i class="fas fa-phone" style="margin-right: 10px;"></i> +91 98765 43210</li>
                    <li><i class="fas fa-envelope" style="margin-right: 10px;"></i> hello@Bgstours.com</li>
                    <li><i class="fas fa-map-marker-alt" style="margin-right: 10px;"></i> yelahanka, Bangalore</li>
                </ul>
            </div>
        </div>
        <div class="footer-bottom">
            &copy; 2026 BGS Tours & Travels. All rights reserved.
        </div>
    </footer>

</body>
</html>