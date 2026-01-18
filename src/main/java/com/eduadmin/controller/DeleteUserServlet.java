package com.eduadmin.controller;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eduadmin.dao.UserDao;

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        HttpSession session = req.getSession(false);

        if (session == null || !"ADMIN".equals(session.getAttribute("role"))) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String email = req.getParameter("email");

        UserDao dao = new UserDao();
        dao.deleteUser(email);

        resp.sendRedirect("adminDashboard.jsp");
    }
}
