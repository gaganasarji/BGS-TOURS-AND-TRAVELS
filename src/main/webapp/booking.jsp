<%@page import="com.tours.dto.Users"%>
<%@page import="com.tours.dto.Bookings"%>
<%@page import="com.tours.daoImpl.BookingsDAOImpl"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Bookings | BGS Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background: #f1f5f9; padding: 40px; }
        .container { background: white; padding: 30px; border-radius: 12px; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 15px; border-bottom: 1px solid #e2e8f0; text-align: left; }
        th { background: #f8f9fa; }
        select { padding: 8px; border-radius: 6px; border: 1px solid #cbd5e1; }
        .btn-update { padding: 8px 16px; background: #1a2c3e; color: white; border: none; border-radius: 6px; cursor: pointer; }
    </style>
</head>
<body>
    <% 
        Users admin = (Users)session.getAttribute("user");
        if(admin == null || admin.getUserId() != 1) { response.sendRedirect("sign.jsp"); return; }
    %>
    <div class="container">
        <h2><a href="admin.jsp" style="text-decoration: none; color: #27ae60; margin-right: 15px;">&larr;</a> Manage All Bookings</h2>
        <table>
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>User ID</th>
                    <th>Package ID</th>
                    <th>Travel Date</th>
                    <th>Current Status</th>
                    <th>Update Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    BookingsDAOImpl bdao = new BookingsDAOImpl();
                    List<Bookings> allBookings = bdao.findAll();
                    for(Bookings b : allBookings) {
                %>
                <tr>
                    <td>#BGS-<%=b.getBookingId()%></td>
                    <td><%=b.getUserId()%></td>
                    <td><%=b.getPackageId()%></td>
                    <td><%=b.getTravelDate()%></td>
                    <td><strong><%=b.getBookingStatus()%></strong></td>
                    <td>
                        <form action="updateBooking" method="POST" style="display: flex; gap: 10px;">
                            <input type="hidden" name="bookingId" value="<%=b.getBookingId()%>">
                            <select name="status">
                                <option value="PENDING" <%=b.getBookingStatus().equals("PENDING")?"selected":""%>>Pending</option>
                                <option value="COMPLETED" <%=b.getBookingStatus().equals("COMPLETED")?"selected":""%>>Completed</option>
                                <option value="CANCELLED" <%=b.getBookingStatus().equals("CANCELLED")?"selected":""%>>Cancelled</option>
                            </select>
                            <button type="submit" class="btn-update">Update</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>