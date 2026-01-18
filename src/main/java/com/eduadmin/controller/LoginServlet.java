package com.eduadmin.controller;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.eduadmin.dao.UserDao;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        UserDao dao = new UserDao();
        String role = dao.login(email, password);

        if (role != null) {

            HttpSession session = req.getSession();
            session.setAttribute("email", email);
            session.setAttribute("role", role);

            // ✅ ROLE-BASED REDIRECTION (FIX)
            if ("ADMIN".equals(role)) {
                resp.sendRedirect("adminDashboard.jsp");
            } else if ("ACCOUNTANT".equals(role)) {
                resp.sendRedirect("accountantDashboard.jsp");
            } else if ("STUDENT".equals(role)) {
                resp.sendRedirect("studentDashboard.jsp");
            } else if ("STAFF".equals(role)) {
                resp.sendRedirect("staffDashboard.jsp");
            }

        } else {
            // ❌ Invalid login
            resp.sendRedirect("login.jsp");
        }
    }
}
