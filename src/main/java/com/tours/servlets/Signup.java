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

        // 1. Gather form input parameters matching the signup.jsp name tokens exactly
        String nameParam = req.getParameter("userName");
        String emailParam = req.getParameter("userEmail");
        String phoneParam = req.getParameter("phone");
        String addressParam = req.getParameter("address");
        String passwordParam = req.getParameter("password");
        String confirmPasswordParam = req.getParameter("confirmPassword");

        // 2. Perform safe fallback verification checks
        if (emailParam == null || passwordParam == null || nameParam == null) {
            req.setAttribute("signupError", "Mandatory form parameters are missing.");
            req.getRequestDispatcher("signup.jsp").forward(req, resp);
            return;
        }

        // 3. Query the DB model to prevent duplicate registrations
        Users alreadyExists = udao.getUsersByMail(emailParam);

        if (alreadyExists == null) {
            // 4. Confirm security fields match before data storage actions
            if (passwordParam.equals(confirmPasswordParam)) {
                
                // 5. Populate your Users DTO architecture variables
                user.setUserName(nameParam);
                user.setUserEmail(emailParam);
                user.setPhone(phoneParam);
                user.setAddress(addressParam);
                user.setPassword(passwordParam);

                // 6. Invoke your DAO layer execution routine to save into DB
                udao.addUsers(user);

                // Forward execution back safely to display success
                req.setAttribute("signupSuccess", "Account created successfully!");
                req.getRequestDispatcher("signup.jsp").forward(req, resp);
            } 
            else {
                req.setAttribute("signupError", "Passwords do not match! Verification check failed.");
                req.getRequestDispatcher("signup.jsp").forward(req, resp);
            }
        } 
        else {
            req.setAttribute("signupError", "An account with this email address already exists.");
            req.getRequestDispatcher("signup.jsp").forward(req, resp);
        }
    }
}