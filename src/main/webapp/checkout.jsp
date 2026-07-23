<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tours.dto.Users"%>
<%@ page import="com.tours.dto.Packages"%>
<%@ page import="com.tours.daoImpl.PackagesDAOImpl"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Checkout - BGS Tours</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        body{
            font-family:'Inter',sans-serif;
            background:#f8fafc;
            margin:0;
            padding:40px 20px;
        }

        .checkout-container{
            max-width:1000px;
            margin:auto;
            display:flex;
            gap:30px;
        }

        .form-section{
            flex:1.5;
            background:#fff;
            padding:30px;
            border-radius:20px;
            box-shadow:0 4px 15px rgba(0,0,0,.05);
        }

        .summary-section{
            flex:1;
        }

        .summary-card{
            background:#1a2c3e;
            color:white;
            padding:30px;
            border-radius:20px;
        }

        .form-group{
            margin-bottom:20px;
        }

        .form-group label{
            display:block;
            margin-bottom:8px;
            font-weight:bold;
        }

        .form-group input{
            width:100%;
            padding:10px;
            border-radius:8px;
            border:1px solid #ccc;
        }

        .price-row{
            display:flex;
            justify-content:space-between;
            margin:10px 0;
        }

        .price-total{
            font-size:22px;
            font-weight:bold;
            margin-top:15px;
            border-top:1px solid rgba(255,255,255,.2);
            padding-top:10px;
        }

        .btn-confirm{
            width:100%;
            padding:15px;
            background:#27ae60;
            color:white;
            border:none;
            border-radius:30px;
            font-size:16px;
            cursor:pointer;
        }
    </style>
</head>

<body>

<%
    // Logged in user
    Users user = (Users) session.getAttribute("user");

    if(user == null){
        response.sendRedirect("sign.jsp");
        return;
    }

    String pkgIdStr = request.getParameter("packageId");

    if(pkgIdStr == null){
        out.println("<h2>Package not found.</h2>");
        return;
    }

    PackagesDAOImpl pdao = new PackagesDAOImpl();

    Packages selectedPackage = pdao.findById(Integer.parseInt(pkgIdStr));

    if(selectedPackage == null){
        out.println("<h2>Invalid Package.</h2>");
        return;
    }

    double price = selectedPackage.getPrice();
    double tax = price * 0.18;
    double total = price + tax;
%>

<div class="checkout-container">

    <form action="bookPackages" method="post" class="form-section">

        <h2>Traveler Details</h2>

        <div class="form-group">
            <label>Name</label>
            <input type="text"
                   value="<%=user.getUserName()%>"
                   readonly>
        </div>

        <div class="form-group">
            <label>Travel Date</label>
            <input type="date"
                   name="travelDate"
                   required
                   min="<%=java.time.LocalDate.now()%>">
        </div>

        <input type="hidden"
               name="packageId"
               value="<%=selectedPackage.getPackageId()%>">

        <input type="hidden"
               name="finalPrice"
               value="<%=total%>">

        <button class="btn-confirm">
            Confirm & Proceed to Payment
        </button>

    </form>

    <div class="summary-section">

        <div class="summary-card">

            <h2>Booking Summary</h2>

            <p>
                <strong><%=selectedPackage.getPackageName()%></strong>
            </p>

            <p>
                Duration :
                <%=selectedPackage.getDuration()%>
            </p>

            <div class="price-row">
                <span>Package Price</span>
                <span>₹ <%=price%></span>
            </div>

            <div class="price-row">
                <span>GST (18%)</span>
                <span>₹ <%=tax%></span>
            </div>

            <div class="price-row price-total">
                <span>Total</span>
                <span>₹ <%=total%></span>
            </div>

        </div>

    </div>

</div>

</body>
</html>