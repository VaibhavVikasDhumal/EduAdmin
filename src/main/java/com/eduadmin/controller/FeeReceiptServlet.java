package com.eduadmin.controller;

import java.io.IOException;
import java.sql.ResultSet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.eduadmin.dao.FeeReceiptDao;

@WebServlet("/feeReceipt")
public class FeeReceiptServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        HttpSession session = req.getSession(false);
        if (session == null || !"ACCOUNTANT".equals(session.getAttribute("role"))) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String email = req.getParameter("email");

        try {
            FeeReceiptDao dao = new FeeReceiptDao();
            ResultSet rs = dao.getLatestReceipt(email);

            if (rs != null && rs.next()) {
                req.setAttribute("receiptId", rs.getInt("receipt_id"));
                req.setAttribute("email", rs.getString("student_email"));
                req.setAttribute("amount", rs.getInt("paid_amount"));
                req.setAttribute("date", rs.getTimestamp("payment_date"));
                req.setAttribute("accountant", rs.getString("accountant_email"));
            } else {
                req.setAttribute("msg", "No recent payment found.");
            }

            req.getRequestDispatcher("feeReceipt.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
