<%@page import="com.tours.dto.Users"%>
<%@page import="com.tours.dto.Bookings"%>
<%@page import="com.tours.dto.Packages"%>
<%@page import="com.tours.dao.BookingDAO"%>
<%@page import="com.tours.daoImpl.BookingsDAOImpl"%>
<%@page import="com.tours.dao.PackagesDAO"%>
<%@page import="com.tours.daoImpl.PackagesDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="java.util.stream.Collectors"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>My Bookings | BGS Tours</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background: #f8f9fa; padding: 40px; color: #1a2c3e; }
        .container { max-width: 1000px; margin: 0 auto; background: white; border-radius: 16px; padding: 30px; box-shadow: 0 4px 15px rgba(0,0,0,0.05); }
        .header { display: flex; justify-content: space-between; align-items: center; border-bottom: 2px solid #e2e8f0; padding-bottom: 20px; margin-bottom: 30px; }
        .btn-outline { padding: 8px 16px; border: 2px solid #e74c3c; color: #e74c3c; border-radius: 8px; text-decoration: none; font-weight: 600; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 15px; text-align: left; border-bottom: 1px solid #e2e8f0; }
        th { background: #f1f5f9; color: #4a5568; }
        .status { padding: 6px 12px; border-radius: 20px; font-size: 12px; font-weight: 600; }
        .status.completed { background: #dcfce3; color: #15803d; }
        .status.pending { background: #fef9c3; color: #a16207; }
        .btn-pay { padding: 8px 16px; background: #27ae60; color: white; text-decoration: none; border-radius: 8px; font-size: 13px; border: none; cursor: pointer; }
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
    <div class="container">
        <div class="header">
            <h2>Welcome, <%=user.getUserName()%></h2>
            <div>
                <a href="index.jsp" style="margin-right: 15px; text-decoration: none; color: #27ae60; font-weight: 600;">Home</a>
                <a href="logout" class="btn-outline">Logout</a>
            </div>
        </div>

        <h3>Your Travel History</h3>
        <table>
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Package</th>
                    <th>Travel Date</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    BookingDAO bdao = new BookingsDAOImpl();
                    PackagesDAO pdao = new PackagesDAOImpl();
                    
                    // Filter bookings for this user
                    List<Bookings> userBookings = bdao.findAll().stream()
                        .filter(b -> b.getUserId().equals(user.getUserId()))
                        .collect(Collectors.toList());

                    for(Bookings b : userBookings) {
                        Packages pack = pdao.findById(b.getPackageId());
                %>
                <tr>
                    <td>#BGS-<%=b.getBookingId()%></td>
                    <td><%= (pack != null) ? pack.getPackageName() : "Package Unavailable" %></td>
                    <td><%=b.getTravelDate()%></td>
                    <td>
                        <span class="status <%=b.getBookingStatus().toLowerCase()%>"><%=b.getBookingStatus()%></span>
                    </td>
                    <td>
                        <form action="payment" method="GET">
                            <input type="hidden" name="bookingId" value="<%=b.getBookingId()%>">
                            <button type="submit" class="btn-pay">View / Pay</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>