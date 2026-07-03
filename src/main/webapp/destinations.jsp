<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Destinations - Sapphire Tours</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { font-family: 'Inter', sans-serif; background: #f8fafc; margin: 0; padding: 0; color: #1a2c3e; }
        
        .navbar { background: white; padding: 20px 5%; box-shadow: 0 2px 10px rgba(0,0,0,0.05); display: flex; justify-content: space-between; align-items: center; position: sticky; top: 0; z-index: 100; }
        .logo { font-size: 24px; font-weight: 800; color: #1a2c3e; text-decoration: none; }
        .logo span { color: #115eb6; }
        .nav-links { display: flex; gap: 30px; list-style: none; }
        .nav-links a { color: #1a2c3e; text-decoration: none; font-weight: 500; transition: 0.3s; }
        .nav-links a:hover { color: #115eb6; }

        .header-banner { background: linear-gradient(rgba(10, 42, 140, 0.7), rgba(10, 42, 140, 0.7)), url('https://images.pexels.com/photos/346885/pexels-photo-346885.jpeg') center/cover; padding: 80px 20px; text-align: center; color: white; }
        .header-banner h1 { font-size: 3rem; margin-bottom: 15px; }
        .header-banner p { font-size: 1.1rem; opacity: 0.9; }

        .container { max-width: 1300px; margin: 60px auto; padding: 0 20px; }
        
        .destinations-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(350px, 1fr)); gap: 30px; }
        
        .dest-card { background: white; border-radius: 20px; overflow: hidden; box-shadow: 0 10px 25px rgba(0,0,0,0.05); transition: 0.3s; border: 1px solid #eef2f8; }
        .dest-card:hover { transform: translateY(-8px); box-shadow: 0 15px 35px rgba(0,0,0,0.1); }
        
        .img-wrapper { position: relative; height: 250px; }
        .img-wrapper img { width: 100%; height: 100%; object-fit: cover; }
        .price-badge { position: absolute; bottom: 15px; left: 15px; background: #115eb6; color: white; padding: 8px 15px; border-radius: 30px; font-weight: 700; font-size: 15px; }
        
        .card-body { padding: 25px; }
        .dest-title { font-size: 22px; font-weight: 700; margin-bottom: 10px; }
        .dest-desc { color: #5a6e85; font-size: 14px; line-height: 1.6; margin-bottom: 20px; }
        
        .features { display: flex; gap: 15px; font-size: 13px; color: #4a627a; padding-bottom: 20px; border-bottom: 1px solid #eef2f8; margin-bottom: 20px; }
        .features i { color: #115eb6; margin-right: 5px; }
        
        .btn-view { display: block; text-align: center; width: 100%; padding: 12px; background: transparent; color: #115eb6; border: 2px solid #115eb6; border-radius: 40px; font-weight: 600; text-decoration: none; transition: 0.3s; box-sizing: border-box; }
        .btn-view:hover { background: #115eb6; color: white; }
    </style>
</head>
<body>

    <nav class="navbar">
        <a href="index.jsp" class="logo">SAPPHIRE <span>TOURS</span></a>
        <ul class="nav-links">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="destinations.jsp" style="color: #115eb6;">Destinations</a></li>
            <li><a href="sign.jsp">Login</a></li>
        </ul>
    </nav>

    <div class="header-banner">
        <h1>Explore Our Destinations</h1>
        <p>Curated travel packages to the most beautiful places on Earth.</p>
    </div>

    <div class="container">
        <div class="destinations-grid">
            
            <div class="dest-card">
                <div class="img-wrapper">
                    <img src="https://images.pexels.com/photos/3225531/pexels-photo-3225531.jpeg" alt="Bali">
                    <div class="price-badge">₹45,000 /pp</div>
                </div>
                <div class="card-body">
                    <h3 class="dest-title">Bali Tropical Escape</h3>
                    <p class="dest-desc">Experience the serene beaches, ancient temples, and rich culture of Indonesia.</p>
                    <div class="features">
                        <span><i class="fas fa-clock"></i> 6 Days</span>
                        <span><i class="fas fa-hotel"></i> 4-Star Stay</span>
                    </div>
                    <a href="destination-details.jsp" class="btn-view">View Itinerary</a>
                </div>
            </div>

            <div class="dest-card">
                <div class="img-wrapper">
                    <img src="https://images.pexels.com/photos/164041/pexels-photo-164041.jpeg" alt="Maldives">
                    <div class="price-badge">₹85,000 /pp</div>
                </div>
                <div class="card-body">
                    <h3 class="dest-title">Maldives Ocean Villa</h3>
                    <p class="dest-desc">Relax in private overwater bungalows with crystal clear waters at your doorstep.</p>
                    <div class="features">
                        <span><i class="fas fa-clock"></i> 4 Days</span>
                        <span><i class="fas fa-plane"></i> Flights Inc.</span>
                    </div>
                    <a href="destination-details.jsp" class="btn-view">View Itinerary</a>
                </div>
            </div>

            <div class="dest-card">
                <div class="img-wrapper">
                    <img src="https://images.pexels.com/photos/1371360/pexels-photo-1371360.jpeg" alt="Swiss Alps">
                    <div class="price-badge">₹1,15,000 /pp</div>
                </div>
                <div class="card-body">
                    <h3 class="dest-title">Swiss Alpine Adventure</h3>
                    <p class="dest-desc">Embark on a thrilling journey through snow-capped mountains and picturesque villages.</p>
                    <div class="features">
                        <span><i class="fas fa-clock"></i> 7 Days</span>
                        <span><i class="fas fa-train"></i> Scenic Rail</span>
                    </div>
                    <a href="destination-details.jsp" class="btn-view">View Itinerary</a>
                </div>
            </div>

            <div class="dest-card">
                <div class="img-wrapper">
                    <img src="https://images.pexels.com/photos/1010657/pexels-photo-1010657.jpeg" alt="Santorini">
                    <div class="price-badge">₹95,000 /pp</div>
                </div>
                <div class="card-body">
                    <h3 class="dest-title">Santorini Sunsets</h3>
                    <p class="dest-desc">Wander through iconic white-washed streets overlooking the beautiful Aegean Sea.</p>
                    <div class="features">
                        <span><i class="fas fa-clock"></i> 5 Days</span>
                        <span><i class="fas fa-ship"></i> Cruise</span>
                    </div>
                    <a href="destination-details.jsp" class="btn-view">View Itinerary</a>
                </div>
            </div>

            <div class="dest-card">
                <div class="img-wrapper">
                    <img src="https://images.pexels.com/photos/1822605/pexels-photo-1822605.jpeg" alt="Kyoto">
                    <div class="price-badge">₹1,05,000 /pp</div>
                </div>
                <div class="card-body">
                    <h3 class="dest-title">Kyoto Cultural Tour</h3>
                    <p class="dest-desc">Discover historic shrines, bamboo forests, and traditional tea ceremonies in Japan.</p>
                    <div class="features">
                        <span><i class="fas fa-clock"></i> 8 Days</span>
                        <span><i class="fas fa-camera"></i> Guided Tour</span>
                    </div>
                    <a href="destination-details.jsp" class="btn-view">View Itinerary</a>
                </div>
            </div>

        </div>
    </div>

</body>
</html>