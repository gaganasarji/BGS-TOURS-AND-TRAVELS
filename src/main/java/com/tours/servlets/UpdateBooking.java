package com.tours.servlets;

import java.io.IOException;

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

@WebServlet("/updateBooking")
public class UpdateBooking extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		BookingDAO bdao=new BookingsDAOImpl();
		Users admin=(Users)session.getAttribute("user");
		if(admin!=null) {
			Integer bookingId=Integer.parseInt(req.getParameter("bookingId"));
			Bookings b=bdao.findById(bookingId);
			if(b!=null) {
				b.setBookingStatus(req.getParameter("status"));
				bdao.updateBooking(b);
				if(b.getBookingStatus().equalsIgnoreCase("COMPLETED")) {
					
					req.setAttribute("Success", "Booking completed");
					bdao.updateBooking(b);
				}
				resp.sendRedirect("booking.jsp");
			}
			else {
				req.setAttribute("error", "Booking not found!");
				req.getRequestDispatcher("admin.jsp").forward(req, resp);
			}
		}
	}
}
