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
public class Signup extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        UsersDAO udao = new UsersDAOImpl();
        Users user = new Users();

        String email = req.getParameter("userEmail");
        String password = req.getParameter("password");
        String confirm = req.getParameter("confirm");

        // Check if email already exists
        Users alreadyExists = udao.getUsersByMail(email);
        
        if (alreadyExists == null) {
            if (password.equals(confirm)) {
                user.setUserName(req.getParameter("userName"));
                user.setPhone(req.getParameter("phone"));
                user.setUserEmail(email);
                user.setAddress(req.getParameter("address"));
                user.setPassword(password);

                udao.addUsers(user);
                
                req.setAttribute("signupSuccess", "Account created!");
                req.getRequestDispatcher("sign.jsp").forward(req, resp);
            } else {
                req.setAttribute("signupError", "Password mismatch!");
                req.getRequestDispatcher("sign.jsp").forward(req, resp);
            }
        } else {
            req.setAttribute("signupError", "Account already exists with this email!");
            req.getRequestDispatcher("sign.jsp").forward(req, resp);
        }
    }
}