<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Package Itinerary - Sapphire Tours</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { font-family: 'Inter', sans-serif; background: #f8fafc; margin: 0; padding: 0; color: #1a2c3e; }
        
        .navbar { background: white; padding: 20px 5%; box-shadow: 0 2px 10px rgba(0,0,0,0.05); display: flex; justify-content: space-between; align-items: center; }
        .logo { font-size: 24px; font-weight: 800; color: #1a2c3e; text-decoration: none; }
        .logo span { color: #115eb6; }
        .nav-links a { color: #1a2c3e; text-decoration: none; font-weight: 500; }

        .container { max-width: 1200px; margin: 40px auto; padding: 0 20px; display: flex; gap: 40px; }
        .main-content { flex: 2; }
        .sidebar { flex: 1; }

        .hero-img { width: 100%; height: 450px; object-fit: cover; border-radius: 20px; margin-bottom: 30px; }
        
        .tag { background: #e8f0fe; color: #115eb6; padding: 6px 15px; border-radius: 30px; font-size: 14px; font-weight: 600; display: inline-block; margin-bottom: 15px; }
        h1 { font-size: 38px; margin: 0 0 20px 0; }
        .description { font-size: 16px; color: #5a6e85; line-height: 1.8; margin-bottom: 40px; }

        .itinerary-box { background: white; padding: 30px; border-radius: 16px; box-shadow: 0 4px 15px rgba(0,0,0,0.03); margin-bottom: 30px; }
        .itinerary-box h3 { margin-top: 0; font-size: 20px; border-bottom: 2px solid #eef2f8; padding-bottom: 15px; margin-bottom: 20px; }
        .day-row { display: flex; gap: 20px; margin-bottom: 20px; }
        .day-badge { background: #115eb6; color: white; width: 60px; height: 60px; border-radius: 12px; display: flex; flex-direction: column; align-items: center; justify-content: center; font-weight: 700; flex-shrink: 0; }
        .day-badge span { font-size: 11px; font-weight: 400; }
        .day-content h4 { margin: 0 0 5px 0; font-size: 16px; }
        .day-content p { margin: 0; font-size: 14px; color: #5a6e85; line-height: 1.5; }

        .booking-card { background: white; border-radius: 24px; padding: 30px; box-shadow: 0 20px 40px rgba(0,0,0,0.08); position: sticky; top: 40px; }
        .price { font-size: 42px; font-weight: 700; color: #115eb6; margin-bottom: 5px; }
        .price-sub { font-size: 14px; color: #5a6e85; margin-bottom: 25px; display: block; border-bottom: 1px solid #eef2f8; padding-bottom: 25px; }
        
        .included-list { list-style: none; padding: 0; margin: 0 0 30px 0; }
        .included-list li { margin-bottom: 12px; font-size: 15px; color: #4a627a; display: flex; align-items: center; gap: 10px; }
        .included-list i { color: #27ae60; }

        .btn-book { display: block; text-align: center; width: 100%; padding: 16px; background: #115eb6; color: white; border: none; border-radius: 40px; font-size: 16px; font-weight: 600; text-decoration: none; transition: 0.3s; box-sizing: border-box; }
        .btn-book:hover { background: #0a4a8c; transform: translateY(-2px); }

        @media (max-width: 900px) { .container { flex-direction: column; } .booking-card { position: static; } }
    </style>
</head>
<body>

    <nav class="navbar">
        <a href="index.jsp" class="logo">SAPPHIRE <span>TOURS</span></a>
        <div class="nav-links">
            <a href="destinations.jsp"><i class="fas fa-arrow-left"></i> Back to Destinations</a>
        </div>
    </nav>

    <div class="container">
        <div class="main-content">
            <img src="https://images.pexels.com/photos/3225531/pexels-photo-3225531.jpeg" class="hero-img" alt="Destination">
            
            <span class="tag"><i class="fas fa-map-marker-alt"></i> Bali, Indonesia</span>
            <h1>Bali Tropical Escape</h1>
            <p class="description">Immerse yourself in the breathtaking beauty of Bali. This curated package includes guided tours of historic water temples, relaxed beach days at Seminyak, and an exclusive cultural dance performance.</p>

            <div class="itinerary-box">
                <h3>Trip Itinerary</h3>
                
                <div class="day-row">
                    <div class="day-badge"><span>DAY</span> 01</div>
                    <div class="day-content">
                        <h4>Arrival in Denpasar</h4>
                        <p>Welcome to Bali! Our representative will meet you at the airport and transfer you to your premium 4-star resort in Kuta. Evening at leisure.</p>
                    </div>
                </div>
                
                <div class="day-row">
                    <div class="day-badge"><span>DAY</span> 02</div>
                    <div class="day-content">
                        <h4>Ubud Cultural Tour</h4>
                        <p>Visit the famous Tegalalang Rice Terraces, the Sacred Monkey Forest, and the royal palace. Includes a traditional Balinese lunch.</p>
                    </div>
                </div>

                <div class="day-row">
                    <div class="day-badge"><span>DAY</span> 03</div>
                    <div class="day-content">
                        <h4>Island Hopping & Water Sports</h4>
                        <p>A full-day speedboat excursion to Nusa Penida. Enjoy snorkeling, pristine beaches, and stunning cliffside views.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="sidebar">
            <div class="booking-card">
                <span style="font-size: 14px; color: #5a6e85; font-weight: 600; text-transform: uppercase;">Total Price</span>
                <div class="price">₹45,000</div>
                <span class="price-sub">per person (Taxes Included)</span>

                <ul class="included-list">
                    <li><i class="fas fa-check-circle"></i> Round-trip Flights Included</li>
                    <li><i class="fas fa-check-circle"></i> 5 Nights 4-Star Accommodation</li>
                    <li><i class="fas fa-check-circle"></i> Daily Breakfast & Dinners</li>
                    <li><i class="fas fa-check-circle"></i> Airport Pick-up & Drop</li>
                </ul>

                <a href="#" class="btn-book" onclick="alert('In a full app, this would route to checkout.jsp with the selected Package ID.')">Confirm Booking</a>
                
                <div style="text-align: center; margin-top: 15px; font-size: 13px; color: #8a9bb0;">
                    <i class="fas fa-shield-alt"></i> Safe and Secure Payment
                </div>
            </div>
        </div>
    </div>

</body>
</html>