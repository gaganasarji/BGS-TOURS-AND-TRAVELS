<%@page import="com.tours.dto.Users"%>
<%@page import="com.tours.dto.Bookings"%>
<%@page import="com.tours.dto.Packages"%>
<%@page import="com.tours.dto.Payment"%>
<%@page import="com.tours.dto.Destinations"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
Users user=(Users)session.getAttribute("user");
Bookings booking=(Bookings)request.getAttribute("booking");
Packages pack=(Packages)request.getAttribute("tourPackage");
Payment payment=(Payment)request.getAttribute("payment");
Destinations destination=(Destinations)request.getAttribute("destination");

double amount=payment.getAmount();
double gst=amount*0.05;
double total=amount+gst;
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>BGS Tours & Travels Invoice</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Inter',sans-serif;
}

body{
background:#eef5ff;
padding:40px;
}

.invoice{
max-width:1000px;
margin:auto;
background:#fff;
border-radius:20px;
overflow:hidden;
box-shadow:0 10px 30px rgba(0,0,0,.15);
}

.header{
background:#0d6efd;
color:white;
padding:35px;
display:flex;
justify-content:space-between;
align-items:center;
flex-wrap:wrap;
}

.company h1{
font-size:34px;
font-weight:800;
}

.company p{
margin-top:8px;
font-size:14px;
}

.invoiceTitle{
text-align:right;
}

.invoiceTitle h2{
font-size:30px;
}

.invoiceNo{
margin-top:10px;
padding:8px 15px;
background:rgba(255,255,255,.2);
display:inline-block;
border-radius:25px;
}

.content{
padding:35px;
}

.row{
display:flex;
justify-content:space-between;
gap:30px;
margin-bottom:30px;
flex-wrap:wrap;
}

.col{
flex:1;
min-width:280px;
}

.col h3{
color:#0d6efd;
margin-bottom:15px;
}

.col p{
margin:8px 0;
color:#444;
}

.packageCard{
display:flex;
justify-content:space-between;
align-items:flex-start;
background:#f5f9ff;
padding:25px;
border-radius:15px;
margin-bottom:30px;
}

.packageName{
font-size:24px;
font-weight:bold;
color:#0d6efd;
}

.packagePrice{
font-size:30px;
font-weight:bold;
color:#198754;
}

table{
width:100%;
border-collapse:collapse;
margin-top:20px;
}

td{
padding:15px;
border-bottom:1px solid #ddd;
}

.total{
background:#f4f8ff;
font-weight:bold;
}

.success{
margin-top:35px;
background:#eafaf1;
padding:20px;
border-radius:15px;
}

.footer{
margin-top:40px;
padding:30px;
background:#f7f9fc;
text-align:center;
}

.btns{
display:flex;
justify-content:flex-end;
gap:15px;
margin-top:35px;
}

.btn{
padding:12px 25px;
border:none;
border-radius:25px;
cursor:pointer;
text-decoration:none;
font-weight:bold;
}

.home{
background:#e9ecef;
color:#000;
}

.print{
background:#0d6efd;
color:#fff;
}

</style>

</head>

<body>

<div class="invoice">

<div class="header">

<div class="company">

<h1>BGS TOURS & TRAVELS</h1>

<p>Explore the World with Comfort & Safety</p>

<p>Bangalore, Karnataka</p>

</div>

<div class="invoiceTitle">

<h2>INVOICE</h2>

<p>Booking Confirmation</p>

<div class="invoiceNo">

INV-<%=payment.getPaymentId()%>

</div>

</div>

</div>

<div class="content">
<!-- Traveller & Booking Details -->

<div class="row">

    <div class="col">

        <h3>Traveller Details</h3>

        <p>
            <strong>Name :</strong>
            <%=user.getUserName()%>
        </p>

        <p>
            <strong>Email :</strong>
            <%=user.getUserEmail()%>
        </p>

        <p>
            <strong>Phone :</strong>
            <%=user.getPhone()%>
        </p>

        <p>
            <strong>Address :</strong>
            <%=user.getAddress()%>
        </p>

    </div>

    <div class="col">

        <h3>Booking Details</h3>

        <p>
            <strong>Booking ID :</strong>
            BGS<%=booking.getBookingId()%>
        </p>

        <p>
            <strong>Booking Date :</strong>
            <%=booking.getBookingDate()%>
        </p>

        <p>
            <strong>Travel Date :</strong>
            <%=booking.getTravelDate()%>
        </p>

        <p>
            <strong>Status :</strong>

            <span style="color:green;font-weight:bold;">
                <%=booking.getBookingStatus()%>
            </span>

        </p>

    </div>

</div>
<!-- Package Details -->

<div class="packageCard">

    <div>

        <div class="packageName">
            <%=pack.getPackageName()%>
        </div>

        <br>

        <p>
            <strong>Destination :</strong>
            <%=destination.getCity()%>
        </p>

        <p>
            <strong>Duration :</strong>
            <%=pack.getDuration()%>
        </p>

        <p>
            <strong>Package Price :</strong>
            ₹<%=String.format("%.2f", pack.getPrice())%>
        </p>

        <br>

        <p>
            <strong>Destination Description :</strong>
        </p>

        <p style="margin-top:8px;line-height:24px;color:#555;">
            <%=destination.getDestDescription()%>
        </p>

        <br>

        <p>
            <strong>Package Description :</strong>
        </p>

        <p style="margin-top:8px;line-height:24px;color:#555;">
            <%=pack.getDescription()%>
        </p>

    </div>

    <div class="packagePrice">

        ₹<%=String.format("%.2f", payment.getAmount())%>

    </div>

</div>
<!-- Price Summary -->

<h3 style="color:#0d6efd;margin-bottom:15px;">
Price Summary
</h3>

<table>

    <tr>
        <td><strong>Package Price</strong></td>
        <td align="right">
            ₹<%=String.format("%.2f", amount)%>
        </td>
    </tr>

    <tr>
        <td><strong>GST (5%)</strong></td>
        <td align="right">
            ₹<%=String.format("%.2f", gst)%>
        </td>
    </tr>

    <tr class="total">

        <td style="font-size:18px;">
            <strong>Total Amount</strong>
        </td>

        <td align="right"
            style="font-size:22px;
            color:#0d6efd;">

            ₹<%=String.format("%.2f", total)%>

        </td>

    </tr>

</table>

<!-- Booking Summary -->

<div style="margin-top:35px;
background:#f8f9fa;
padding:20px;
border-radius:12px;">

<h3 style="color:#0d6efd;margin-bottom:15px;">
Booking Summary
</h3>

<p style="margin:8px 0;">
<strong>Booking ID :</strong>
BGS<%=booking.getBookingId()%>
</p>

<p style="margin:8px 0;">
<strong>Package :</strong>
<%=pack.getPackageName()%>
</p>

<p style="margin:8px 0;">
<strong>Destination :</strong>
<%=destination.getCity()%>
</p>

<p style="margin:8px 0;">
<strong>Travel Date :</strong>
<%=booking.getTravelDate()%>
</p>

<p style="margin:8px 0;">
<strong>Total Paid :</strong>

<span style="color:#198754;
font-weight:bold;
font-size:18px;">

₹<%=String.format("%.2f", total)%>

</span>

</p>

</div>
<!-- Payment Status -->

<div class="success">

    <h3 style="color:#198754;margin-bottom:15px;">
        ✓ Payment Successful
    </h3>

    <p style="margin:8px 0;">
        <strong>Transaction ID :</strong>
        TXN_<%=payment.getPaymentId()%>
    </p>

    <p style="margin:8px 0;">
        <strong>Payment ID :</strong>
        <%=payment.getPaymentId()%>
    </p>

    <p style="margin:8px 0;">
        <strong>Payment Method :</strong>
        <%=payment.getMethod()%>
    </p>

    <p style="margin:8px 0;">
        <strong>Amount Paid :</strong>

        <span style="color:#198754;font-weight:bold;">
            ₹<%=String.format("%.2f", payment.getAmount())%>
        </span>

    </p>

    <p style="margin:8px 0;">
        <strong>Payment Date :</strong>
        <%=payment.getPaymentDate()%>
    </p>

</div>

<!-- Terms & Conditions -->

<div style="margin-top:40px;">

    <h3 style="color:#0d6efd;margin-bottom:15px;">
        Terms & Conditions
    </h3>

    <ul style="margin-left:20px;line-height:30px;color:#555;">

        <li>Please carry a valid Government ID proof during the journey.</li>

        <li>Passengers should report at the boarding point at least 30 minutes before departure.</li>

        <li>The booking confirmation must be produced during the trip if requested.</li>

        <li>Cancellation and refund are subject to the company's cancellation policy.</li>

        <li>BGS Tours & Travels is not responsible for delays due to weather, traffic, or unforeseen circumstances.</li>

        <li>Package inclusions and exclusions are as mentioned at the time of booking.</li>

    </ul>

</div>
<!-- Action Buttons -->

<div class="btns">

    <a href="packages.jsp" class="btn home">
        🏠 Home
    </a>

    <button class="btn print" onclick="window.print()">
        🖨 Print Invoice
    </button>

</div>

<!-- Thank You Section -->

<div class="footer">

    <h2 style="color:#0d6efd;">
        Thank You!
    </h2>

    <p style="margin-top:15px;color:#555;">
        Thank you for choosing
        <strong>BGS Tours & Travels</strong>.
    </p>

    <p style="margin-top:10px;color:#666;">
        We wish you a safe, comfortable and memorable journey.
    </p>

    <br>

    <hr>

    <br>

    <p style="font-size:14px;color:#777;">
        <strong>BGS Tours & Travels</strong><br>
        Bangalore, Karnataka<br>
        📞 +91 XXXXX XXXXX<br>
        ✉ support@bgstours.com
    </p>

</div>

</div> <!-- content -->

</div> <!-- invoice -->

</body>

</html>