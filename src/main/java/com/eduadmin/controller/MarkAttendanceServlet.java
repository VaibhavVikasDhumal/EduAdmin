package com.eduadmin.controller;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.eduadmin.dao.AttendanceDao;

@WebServlet("/markAttendance")
public class MarkAttendanceServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        HttpSession session = req.getSession(false);
        if (session == null || !"STAFF".equals(session.getAttribute("role"))) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String email = req.getParameter("studentEmail");
        Date date = Date.valueOf(req.getParameter("date"));
        String status = req.getParameter("status");

        new AttendanceDao().markAttendance(email, date, status);
        resp.sendRedirect("staffDashboard.jsp");
    }
}
