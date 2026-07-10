<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BGS Tours & Travels - Karnataka Destinations</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght=300;400;500;600;700;800&family=Inter:wght=300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        /* === DESIGN TOKENS === */
        :root {
            --primary: #0f4c75;
            --primary-light: #247ba0;
            --primary-dark: #0a3550;
            --accent: #ff6b6b;
            --gold: #ffc300;
            --success: #06d6a0;
            --bg-light: #f9f9f9;
            --bg-white: #ffffff;
            --text-dark: #1a1a1a;
            --text-gray: #666666;
            --border-light: #e8e8e8;
            --shadow-sm: 0 2px 8px rgba(0, 0, 0, 0.08);
            --shadow-md: 0 8px 24px rgba(0, 0, 0, 0.12);
            --shadow-lg: 0 16px 40px rgba(0, 0, 0, 0.16);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: 'Inter', sans-serif;
            color: var(--text-dark);
            background-color: var(--bg-light);
            overflow-x: hidden;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        /* === NAVBAR === */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 16px 5%;
            background: rgba(255, 255, 255, 0.98);
            backdrop-filter: blur(10px);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            box-shadow: var(--shadow-sm);
            border-bottom: 1px solid var(--border-light);
        }

        .logo {
            font-family: 'Poppins', sans-serif;
            font-size: 24px;
            font-weight: 700;
            color: var(--primary);
            letter-spacing: -0.5px;
        }

        .logo span {
            color: var(--accent);
        }

        .nav-links {
            display: flex;
            gap: 40px;
            list-style: none;
            align-items: center;
        }

        .nav-links a {
            font-size: 14px;
            font-weight: 500;
            color: var(--text-dark);
            transition: color 0.3s ease;
            position: relative;
        }

        .nav-links a:hover {
            color: var(--accent);
        }

        .nav-links a::after {
            content: '';
            position: absolute;
            bottom: -4px;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--accent);
            transition: width 0.3s ease;
        }

        .nav-links a:hover::after {
            width: 100%;
        }

        .btn-auth {
            display: flex;
            gap: 12px;
        }

        .btn-login, .btn-signup {
            padding: 10px 22px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 14px;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
        }

        .btn-login {
            background: transparent;
            color: var(--primary);
            border: 2px solid var(--primary);
        }

        .btn-login:hover {
            background: var(--primary);
            color: white;
            transform: translateY(-2px);
        }

        .btn-signup {
            background: var(--accent);
            color: white;
        }

        .btn-signup:hover {
            background: #ff5252;
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        /* === HERO SECTION WITH VIDEO === */
        .hero {
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 0 20px;
            color: white;
            margin-top: 60px;
            position: relative;
            overflow: hidden;
        }

        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(15, 76, 117, 0.6);
            z-index: 1;
        }

        .video-background {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: 0;
        }

        .hero-content {
            position: relative;
            z-index: 2;
            animation: slideUp 0.8s ease;
            max-width: 800px;
        }

        .hero h1 {
            font-family: 'Poppins', sans-serif;
            font-size: 3.5rem;
            font-weight: 800;
            margin-bottom: 16px;
            text-shadow: 0 4px 20px rgba(0, 0, 0, 0.4);
            line-height: 1.2;
        }

        .hero p {
            font-size: 1.2rem;
            margin-bottom: 30px;
            opacity: 0.95;
            line-height: 1.6;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
        }

        .hero-cta {
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
            animation: slideUp 1.2s ease;
        }

        .btn-hero {
            padding: 16px 40px;
            border-radius: 10px;
            font-weight: 700;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
            font-family: 'Poppins', sans-serif;
        }

        .btn-hero-primary {
            background: linear-gradient(135deg, var(--accent), #ff8787);
            color: white;
        }

        .btn-hero-primary:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-lg);
        }

        .btn-hero-secondary {
            background: white;
            color: var(--primary);
        }

        .btn-hero-secondary:hover {
            background: var(--accent);
            color: white;
            transform: translateY(-4px);
        }

        /* === FEATURED SECTION === */
        .featured-section {
            background: linear-gradient(135deg, rgba(15, 76, 117, 0.05) 0%, rgba(255, 107, 107, 0.05) 100%);
            padding: 80px 20px;
        }

        .section-container {
            max-width: 1400px;
            margin: 0 auto;
        }

        .section-header {
            text-align: center;
            margin-bottom: 60px;
        }

        .section-label {
            display: inline-block;
            background: rgba(15, 76, 117, 0.1);
            color: var(--primary);
            padding: 8px 18px;
            border-radius: 30px;
            font-size: 12px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1.2px;
            margin-bottom: 16px;
        }

        .section-title {
            font-family: 'Poppins', sans-serif;
            font-size: 2.8rem;
            font-weight: 800;
            color: var(--text-dark);
            margin-bottom: 12px;
        }

        .section-subtitle {
            font-size: 16px;
            color: var(--text-gray);
            max-width: 600px;
            margin: 0 auto;
        }

        /* === ENHANCED CARDS GRID === */
        .cards-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 32px;
            padding: 20px 0;
        }

        .tour-card {
            background: white;
            border-radius: 18px;
            overflow: hidden;
            box-shadow: var(--shadow-sm);
            transition: all 0.35s cubic-bezier(0.4, 0, 0.2, 1);
            cursor: pointer;
            display: flex;
            flex-direction: column;
            position: relative;
        }

        .tour-card:hover {
            transform: translateY(-16px);
            box-shadow: var(--shadow-lg);
        }

        .card-img-wrapper {
            position: relative;
            height: 260px;
            overflow: hidden;
            background: linear-gradient(135deg, var(--primary), var(--primary-light));
        }

        .card-img-wrapper img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .tour-card:hover .card-img-wrapper img {
            transform: scale(1.12) rotate(2deg);
        }

        .card-overlay {
            position: absolute;
            inset: 0;
            background: linear-gradient(180deg, rgba(0, 0, 0, 0.2) 0%, rgba(0, 0, 0, 0.5) 100%);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .tour-card:hover .card-overlay {
            opacity: 1;
        }

        .badge {
            position: absolute;
            top: 16px;
            right: 16px;
            background: rgba(255, 255, 255, 0.98);
            color: var(--accent);
            padding: 8px 16px;
            border-radius: 25px;
            font-size: 13px;
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 6px;
            box-shadow: var(--shadow-md);
            z-index: 10;
            backdrop-filter: blur(10px);
        }

        .badge i {
            color: var(--gold);
            font-size: 14px;
        }

        .badge-tag {
            position: absolute;
            top: 16px;
            left: 16px;
            background: linear-gradient(135deg, var(--primary), var(--primary-light));
            color: white;
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 700;
            text-transform: uppercase;
            z-index: 10;
        }

        .card-content {
            padding: 28px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }

        .card-title {
            font-family: 'Poppins', sans-serif;
            font-size: 21px;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 10px;
            line-height: 1.3;
        }

        .card-location {
            display: flex;
            align-items: center;
            gap: 8px;
            color: var(--accent);
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 16px;
        }

        .card-location i {
            font-size: 16px;
        }

        .card-meta {
            display: flex;
            gap: 16px;
            color: var(--text-gray);
            font-size: 13px;
            margin-bottom: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid var(--border-light);
            flex-wrap: wrap;
        }

        .card-meta span {
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .card-meta i {
            color: var(--accent);
            font-size: 15px;
        }

        .card-description {
            color: var(--text-gray);
            font-size: 14px;
            line-height: 1.6;
            margin-bottom: 20px;
            flex-grow: 1;
        }

        .card-highlights {
            display: flex;
            gap: 8px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }

        .highlight-tag {
            background: rgba(15, 76, 117, 0.1);
            color: var(--primary);
            padding: 5px 12px;
            border-radius: 15px;
            font-size: 12px;
            font-weight: 600;
        }

        .card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 16px;
            padding-top: 20px;
            border-top: 1px solid var(--border-light);
        }

        .price-section {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .price {
            font-family: 'Poppins', sans-serif;
            font-size: 26px;
            font-weight: 800;
            color: var(--accent);
        }

        .price span {
            font-size: 12px;
            color: var(--text-gray);
            font-weight: 500;
        }

        .btn-details {
            padding: 11px 24px;
            background: linear-gradient(135deg, var(--primary), var(--primary-light));
            color: white;
            border: none;
            border-radius: 10px;
            font-weight: 700;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s ease;
            white-space: nowrap;
            font-family: 'Poppins', sans-serif;
        }

        .btn-details:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-md);
        }

        .btn-details:active {
            transform: translateY(-1px);
        }

        /* === FEATURES SECTION === */
        .features-section {
            padding: 80px 20px;
            background: white;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 40px;
            margin-top: 50px;
        }

        .feature-card {
            text-align: center;
            padding: 45px 35px;
            border-radius: 16px;
            background: var(--bg-light);
            transition: all 0.3s ease;
        }

        .feature-card:hover {
            background: white;
            box-shadow: var(--shadow-lg);
            transform: translateY(-8px);
        }

        .feature-icon {
            width: 75px;
            height: 75px;
            margin: 0 auto 25px;
            background: linear-gradient(135deg, var(--accent), #ff8787);
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 35px;
        }

        .feature-card:nth-child(2) .feature-icon {
            background: linear-gradient(135deg, var(--gold), #ffd54f);
        }

        .feature-card:nth-child(3) .feature-icon {
            background: linear-gradient(135deg, var(--success), #1de9b6);
        }

        .feature-title {
            font-family: 'Poppins', sans-serif;
            font-size: 18px;
            font-weight: 700;
            margin-bottom: 12px;
            color: var(--text-dark);
        }

        .feature-text {
            color: var(--text-gray);
            font-size: 14px;
            line-height: 1.6;
        }

        /* === FOOTER === */
        footer {
            background: linear-gradient(135deg, var(--primary-dark) 0%, var(--primary) 100%);
            color: white;
            padding: 60px 20px 30px;
        }

        .footer-container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .footer-grid {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 1fr;
            gap: 50px;
            margin-bottom: 40px;
        }

        .footer-col h4 {
            font-family: 'Poppins', sans-serif;
            font-size: 18px;
            font-weight: 700;
            margin-bottom: 24px;
        }

        .footer-col p {
            color: rgba(255, 255, 255, 0.8);
            font-size: 14px;
            line-height: 1.8;
            margin-bottom: 20px;
        }

        .footer-links {
            list-style: none;
        }

        .footer-links li {
            margin-bottom: 12px;
        }

        .footer-links a {
            color: rgba(255, 255, 255, 0.8);
            font-size: 14px;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .footer-links a:hover {
            color: white;
            padding-left: 6px;
        }

        .social-icons {
            display: flex;
            gap: 16px;
            margin-top: 20px;
        }

        .social-icon {
            width: 44px;
            height: 44px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .social-icon:hover {
            background: var(--accent);
            transform: translateY(-4px);
        }

        .footer-divider {
            height: 1px;
            background: rgba(255, 255, 255, 0.2);
            margin: 40px 0;
        }

        .footer-bottom {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 20px;
            color: rgba(255, 255, 255, 0.7);
            font-size: 13px;
        }

        /* === ANIMATIONS === */
        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(40px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        /* === RESPONSIVE === */
        @media (max-width: 1024px) {
            .hero h1 {
                font-size: 2.8rem;
            }

            .section-title {
                font-size: 2.2rem;
            }

            .cards-grid {
                grid-template-columns: repeat(auto-fill, minmax(310px, 1fr));
                gap: 24px;
            }

            .footer-grid {
                grid-template-columns: 1fr 1fr;
                gap: 40px;
            }

            .features-grid {
                gap: 30px;
            }
        }

        @media (max-width: 768px) {
            .navbar {
                padding: 12px 4%;
            }

            .nav-links {
                display: none;
            }

            .hero {
                margin-top: 50px;
            }

            .hero h1 {
                font-size: 2.2rem;
            }

            .hero p {
                font-size: 1rem;
            }

            .hero-cta {
                gap: 12px;
            }

            .btn-hero {
                padding: 13px 28px;
                font-size: 15px;
            }

            .section-title {
                font-size: 1.8rem;
            }

            .cards-grid {
                grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
                gap: 20px;
            }

            .card-content {
                padding: 22px;
            }

            .footer-grid {
                grid-template-columns: 1fr;
                gap: 30px;
            }

            .footer-bottom {
                flex-direction: column;
                gap: 20px;
                text-align: center;
            }

            .features-grid {
                gap: 20px;
            }

            .feature-card {
                padding: 35px 25px;
            }
        }

        @media (max-width: 480px) {
            .logo {
                font-size: 20px;
            }

            .hero h1 {
                font-size: 1.8rem;
            }

            .section-title {
                font-size: 1.5rem;
            }

            .cards-grid {
                grid-template-columns: 1fr;
            }

            .card-content {
                padding: 20px;
            }

            .card-title {
                font-size: 18px;
            }

            .btn-hero {
                padding: 12px 24px;
                font-size: 14px;
                width: 100%;
            }

            .hero-cta {
                flex-direction: column;
            }

            .card-footer {
                flex-direction: column;
                align-items: flex-start;
                gap: 12px;
            }

            .btn-details {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>

    <nav class="navbar">
        <a href="index.jsp" class="logo">BGS <span>TOURS</span></a>
        <ul class="nav-links">
            <li><a href="#featured">Featured Packages</a></li>
            <li><a href="#features">Why Us</a></li>
            <li><a href="#footer">Contact</a></li>
        </ul>
        <div class="btn-auth">
            <a href="login.jsp" class="btn-login">Login</a>
            <a href="signup.jsp" class="btn-signup">Sign Up</a>
        </div>
    </nav>

    <section class="hero">
       <video class="video-background" autoplay muted loop playsinline>
            <source src="https://videos.pexels.com/video-files/3045163/3045163-hd_1920_1080_25fps.mp4" type="video/mp4">
            <source src="https://videos.pexels.com/video-files/3045163/3045163-hd_1280_720_25fps.mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>

        <div class="hero-content">
            <h1>Discover Karnataka's Hidden Gems</h1>
            <p>Explore pristine beaches, misty hills, ancient temples, and vibrant cultural experiences. Your perfect Karnataka journey awaits.</p>
            
            <div class="hero-cta">
                <button class="btn-hero btn-hero-primary" onclick="document.getElementById('featured').scrollIntoView({behavior: 'smooth'})">
                    <i class="fas fa-compass"></i> Explore Packages
                </button>
                <button class="btn-hero btn-hero-secondary" onclick="window.location.href='signup.jsp'">
                    <i class="fas fa-user-plus"></i> Get Started
                </button>
            </div>
        </div>
    </section>

    <section class="featured-section" id="featured">
        <div class="section-container">
            <div class="section-header">
                <div class="section-label">Karnataka Destinations</div>
                <h2 class="section-title">Featured Tour Packages</h2>
                <p class="section-subtitle">Curated experiences across Karnataka's most enchanting destinations. From coastal beauty to mountain majesty.</p>
            </div>

            <div class="cards-grid">
                
                <div class="tour-card">
                    <div class="card-img-wrapper">
                        <img src="https://images.pexels.com/photos/2398220/pexels-photo-2398220.jpeg" alt="Coorg">
                        <div class="card-overlay"></div>
                        <div class="badge-tag">Trending</div>
                        <div class="badge"><i class="fas fa-star"></i> 4.9</div>
                    </div>
                    <div class="card-content">
                        <h3 class="card-title">Coorg Coffee Paradise</h3>
                        <div class="card-location">
                            <i class="fas fa-map-marker-alt"></i> Coorg, Karnataka
                        </div>
                        <div class="card-meta">
                            <span><i class="fas fa-clock"></i> 4 Days</span>
                            <span><i class="fas fa-users"></i> Max 25</span>
                        </div>
                        <p class="card-description">Experience the lush green coffee plantations, misty hills, and serene waterfalls of Coorg.</p>
                        <div class="card-highlights">
                            <span class="highlight-tag">Coffee Plantation</span>
                            <span class="highlight-tag">Nature Trek</span>
                            <span class="highlight-tag">Waterfalls</span>
                        </div>
                        <div class="card-footer">
                            <div class="price-section">
                                <div class="price">₹28,000 <span>/per person</span></div>
                            </div>
                            <a href="packageDetails.jsp" class="btn-details">Book Now</a>
                        </div>
                    </div>
                </div>

                <div class="tour-card">
                    <div class="card-img-wrapper">
                        <img src="https://images.pexels.com/photos/4195325/pexels-photo-4195325.jpeg" alt="Mysore">
                        <div class="card-overlay"></div>
                        <div class="badge-tag">Popular</div>
                        <div class="badge"><i class="fas fa-star"></i> 4.8</div>
                    </div>
                    <div class="card-content">
                        <h3 class="card-title">Mysore Palace Tour</h3>
                        <div class="card-location">
                            <i class="fas fa-map-marker-alt"></i> Mysore, Karnataka
                        </div>
                        <div class="card-meta">
                            <span><i class="fas fa-clock"></i> 3 Days</span>
                            <span><i class="fas fa-users"></i> Max 30</span>
                        </div>
                        <p class="card-description">Explore the magnificent Mysore Palace, vibrant markets, and rich heritage of the erstwhile kingdom.</p>
                        <div class="card-highlights">
                            <span class="highlight-tag">Heritage Site</span>
                            <span class="highlight-tag">Palace</span>
                            <span class="highlight-tag">Cultural</span>
                        </div>
                        <div class="card-footer">
                            <div class="price-section">
                                <div class="price">₹22,000 <span>/per person</span></div>
                            </div>
                            <a href="packageDetails.jsp" class="btn-details">Book Now</a>
                        </div>
                    </div>
                </div>

                <div class="tour-card">
                    <div class="card-img-wrapper">
                        <img src="https://images.pexels.com/photos/1619317/pexels-photo-1619317.jpeg" alt="Gokarna">
                        <div class="card-overlay"></div>
                        <div class="badge-tag">Beach</div>
                        <div class="badge"><i class="fas fa-star"></i> 4.7</div>
                    </div>
                    <div class="card-content">
                        <h3 class="card-title">Gokarna Beach Escape</h3>
                        <div class="card-location">
                            <i class="fas fa-map-marker-alt"></i> Gokarna, Karnataka
                        </div>
                        <div class="card-meta">
                            <span><i class="fas fa-clock"></i> 4 Days</span>
                            <span><i class="fas fa-users"></i> Max 20</span>
                        </div>
                        <p class="card-description">Relax on pristine beaches, explore spiritual temples, and enjoy the bohemian beach atmosphere.</p>
                        <div class="card-highlights">
                            <span class="highlight-tag">Beach Vibes</span>
                            <span class="highlight-tag">Temple</span>
                            <span class="highlight-tag">Relaxation</span>
                        </div>
                        <div class="card-footer">
                            <div class="price-section">
                                <div class="price">₹25,000 <span>/per person</span></div>
                            </div>
                            <a href="packageDetails.jsp" class="btn-details">Book Now</a>
                        </div>
                    </div>
                </div>

                <div class="tour-card">
                    <div class="card-img-wrapper">
                        <img src="https://images.pexels.com/photos/3532557/pexels-photo-3532557.jpeg" alt="Hampi">
                        <div class="card-overlay"></div>
                        <div class="badge-tag">UNESCO</div>
                        <div class="badge"><i class="fas fa-star"></i> 4.9</div>
                    </div>
                    <div class="card-content">
                        <h3 class="card-title">Hampi Historical Tour</h3>
                        <div class="card-location">
                            <i class="fas fa-map-marker-alt"></i> Hampi, Karnataka
                        </div>
                        <div class="card-meta">
                            <span><i class="fas fa-clock"></i> 3 Days</span>
                            <span><i class="fas fa-users"></i> Max 25</span>
                        </div>
                        <p class="card-description">Discover the architectural marvels and ancient ruins of the Vijayanagara Empire at this UNESCO World Heritage Site.</p>
                        <div class="card-highlights">
                            <span class="highlight-tag">UNESCO Site</span>
                            <span class="highlight-tag">Ancient Ruins</span>
                            <span class="highlight-tag">Architecture</span>
                        </div>
                        <div class="card-footer">
                            <div class="price-section">
                                <div class="price">₹20,000 <span>/per person</span></div>
                            </div>
                            <a href="packageDetails.jsp" class="btn-details">Book Now</a>
                        </div>
                    </div>
                </div>

                <div class="tour-card">
                    <div class="card-img-wrapper">
                        <img src="https://images.pexels.com/photos/1761279/pexels-photo-1761279.jpeg" alt="Chikmagalur">
                        <div class="card-overlay"></div>
                        <div class="badge-tag">Adventure</div>
                        <div class="badge"><i class="fas fa-star"></i> 4.8</div>
                    </div>
                    <div class="card-content">
                        <h3 class="card-title">Chikmagalur Trek & Tea</h3>
                        <div class="card-location">
                            <i class="fas fa-map-marker-alt"></i> Chikmagalur, Karnataka
                        </div>
                        <div class="card-meta">
                            <span><i class="fas fa-clock"></i> 5 Days</span>
                            <span><i class="fas fa-users"></i> Max 15</span>
                        </div>
                        <p class="card-description">Trek through coffee plantations, visit tea estates, and conquer peaks in the Western Ghats.</p>
                        <div class="card-highlights">
                            <span class="highlight-tag">Trekking</span>
                            <span class="highlight-tag">Coffee Tour</span>
                            <span class="highlight-tag">Peak Climb</span>
                        </div>
                        <div class="card-footer">
                            <div class="price-section">
                                <div class="price">₹32,000 <span>/per person</span></div>
                            </div>
                            <a href="packageDetails.jsp" class="btn-details">Book Now</a>
                        </div>
                    </div>
                </div>

                <div class="tour-card">
                    <div class="card-img-wrapper">
                        <img src="https://images.pexels.com/photos/3601453/pexels-photo-3601453.jpeg" alt="Jog Falls">
                        <div class="card-overlay"></div>
                        <div class="badge-tag">Nature</div>
                        <div class="badge"><i class="fas fa-star"></i> 4.6</div>
                    </div>
                    <div class="card-content">
                        <h3 class="card-title">Jog Falls Waterfall Tour</h3>
                        <div class="card-location">
                            <i class="fas fa-map-marker-alt"></i> Jog Falls, Karnataka
                        </div>
                        <div class="card-meta">
                            <span><i class="fas fa-clock"></i> 2 Days</span>
                            <span><i class="fas fa-users"></i> Max 30</span>
                        </div>
                        <p class="card-description">Witness the breathtaking Jog Falls, one of India's highest waterfalls, cascading into a pristine gorge.</p>
                        <div class="card-highlights">
                            <span class="highlight-tag">Waterfall</span>
                            <span class="highlight-tag">Photography</span>
                            <span class="highlight-tag">Nature Walk</span>
                        </div>
                        <div class="card-footer">
                            <div class="price-section">
                                <div class="price">₹15,000 <span>/per person</span></div>
                            </div>
                            <a href="packageDetails.jsp" class="btn-details">Book Now</a>
                        </div>
                    </div>
                </div>

                <div class="tour-card">
                    <div class="card-img-wrapper">
                        <img src="https://images.pexels.com/photos/1760010/pexels-photo-1760010.jpeg" alt="Hassan">
                        <div class="card-overlay"></div>
                        <div class="badge-tag">Temples</div>
                        <div class="badge"><i class="fas fa-star"></i> 4.7</div>
                    </div>
                    <div class="card-content">
                        <h3 class="card-title">Hassan Temple Trail</h3>
                        <div class="card-location">
                            <i class="fas fa-map-marker-alt"></i> Hassan, Karnataka
                        </div>
                        <div class="card-meta">
                            <span><i class="fas fa-clock"></i> 3 Days</span>
                            <span><i class="fas fa-users"></i> Max 25</span>
                        </div>
                        <p class="card-description">Explore the magnificent Hoysala temples, intricate stone carvings, and spiritual heritage of Hassan.</p>
                        <div class="card-highlights">
                            <span class="highlight-tag">Ancient Temples</span>
                            <span class="highlight-tag">Architecture</span>
                            <span class="highlight-tag">Spiritual</span>
                        </div>
                        <div class="card-footer">
                            <div class="price-section">
                                <div class="price">₹18,000 <span>/per person</span></div>
                            </div>
                            <a href="packageDetails.jsp" class="btn-details">Book Now</a>
                        </div>
                    </div>
                </div>

                <div class="tour-card">
                    <div class="card-img-wrapper">
                        <img src="https://images.pexels.com/photos/1521572/pexels-photo-1521572.jpeg" alt="Udupi">
                        <div class="card-overlay"></div>
                        <div class="badge-tag">Beach</div>
                        <div class="badge"><i class="fas fa-star"></i> 4.5</div>
                    </div>
                    <div class="card-content">
                        <h3 class="card-title">Udupi Coastal Adventure</h3>
                        <div class="card-location">
                            <i class="fas fa-map-marker-alt"></i> Udupi, Karnataka
                        </div>
                        <div class="card-meta">
                            <span><i class="fas fa-clock"></i> 3 Days</span>
                            <span><i class="fas fa-users"></i> Max 28</span>
                        </div>
                        <p class="card-description">Experience pristine beaches, sacred temples, and delicious coastal cuisine in charming Udupi.</p>
                        <div class="card-highlights">
                            <span class="highlight-tag">Beach</span>
                            <span class="highlight-tag">Temple</span>
                            <span class="highlight-tag">Cuisine</span>
                        </div>
                        <div class="card-footer">
                            <div class="price-section">
                                <div class="price">₹19,000 <span>/per person</span></div>
                            </div>
                            <a href="packageDetails.jsp" class="btn-details">Book Now</a>
                        </div>
                    </div>
                </div>

                <div class="tour-card">
                    <div class="card-img-wrapper">
                        <img src="https://images.pexels.com/photos/3935702/pexels-photo-3935702.jpeg" alt="Mangalore">
                        <div class="card-overlay"></div>
                        <div class="badge-tag">City</div>
                        <div class="badge"><i class="fas fa-star"></i> 4.4</div>
                    </div>
                    <div class="card-content">
                        <h3 class="card-title">Mangalore City Explorer</h3>
                        <div class="card-location">
                            <i class="fas fa-map-marker-alt"></i> Mangalore, Karnataka
                        </div>
                        <div class="card-meta">
                            <span><i class="fas fa-clock"></i> 3 Days</span>
                            <span><i class="fas fa-users"></i> Max 30</span>
                        </div>
                        <p class="card-description">Discover Mangalore's historic forts, serene beaches, and vibrant coffee culture with local flavor.</p>
                        <div class="card-highlights">
                            <span class="highlight-tag">Historical Forts</span>
                            <span class="highlight-tag">Coastal Beauty</span>
                            <span class="highlight-tag">Coffee Trail</span>
                        </div>
                        <div class="card-footer">
                            <div class="price-section">
                                <div class="price">₹17,000 <span>/per person</span></div>
                            </div>
                            <a href="packageDetails.jsp" class="btn-details">Book Now</a>
                        </div>
                    </div>
                </div>

                <div class="tour-card">
                    <div class="card-img-wrapper">
                        <img src="https://images.pexels.com/photos/1761279/pexels-photo-1761279.jpeg" alt="Bangalore">
                        <div class="card-overlay"></div>
                        <div class="badge-tag">City</div>
                        <div class="badge"><i class="fas fa-star"></i> 4.6</div>
                    </div>
                    <div class="card-content">
                        <h3 class="card-title">Bangalore Tech & Culture</h3>
                        <div class="card-location">
                            <i class="fas fa-map-marker-alt"></i> Bangalore, Karnataka
                        </div>
                        <div class="card-meta">
                            <span><i class="fas fa-clock"></i> 2 Days</span>
                            <span><i class="fas fa-users"></i> Max 35</span>
                        </div>
                        <p class="card-description">Explore gardens, palaces, historic sites, vibrant cafes, and the innovation hub of India.</p>
                        <div class="card-highlights">
                            <span class="highlight-tag">Historic Sites</span>
                            <span class="highlight-tag">Gardens</span>
                            <span class="highlight-tag">Cafes & Culture</span>
                        </div>
                        <div class="card-footer">
                            <div class="price-section">
                                <div class="price">₹14,000 <span>/per person</span></div>
                            </div>
                            <a href="packageDetails.jsp" class="btn-details">Book Now</a>
                        </div>
                    </div>
                </div>

                <div class="tour-card">
                    <div class="card-img-wrapper">
                        <img src="https://images.pexels.com/photos/1470168/pexels-photo-1470168.jpeg" alt="Belagavi">
                        <div class="card-overlay"></div>
                        <div class="badge-tag">Heritage</div>
                        <div class="badge"><i class="fas fa-star"></i> 4.5</div>
                    </div>
                    <div class="card-content">
                        <h3 class="card-title">Belagavi Heritage Quest</h3>
                        <div class="card-location">
                            <i class="fas fa-map-marker-alt"></i> Belagavi, Karnataka
                        </div>
                        <div class="card-meta">
                            <span><i class="fas fa-clock"></i> 2 Days</span>
                            <span><i class="fas fa-users"></i> Max 25</span>
                        </div>
                        <p class="card-description">Visit historic forts, ancient temples, and colonial architecture in the cultural heart of Karnataka.</p>
                        <div class="card-highlights">
                            <span class="highlight-tag">Forts</span>
                            <span class="highlight-tag">Colonial</span>
                            <span class="highlight-tag">Heritage</span>
                        </div>
                        <div class="card-footer">
                            <div class="price-section">
                                <div class="price">₹13,000 <span>/per person</span></div>
                            </div>
                            <a href="packageDetails.jsp" class="btn-details">Book Now</a>
                        </div>
                    </div>
                </div>

                <div class="tour-card">
                    <div class="card-img-wrapper">
                        <img src="https://images.pexels.com/photos/2398220/pexels-photo-2398220.jpeg" alt="Wayanad">
                        <div class="card-overlay"></div>
                        <div class="badge-tag">Premium</div>
                        <div class="badge"><i class="fas fa-star"></i> 4.9</div>
                    </div>
                    <div class="card-content">
                        <h3 class="card-title">Wayanad Premium Trek</h3>
                        <div class="card-location">
                            <i class="fas fa-map-marker-alt"></i> Wayanad (Kerala Border)
                        </div>
                        <div class="card-meta">
                            <span><i class="fas fa-clock"></i> 4 Days</span>
                            <span><i class="fas fa-users"></i> Max 12</span>
                        </div>
                        <p class="card-description">Trek through misty mountains, visit waterfalls, and stay in luxury resorts in nature's lap.</p>
                        <div class="card-highlights">
                            <span class="highlight-tag">Mountain Trek</span>
                            <span class="highlight-tag">Luxury Stay</span>
                            <span class="highlight-tag">Nature Paradise</span>
                        </div>
                        <div class="card-footer">
                            <div class="price-section">
                                <div class="price">₹42,000 <span>/per person</span></div>
                            </div>
                            <a href="packageDetails.jsp" class="btn-details">Book Now</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <section class="features-section" id="features">
        <div class="section-container">
            <div class="section-header">
                <div class="section-label">Why Choose Us</div>
                <h2 class="section-title">Why BGS Tours?</h2>
                <p class="section-subtitle">We provide exceptional travel experiences with personalized service and unbeatable value.</p>
            </div>

            <div class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-handshake"></i>
                    </div>
                    <h3 class="feature-title">Expert Guidance</h3>
                    <p class="feature-text">Our experienced travel consultants customize every trip to match your preferences and budget perfectly.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-trophy"></i>
                    </div>
                    <h3 class="feature-title">Award Winning</h3>
                    <p class="feature-text">Recognized for excellence in travel planning and customer satisfaction across the region.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    <h3 class="feature-title">Secure Booking</h3>
                    <p class="feature-text">100% secure and transparent booking process with comprehensive travel insurance options included.</p>
                </div>
            </div>
        </div>
    </section>

    <footer id="footer">
        <div class="footer-container">
            <div class="footer-grid">
                <div class="footer-col">
                    <h4>BGS Tours & Travels</h4>
                    <p>Your gateway to Kerala, Karnataka, and beyond. Creating unforgettable memories through personalized travel experiences since 2015.</p>
                    <div class="social-icons">
                        <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <div class="footer-col">
                    <h4>Quick Links</h4>
                    <ul class="footer-links">
                        <li><a href="#featured">Destinations</a></li>
                        <li><a href="#features">About Us</a></li>
                        <li><a href="#">Travel Blog</a></li>
                        <li><a href="#">Career</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>Support</h4>
                    <ul class="footer-links">
                        <li><a href="#">Contact Us</a></li>
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">Cancellation Policy</a></li>
                        <li><a href="#">Reviews</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>Contact Info</h4>
                    <ul class="footer-links">
                        <li><a href="tel:+919876543210"><i class="fas fa-phone"></i> +91 98765 43210</a></li>
                        <li><a href="mailto:hello@bgstours.com"><i class="fas fa-envelope"></i> hello@bgstours.com</a></li>
                        <li><a href="#"><i class="fas fa-map-marker-alt"></i> Yelahanka, Bangalore</a></li>
                    </ul>
                </div>
            </div>

            <div class="footer-divider"></div>

            <div class="footer-bottom">
                <p>&copy; 2026 BGS Tours & Travels. All rights reserved.</p>
                <p>Privacy Policy | Terms & Conditions | Cookie Policy</p>
            </div>
        </div>
    </footer>

    <script>
        // Smooth scroll for navigation links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function(e) {
                const href = this.getAttribute('href');
                if (href !== '#') {
                    e.preventDefault();
                    const target = document.querySelector(href);
                    if (target) {
                        target.scrollIntoView({ behavior: 'smooth' });
                    }
                }
            });
        });

        // Add navbar shadow on scroll
        const navbar = document.querySelector('.navbar');
        window.addEventListener('scroll', () => {
            if (window.scrollY > 50) {
                navbar.style.boxShadow = '0 8px 24px rgba(0, 0, 0, 0.12)';
            } else {
                navbar.style.boxShadow = '0 2px 8px rgba(0, 0, 0, 0.08)';
            }
        });

        // Video autoplay on mobile
        const video = document.querySelector('.video-background');
        if (video) {
            video.addEventListener('loadstart', function() {
                this.play();
            });
        }
    </script>

</body>
</html>