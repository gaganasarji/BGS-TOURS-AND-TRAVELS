<%@page import="com.tours.dto.Users"%>
<%@page import="com.tours.daoImpl.BookingsDAOImpl"%>
<%@page import="com.tours.daoImpl.PackagesDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard | BGS Tours</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background: #f1f5f9; margin: 0; display: flex; }
        .sidebar { width: 250px; background: #1a2c3e; color: white; min-height: 100vh; padding: 20px; }
        .sidebar h2 { color: #27ae60; margin-bottom: 30px; }
        .nav-link { display: block; color: #cbd5e1; text-decoration: none; padding: 12px; margin-bottom: 10px; border-radius: 8px; }
        .nav-link:hover, .nav-link.active { background: #27ae60; color: white; }
        .main-content { flex: 1; padding: 40px; }
        .stats-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; }
        .stat-card { background: white; padding: 25px; border-radius: 12px; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .stat-card h3 { color: #64748b; font-size: 14px; margin-bottom: 10px; }
        .stat-card .value { font-size: 32px; font-weight: 700; color: #1a2c3e; }
    </style>
</head>
<body>
    <% 
        Users admin = (Users)session.getAttribute("user");
        if(admin == null || admin.getUserId() != 1) {
            response.sendRedirect("sign.jsp");
            return;
        }
        BookingsDAOImpl bdao = new BookingsDAOImpl();
        PackagesDAOImpl pdao = new PackagesDAOImpl();
    %>
    <div class="sidebar">
        <h2>BGS Admin</h2>
        <a href="admin.jsp" class="nav-link active">Dashboard</a>
        <a href="booking.jsp" class="nav-link">Manage Bookings</a>
        <a href="logout" class="nav-link" style="margin-top: 50px; background: #e74c3c;">Logout</a>
    </div>
    
    <div class="main-content">
        <h1 style="margin-bottom: 30px; color: #1a2c3e;">Overview</h1>
        <div class="stats-grid">
            <div class="stat-card">
                <h3>Total Bookings</h3>
                <div class="value"><%=bdao.findAll().size()%></div>
            </div>
            <div class="stat-card">
                <h3>Active Packages</h3>
                <div class="value"><%=pdao.findAll().size()%></div>
            </div>
        </div>
    </div>
</body>
</html>