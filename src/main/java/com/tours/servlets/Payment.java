package com.tours.servlets;

import java.io.IOException;
import java.time.LocalDateTime;

import com.tours.dao.BookingDAO;
import com.tours.daoImpl.BookingsDAOImpl;
import com.tours.dto.Bookings;
import com.tours.dto.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/payment")
public class Payment extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PaymentDAO pdao=new PaymentDAOImpl();
		BookingDAO bdao=new BookingsDAOImpl();
		
		HttpSession session=req.getSession();
		Users user=(Users)session.getAttribute("user");
		
		Integer bookingId=Integer.parseInt(req.getParameter("bookingId"));
		
		System.out.println(bookingId);
		Bookings b=bdao.findById(bookingId);
		if(user!=null) {

			Payment p=pdao.getPaymentByBookingId(bookingId);
			if(p==null) {
				p=new Payment();
				p.setBookingId(bookingId);
				p.setMethod(req.getParameter("method"));
				p.setAmount(Double.parseDouble(req.getParameter("finalPrice")));
				p.setPaymentDate(LocalDateTime.now().toString());
				pdao.addPayment(p);
			}
			forwardToBill(req, resp, bookingId);
			//req.getRequestDispatcher("bill.jsp").forward(req, resp);
		}
		else {
			req.setAttribute("loginError", "Session expired!");
			req.getRequestDispatcher("sign.jsp").forward(req, resp);
		}

	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer bookingId=Integer.parseInt(req.getParameter("bookingId"));
		forwardToBill(req, resp, bookingId);
	}
	
	private void forwardToBill(HttpServletRequest req, HttpServletResponse resp, Integer bookingId) 
	        throws ServletException, IOException {
	    PaymentDAO pdao = new PaymentDAOImpl();
	    BookingDAO bdao = new BookingsDAOImpl();
	   

	    Bookings b = bdao.findById(bookingId);
	    System.out.println("booking Id"+bookingId);
	    Payment p = pdao.getPaymentByBookingId(bookingId);

	    
	    req.setAttribute("booking", b);
	    req.setAttribute("payment", p);
	    req.setAttribute("success", "Payment succesful!");
	    req.getRequestDispatcher("bill.jsp").forward(req, resp);
	}

	
}
