package com.tours.servlets;

import java.io.IOException;
import java.time.LocalDate;

import com.tours.daoImpl.BookingsDAOImpl;
import com.tours.daoImpl.DestinationsDAOImpl;
import com.tours.daoImpl.PackagesDAOImpl;
import com.tours.daoImpl.PaymentDAOImpl;
import com.tours.dto.Bookings;
import com.tours.dto.Destinations;
import com.tours.dto.Packages;
import com.tours.dto.Payment;
import com.tours.dto.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {

	    HttpSession session = req.getSession();
	    Users user = (Users) session.getAttribute("user");

	    if (user == null) {
	        req.setAttribute("loginError", "Session Expired");
	        req.getRequestDispatcher("sign.jsp").forward(req, resp);
	        return;
	    }

	    int bookingId = Integer.parseInt(req.getParameter("bookingId"));

	    BookingsDAOImpl bdao = new BookingsDAOImpl();
	    PackagesDAOImpl pdao = new PackagesDAOImpl();
	    PaymentDAOImpl paydao = new PaymentDAOImpl();
	    DestinationsDAOImpl ddao = new DestinationsDAOImpl();

	    Bookings booking = bdao.findById(bookingId);

	    if (booking == null) {
	        resp.sendRedirect("myBookings.jsp");
	        return;
	    }

	    Payment payment = paydao.getPaymentByBookingId(bookingId);

	    if (payment == null) {

	        payment = new Payment();
	        payment.setBookingId(bookingId);
	        payment.setAmount(Double.parseDouble(req.getParameter("amount")));
	        payment.setMethod(req.getParameter("method"));
	        payment.setPaymentDate(LocalDate.now().toString());

	        paydao.addPayment(payment);

	        booking.setBookingStatus("CONFIRMED");
	        bdao.updateBooking(booking);

	        payment = paydao.getPaymentByBookingId(bookingId);
	    }

	    Packages pack = pdao.findById(booking.getPackageId());

	    Destinations destination = ddao.findById(pack.getDestId());

	    req.setAttribute("booking", booking);
	    req.setAttribute("tourPackage", pack);
	    req.setAttribute("payment", payment);
	    req.setAttribute("destination", destination);
	    req.setAttribute("success", "Payment Successful");

	    req.getRequestDispatcher("bill.jsp").forward(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {

	    int bookingId = Integer.parseInt(req.getParameter("bookingId"));

	    BookingsDAOImpl bdao = new BookingsDAOImpl();
	    PackagesDAOImpl pdao = new PackagesDAOImpl();
	    PaymentDAOImpl paydao = new PaymentDAOImpl();
	    DestinationsDAOImpl ddao = new DestinationsDAOImpl();

	    Bookings booking = bdao.findById(bookingId);

	    if (booking == null) {
	        resp.sendRedirect("myBookings.jsp");
	        return;
	    }

	    Packages pack = pdao.findById(booking.getPackageId());
	    Payment payment = paydao.getPaymentByBookingId(bookingId);
	    Destinations destination = ddao.findById(pack.getDestId());

	    req.setAttribute("booking", booking);
	    req.setAttribute("tourPackage", pack);
	    req.setAttribute("payment", payment);
	    req.setAttribute("destination", destination);

	    req.getRequestDispatcher("bill.jsp").forward(req, resp);
	}
}