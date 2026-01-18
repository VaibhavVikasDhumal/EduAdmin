package com.eduadmin.controller;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.eduadmin.dao.MarksDao;

@WebServlet("/addMarks")
public class AddMarksServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        HttpSession session = req.getSession(false);
        if (session == null || !"STAFF".equals(session.getAttribute("role"))) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String email = req.getParameter("studentEmail");
        String subject = req.getParameter("subject");
        int marks = Integer.parseInt(req.getParameter("marks"));

        new MarksDao().addOrUpdateMarks(email, subject, marks);
        resp.sendRedirect("staffDashboard.jsp");
    }
}
