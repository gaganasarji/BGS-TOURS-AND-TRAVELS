<%@page import="com.tours.dto.Users"%>
<%@page import="com.tours.dto.Bookings"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Travel Bookings</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { font-family: 'Inter', sans-serif; background: linear-gradient(135deg, #FFFFFF 0%, #FFFFF4 50%, #F5E6C2 100%); margin: 0; padding: 40px 20px; }
        .bookings-container { max-width: 1000px; margin: 0 auto; }
        .page-header { text-align: center; margin-bottom: 40px; }
        .page-header h1 { font-size: 36px; color: #1a2c3e; margin-bottom: 10px; }
        .page-header span { color: #115eb6; }
        
        .booking-card { background: white; border-radius: 20px; box-shadow: 0 4px 20px rgba(0,0,0,0.05); margin-bottom: 25px; overflow: hidden; }
        .card-header { background: #f8fafc; padding: 15px 25px; display: flex; justify-content: space-between; border-bottom: 1px solid #eef2f8; align-items: center; }
        .booking-id { font-weight: 600; color: #115eb6; font-size: 14px; }
        
        .status { padding: 5px 15px; border-radius: 30px; font-size: 12px; font-weight: 600; }
        .status.confirmed { background: #e8f5e9; color: #27ae60; }
        .status.pending { background: #fff8e1; color: #f39c12; }
        .status.cancelled { background: #ffebee; color: #e74c3c; }

        .card-body { padding: 25px; display: flex; gap: 20px; align-items: center; }
        .tour-thumbnail { width: 120px; height: 120px; border-radius: 12px; object-fit: cover; }
        .booking-details { flex: 1; }
        .tour-name { font-size: 20px; font-weight: 700; color: #1a2c3e; margin-bottom: 10px; margin-top: 0; }
        .travel-info { display: flex; gap: 20px; font-size: 14px; color: #5a6e85; margin-bottom: 10px; }
        .travel-info strong { color: #1a2c3e; }
        
        .price-box { text-align: right; background: #f8fafc; padding: 15px; border-radius: 12px; min-width: 150px; }
        .total-amount { font-size: 24px; font-weight: 700; color: #115eb6; }
        
        .card-footer { padding: 15px 25px; background: #f8fafc; border-top: 1px solid #eef2f8; display: flex; justify-content: flex-end; gap: 10px; }
        .btn-action { padding: 8px 20px; border-radius: 30px; font-size: 13px; font-weight: 600; text-decoration: none; cursor: pointer; }
        .btn-view { background: #115eb6; color: white; border: none; }
        .btn-cancel { background: transparent; color: #e74c3c; border: 1px solid #e74c3c; }
        
        @media (max-width: 768px) { .card-body { flex-direction: column; text-align: center; } .price-box { text-align: center; width: 100%; box-sizing: border-box; } .travel-info { flex-direction: column; gap: 5px; } }
    </style>
</head>
<body>

<% 
    Users user = (Users)session.getAttribute("user");
    if(user == null) {
        response.sendRedirect("sign.jsp");
        return;
    }
%>

<div class="bookings-container">
    <div class="page-header">
        <h1>My <span>Travel Itineraries</span></h1>
        <p style="color: #5a6e85;">Manage your upcoming and past adventures.</p>
    </div>

    <% 
       // BookingDAO bdao = new BookingDAOImpl();
       // List<TourBooking> bookings = bdao.getBookingsByUserId(user.getId());
       for(int i=1; i<=2; i++) { 
           String status = (i == 1) ? "CONFIRMED" : "PENDING";
           String statusClass = status.toLowerCase();
    %>
    <div class="booking-card">
        <div class="card-header">
            <span class="booking-id">Order ID: #TRV-880<%=i%></span>
            <span class="status <%=statusClass%>"><%=status%></span>
        </div>
        
        <div class="card-body">
            <img src="https://images.pexels.com/photos/3225531/pexels-photo-3225531.jpeg" class="tour-thumbnail" alt="Tour">
            <div class="booking-details">
                <h3 class="tour-name">Bali Tropical Escape</h3>
                <div class="travel-info">
                    <div><i class="fas fa-calendar-alt"></i> <strong>Travel Date:</strong> 15 Oct 2026</div>
                    <div><i class="fas fa-users"></i> <strong>Travelers:</strong> 2 Adults</div>
                </div>
                <div class="travel-info">
                    <div><i class="fas fa-plane-departure"></i> <strong>Departure:</strong> New Delhi (DEL)</div>
                </div>
            </div>
            <div class="price-box">
                <div style="font-size: 12px; color: #5a6e85;">Total Paid</div>
                <div class="total-amount">₹90,000</div>
            </div>
        </div>

        <div class="card-footer">
            <a href="itinerary.jsp?orderId=<%=i%>" class="btn-action btn-view"><i class="fas fa-file-download"></i> Download Tickets</a>
            <% if(status.equals("PENDING") || status.equals("CONFIRMED")) { %>
                <a href="cancelTour.jsp?orderId=<%=i%>" class="btn-action btn-cancel">Cancel Trip</a>
            <% } %>
        </div>
    </div>
    <% } %>

</div>
</body>
</html>