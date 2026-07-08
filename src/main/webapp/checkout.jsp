<%@page import="com.tours.dto.Users"%>
<%@page import="com.tours.dto.Packages"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout - Sapphire Tours</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { font-family: 'Inter', sans-serif; background: #f8fafc; margin: 0; padding: 40px 20px; }
        .checkout-container { max-width: 1000px; margin: 0 auto; display: flex; gap: 30px; }
        
        .form-section { flex: 1.5; background: white; border-radius: 20px; padding: 30px; box-shadow: 0 4px 15px rgba(0,0,0,0.03); }
        .summary-section { flex: 1; }
        
        h2 { color: #1a2c3e; margin-top: 0; font-size: 24px; border-bottom: 1px solid #eef2f8; padding-bottom: 15px; }
        
        .form-group { margin-bottom: 20px; }
        .form-group label { display: block; font-size: 13px; font-weight: 600; color: #4a627a; margin-bottom: 8px; }
        .form-group input, .form-group select, .form-group date { width: 100%; padding: 12px; border: 1px solid #cbd5e1; border-radius: 10px; font-family: 'Inter', sans-serif; box-sizing: border-box; }
        .form-group input:focus { outline: none; border-color: #115eb6; }
        
        .summary-card { background: linear-gradient(135deg, #115eb6 0%, #0a4a8c 100%); color: white; border-radius: 20px; padding: 30px; box-shadow: 0 10px 30px rgba(17,94,182,0.2); }
        .summary-card h3 { margin-top: 0; font-size: 20px; border-bottom: 1px solid rgba(255,255,255,0.2); padding-bottom: 15px; }
        
        .price-row { display: flex; justify-content: space-between; font-size: 14px; margin-bottom: 15px; color: rgba(255,255,255,0.9); }
        .price-total { font-size: 24px; font-weight: 700; color: white; border-top: 1px solid rgba(255,255,255,0.2); padding-top: 15px; margin-top: 10px; }
        
        .btn-confirm { width: 100%; padding: 15px; background: white; color: #115eb6; border: none; border-radius: 40px; font-size: 16px; font-weight: 700; cursor: pointer; margin-top: 25px; transition: 0.3s; }
        .btn-confirm:hover { background: #f0f4fa; transform: translateY(-2px); }
    </style>
</head>
<body>
    <% 
        // Validate user session (Users.java)
        Users user = (Users)session.getAttribute("user");
        if(user == null) {
            response.sendRedirect("sign.jsp");
            return;
        }
    %>

    <div class="checkout-container">
        <form action="checkout" method="Post" class="form-section">
            <h2>Traveler Details</h2>
            
            <div class="form-group">
                <label>Primary Traveler Name</label>
                <input type="text" name="travelerName" value="<%=user.getUserName()%>" required>
            </div>
            
            <div class="form-group">
                <label>Contact Email</label>
                <input type="email" name="contactEmail" value="<%=user.getUserEmail()%>" readonly>
            </div>

            <div style="display: flex; gap: 15px;">
                <div class="form-group" style="flex: 1;">
                    <label>Travel Date</label>
                    <input type="date" name="travelDate" required>
                </div>
                <div class="form-group" style="flex: 1;">
                    <label>Number of Travelers</label>
                    <input type="number" name="travelerCount" min="1" value="2" required id="travelerCount">
                </div>
            </div>

            <h2 style="margin-top: 20px;">Payment Method</h2>
            <div class="form-group">
                <select name="paymentType">
                    <option value="CREDIT_CARD">Credit/Debit Card</option>
                    <option value="UPI">UPI</option>
                    <option value="NET_BANKING">Net Banking</option>
                </select>
            </div>
        </form>

        <div class="summary-section">
            <div class="summary-card">
                <h3>Booking Summary</h3>
                <p style="font-weight: 600; margin-bottom: 25px; font-size: 18px;">Tropical Paradise Getaway</p>
                
                <div class="price-row">
                    <span>Base Price (Per Person)</span>
                    <span>₹45,000</span>
                </div>
                <div class="price-row">
                    <span>Taxes & Fees (18% GST)</span>
                    <span>₹8,100</span>
                </div>
                
                <div class="price-row price-total">
                    <span>Total Payable</span>
                    <span id="displayTotal">₹1,06,200</span> </div>
                
                <button type="submit" class="btn-confirm" onclick="document.querySelector('form').submit()">Confirm Booking</button>
                <p style="text-align: center; font-size: 12px; margin-top: 15px; opacity: 0.8;"><i class="fas fa-lock"></i> Secure 256-bit SSL Encryption</p>
            </div>
        </div>
    </div>
</body>
</html>