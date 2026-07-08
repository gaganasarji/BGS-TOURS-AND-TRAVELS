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
public class Login extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UsersDAO Udao=new UsersDAOImpl();
		Users login=Udao.getUsersByMailAndPassword(req.getParameter("mail"), req.getParameter("password"));
		
		if(login!=null) {
			HttpSession session=req.getSession();
			session.setAttribute("user", login);
			if(login.getUserId()==1) { //userId==1
				resp.sendRedirect("admin.jsp");
			}
			else {
				resp.sendRedirect("myBookings.jsp");
			}
		}
		else {
			req.setAttribute("loginError", "Failed to login!");
			req.getRequestDispatcher("sign.jsp").forward(req, resp);
		}
	}
}
