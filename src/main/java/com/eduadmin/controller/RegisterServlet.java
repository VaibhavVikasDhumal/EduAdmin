package com.eduadmin.controller;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.eduadmin.dao.UserDao;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        // Get form data
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        UserDao dao = new UserDao();

        boolean success = dao.registerUser(name, email, password, role);

        if (success) {
            // ✅ Registration successful
            resp.sendRedirect("login.jsp");
        } else {
            // ❌ Registration failed (duplicate email etc.)
            resp.sendRedirect("register.jsp");
        }
    }
}
