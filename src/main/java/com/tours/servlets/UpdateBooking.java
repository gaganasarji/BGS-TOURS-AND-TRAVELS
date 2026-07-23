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
public class UpdateBooking extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        Users admin = (Users) session.getAttribute("user");

        // Allow only the admin (userId = 1)
        if (admin == null || admin.getUserId() != 1) {
            resp.sendRedirect("sign.jsp");
            return;
        }

        BookingDAO bdao = new BookingsDAOImpl();

        try {

            Integer bookingId = Integer.parseInt(req.getParameter("bookingId"));
            String status = req.getParameter("status");

            Bookings booking = bdao.findById(bookingId);

            if (booking != null) {

                booking.setBookingStatus(status);

                bdao.updateBooking(booking);

                resp.sendRedirect("mybookings.jsp");

            } else {

                req.setAttribute("error", "Booking not found!");
                req.getRequestDispatcher("admin.jsp").forward(req, resp);

            }

        } catch (NumberFormatException e) {

            req.setAttribute("error", "Invalid Booking ID!");
            req.getRequestDispatcher("admin.jsp").forward(req, resp);

        } catch (Exception e) {

            e.printStackTrace();

            req.setAttribute("error", "Unable to update booking.");
            req.getRequestDispatcher("admin.jsp").forward(req, resp);

        }
    }
}