package com.tours.servlets;

import java.io.IOException;
import java.time.LocalDate;

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

@WebServlet("/bookPackages")
public class BookPackages extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BookingDAO bdao = new BookingsDAOImpl();
		HttpSession session = req.getSession();
		Users user=(Users)session.getAttribute("user");		
		//Integer UserId=user.getUserId();
		// Checking for if user is logged in or not
				if (user == null) {
					req.setAttribute("loginError", "Please login to book a package!!");
					req.getRequestDispatcher("sign.jsp").forward(req, resp);
					return;
				}
				
				try {
					// Extract booking parameters from request
					Integer packageId = Integer.parseInt(req.getParameter("packageId"));
					String travelDate = req.getParameter("travelDate");
					
					// Validate inputs
					if (packageId == null || travelDate == null || travelDate.isEmpty()) {
						req.setAttribute("bookingError", "Package ID and Travel Date are required!");
						req.getRequestDispatcher("packages.jsp").forward(req, resp);
						return;
					}
					
					// Validate travel date is not in the past
					LocalDate selectedDate = LocalDate.parse(travelDate);
					LocalDate today = LocalDate.now();
					if (selectedDate.isBefore(today)) {
						req.setAttribute("bookingError", "Travel date cannot be in the past!");
						req.getRequestDispatcher("packages.jsp").forward(req, resp);
						return;
					}
					
					// Create Bookings object
					Bookings booking = new Bookings();
					booking.setUserId(user.getUserId());
					booking.setPackageId(packageId);
					booking.setTravelDate(travelDate);
					booking.setBookingDate(LocalDate.now().toString()); // Current date
					booking.setBookingStatus("PENDING"); // Initial status is PENDING
					
					// Insert booking into database
					bdao.addBooking(booking);
					
					// Forward to booking confirmation page
					req.setAttribute("bookingSuccess", "Package booked successfully! Your booking status is PENDING.");
					req.getRequestDispatcher("myBookings.jsp").forward(req, resp);
					
				} catch (NumberFormatException e) {
					req.setAttribute("bookingError", "Invalid input format!");
					req.getRequestDispatcher("packages.jsp").forward(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
					req.setAttribute("bookingError", "An error occurred while booking the package: " + e.getMessage());
					req.getRequestDispatcher("packages.jsp").forward(req, resp);
				}
			}
		


		
	}


