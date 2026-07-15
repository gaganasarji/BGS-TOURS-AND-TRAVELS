<%@page import="com.tours.dto.Users"%>
<%@page import="com.tours.dto.Packages"%>
<%@page import="com.tours.daoImpl.PackagesDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Checkout - BGS Tours</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background: #f8fafc; margin: 0; padding: 40px 20px; }
        .checkout-container { max-width: 1000px; margin: 0 auto; display: flex; gap: 30px; }
        .form-section { flex: 1.5; background: white; border-radius: 20px; padding: 30px; box-shadow: 0 4px 15px rgba(0,0,0,0.03); }
        .summary-section { flex: 1; }
        h2 { color: #1a2c3e; margin-top: 0; border-bottom: 1px solid #eef2f8; padding-bottom: 15px; }
        .form-group { margin-bottom: 20px; }
        .form-group label { display: block; font-size: 13px; font-weight: 600; color: #4a627a; margin-bottom: 8px; }
        .form-group input { width: 100%; padding: 12px; border: 1px solid #cbd5e1; border-radius: 10px; box-sizing: border-box; }
        .summary-card { background: #1a2c3e; color: white; border-radius: 20px; padding: 30px; }
        .price-row { display: flex; justify-content: space-between; font-size: 14px; margin-bottom: 15px; }
        .price-total { font-size: 24px; font-weight: 700; border-top: 1px solid rgba(255,255,255,0.2); padding-top: 15px; margin-top: 10px; color: #27ae60; }
        .btn-confirm { width: 100%; padding: 15px; background: #27ae60; color: white; border: none; border-radius: 40px; font-size: 16px; font-weight: 700; cursor: pointer; margin-top: 25px; }
    </style>
</head>
<body>
    <% 
        // 1. Mandatory Login Check
        Users user = (Users)session.getAttribute("user");
        String pkgIdStr = request.getParameter("packageId");
        
        if(user == null) {
            // Redirect to login page if they clicked "Book" while logged out
            response.sendRedirect("sign.jsp");
            return;
        }

        // 2. Fetch Cost Data
        PackagesDAOImpl pdao = new PackagesDAOImpl();
        Packages selectedPackage = pdao.findById(Integer.parseInt(pkgIdStr));
        double price = selectedPackage.getPrice();
        double tax = price * 0.18;
        double total = price + tax;
    %>

    <div class="checkout-container">
        <!-- Submits to Servlet to SAVE the booking -->
        <form action="bookPackages" method="POST" class="form-section">
            <h2>Traveler Details & Dates</h2>
            
            <div class="form-group">
                <label>Primary Traveler</label>
                <input type="text" value="<%=user.getUserName()%>" readonly style="background: #f1f5f9;">
            </div>

            <div class="form-group">
                <label>Select Travel Date</label>
                <input type="date" name="travelDate" required min="<%=java.time.LocalDate.now()%>">
            </div>
            
            <input type="hidden" name="packageId" value="<%=selectedPackage.getPackageId()%>">
            <input type="hidden" name="finalPrice" value="<%=total%>">
            
            <button type="submit" class="btn-confirm">Confirm & Proceed to Payment</button>
        </form>

        <div class="summary-section">
            <div class="summary-card">
                <h3 style="margin-top:0;">Booking Summary</h3>
                <p style="font-weight: 600; font-size: 18px;"><%=selectedPackage.getPackageName()%></p>
                <p style="font-size: 13px; opacity: 0.8; margin-bottom: 25px;">Duration: <%=selectedPackage.getDuration()%></p>
                
                <div class="price-row">
                    <span>Base Price</span>
                    <span>₹<%=price%></span>
                </div>
                <div class="price-row">
                    <span>Taxes & Fees (18%)</span>
                    <span>₹<%=tax%></span>
                </div>
                
                <div class="price-row price-total">
                    <span>Total Payable</span>
                    <span>₹<%=total%></span> 
                </div>
            </div>
        </div>
    </div>
</body>
</html>