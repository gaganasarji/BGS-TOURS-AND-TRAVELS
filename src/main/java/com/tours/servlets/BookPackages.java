package com.tours.servlets;

import java.io.IOException;
import com.tours.dao.BookingDAO;
import com.tours.daoImpl.BookingsDAOImpl;
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
		Integer UserId=user.getUserId();
		
	}

}
