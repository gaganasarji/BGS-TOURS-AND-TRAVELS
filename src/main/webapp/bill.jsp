<%@page import="com.tours.dto.Users"%>
<%@page import="com.tours.dto.Bookings"%>
<%@page import="com.tours.dto.Payment"%>
<%@page import="com.tours.dto.Packages"%>
<%@page import="com.tours.daoImpl.PackagesDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Invoice | BGS Tours</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background: #e2e8f0; display: flex; justify-content: center; padding: 40px; }
        .invoice-card { background: white; width: 100%; max-width: 700px; border-radius: 16px; box-shadow: 0 10px 30px rgba(0,0,0,0.1); overflow: hidden; }
        .header { background: #1a2c3e; color: white; padding: 30px; text-align: center; }
        .header h1 { margin: 0; font-size: 24px; color: #27ae60; }
        .content { padding: 40px; }
        .row { display: flex; justify-content: space-between; margin-bottom: 20px; border-bottom: 1px solid #f1f5f9; padding-bottom: 15px; }
        .label { color: #64748b; font-size: 13px; text-transform: uppercase; font-weight: 600; margin-bottom: 5px; }
        .value { color: #1a2c3e; font-size: 16px; font-weight: 500; }
        .total-box { background: #f8f9fa; padding: 20px; border-radius: 8px; margin-top: 30px; text-align: right; }
        .total-amount { font-size: 28px; font-weight: 700; color: #27ae60; }
        .btn-print { display: block; width: 100%; text-align: center; padding: 15px; background: #e2e8f0; color: #1a2c3e; text-decoration: none; font-weight: 600; }
        .btn-print:hover { background: #cbd5e1; }
    </style>
</head>
<body>
    <% 
        Users user = (Users)session.getAttribute("user");
        Bookings b = (Bookings)request.getAttribute("booking");
        Payment p = (Payment)request.getAttribute("payment");
        
        PackagesDAOImpl pdao = new PackagesDAOImpl();
        Packages pack = (b != null) ? pdao.findById(b.getPackageId()) : null;
    %>
    <div class="invoice-card">
        <div class="header">
            <h1>BGS Tours and Travels</h1>
            <p>Official Payment Receipt</p>
        </div>
        <div class="content">
            <% if(request.getAttribute("success") != null) { %>
                <div style="background: #dcfce3; color: #15803d; padding: 15px; text-align: center; border-radius: 8px; margin-bottom: 30px; font-weight: 600;">
                    <%=request.getAttribute("success")%>
                </div>
            <% } %>

            <div class="row">
                <div>
                    <div class="label">Billed To</div>
                    <div class="value"><%= (user != null) ? user.getUserName() : "Guest" %></div>
                </div>
                <div style="text-align: right;">
                    <div class="label">Booking ID</div>
                    <div class="value">#BGS-<%= (b != null) ? b.getBookingId() : "N/A" %></div>
                </div>
            </div>

            <div class="row">
                <div>
                    <div class="label">Package Details</div>
                    <div class="value"><%= (pack != null) ? pack.getPackageName() : "Package Info Unavailable" %></div>
                    <div style="font-size: 13px; color: #64748b; margin-top: 5px;">Travel Date: <%= (b != null) ? b.getTravelDate() : "N/A" %></div>
                </div>
            </div>

            <% if(p != null) { %>
            <div class="row">
                <div>
                    <div class="label">Payment Method</div>
                    <div class="value"><%=p.getMethod()%></div>
                </div>
                <div style="text-align: right;">
                    <div class="label">Transaction Date</div>
                    <div class="value"><%=p.getPaymentDate()%></div>
                </div>
            </div>

            <div class="total-box">
                <div class="label">Total Amount Paid</div>
                <div class="total-amount">₹<%=p.getAmount()%></div>
            </div>
            <% } else { %>
                <div style="text-align: center; padding: 30px; color: #e74c3c; font-weight: 600;">Payment Record Not Found</div>
            <% } %>
        </div>
        <a href="#" class="btn-print" onclick="window.print(); return false;">Print Receipt</a>
        <a href="myBookings.jsp" class="btn-print" style="background: #1a2c3e; color: white;">Return to Dashboard</a>
    </div>
</body>
</html>