package com.tours.servlets;

import java.io.IOException;

import com.tours.dao.UsersDAO;
import com.tours.daoImpl.UsersDAOImpl;
import com.tours.dto.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String mail = req.getParameter("mail");
		String password = req.getParameter("password");

		UsersDAO udao = new UsersDAOImpl();
		Users user = udao.getUsersByMailAndPassword(mail, password);

		if (user != null) {

			HttpSession session = req.getSession();
			session.setAttribute("user", user);

			// Admin Login
			if (user.getUserId() == 1) {
				resp.sendRedirect("admin.jsp");
			}
			// Normal User Login
			else {
				resp.sendRedirect("packages.jsp");
				// If you want users to go directly to My Bookings,
				// replace the above line with:
				// resp.sendRedirect("myBookings.jsp");
			}

		} else {

			req.setAttribute("loginError", "Invalid Email or Password!");
			req.getRequestDispatcher("sign.jsp").forward(req, resp);

		}
	}
}