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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        UsersDAO udao = new UsersDAOImpl();
        Users user = new Users();

        String userName = req.getParameter("userName");
        String phone = req.getParameter("phone");
        String email = req.getParameter("userEmail");
        String address = req.getParameter("address");
        String password = req.getParameter("password");
        String confirm = req.getParameter("confirm");

        // Check if email already exists
        Users alreadyExists = udao.getUsersByMail(email);

        if (alreadyExists != null) {
            req.setAttribute("signupError", "Account already exists with this email!");
            req.getRequestDispatcher("sign.jsp").forward(req, resp);
            return;
        }

        // Check password confirmation
        if (!password.equals(confirm)) {
            req.setAttribute("signupError", "Password and Confirm Password do not match!");
            req.getRequestDispatcher("sign.jsp").forward(req, resp);
            return;
        }

        // Save user
        user.setUserName(userName);
        user.setPhone(phone);
        user.setUserEmail(email);
        user.setAddress(address);
        user.setPassword(password);

        udao.addUsers(user);

        req.setAttribute("signupSuccess", "Account created successfully! Please login.");
        req.getRequestDispatcher("sign.jsp").forward(req, resp);
    }
}