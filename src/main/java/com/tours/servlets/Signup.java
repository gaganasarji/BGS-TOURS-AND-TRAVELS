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
@WebServlet("/signup")
public class Signup extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UsersDAO Udao=new UsersDAOImpl();
		Users user=new Users();

		Users alreadyExists=Udao.getUsersByMail(req.getParameter("mail"));
		if(alreadyExists==null) {
			if(req.getParameter("password").equals(req.getParameter("confirm"))) {
				user.setUserName(req.getParameter("UserName"));
				user.setPhone(req.getParameter("Phone"));
				user.setUserEmail(req.getParameter("UserEmail"));
				user.setPassword(req.getParameter("Password"));
				//guest.setPreferences(req.getParameter("preferences"));
				Udao.addUsers(user);
				req.setAttribute("signupSuccess", "Account created!");
				req.getRequestDispatcher("sign.jsp").forward(req, resp);
			}
			else {
				req.setAttribute("signupError", "Password mismatch!");
				req.getRequestDispatcher("sign.jsp").forward(req, resp);
			}
		}
		else {
			req.setAttribute("signupError", "Account already exists with this email!");
			req.getRequestDispatcher("sign.jsp").forward(req, resp);
		}

	}
}
