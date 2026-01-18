package com.eduadmin.controller;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.eduadmin.dao.SubjectDao;

@WebServlet("/assignSubject")
public class StaffSubjectServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        HttpSession session = req.getSession(false);
        if (session == null || !"STAFF".equals(session.getAttribute("role"))) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String staffEmail = (String) session.getAttribute("email");
        String subject = req.getParameter("subject");

        new SubjectDao().assignSubject(staffEmail, subject);
        resp.sendRedirect("staffDashboard.jsp");
    }
}
