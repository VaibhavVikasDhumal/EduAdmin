package com.eduadmin.controller;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.eduadmin.dao.StudentFeeDao;

@WebServlet("/fetchStudentFee")
public class FetchStudentFeeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        HttpSession session = req.getSession(false);
        if (session == null || !"ACCOUNTANT".equals(session.getAttribute("role"))) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String email = req.getParameter("email");

        StudentFeeDao dao = new StudentFeeDao();
        int totalFee = dao.getTotalFee(email);
        int paidFee = dao.getPaidFee(email);
        int remainingFee = dao.getRemainingFee(email);

        req.setAttribute("email", email);
        req.setAttribute("totalFee", totalFee);
        req.setAttribute("paidFee", paidFee);
        req.setAttribute("remainingFee", remainingFee);

        try {
            req.getRequestDispatcher("payFee.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

