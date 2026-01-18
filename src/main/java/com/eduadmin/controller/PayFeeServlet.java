package com.eduadmin.controller;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.eduadmin.dao.StudentFeeDao;
import com.eduadmin.dao.FeeReceiptDao;

@WebServlet("/payFee")
public class PayFeeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        HttpSession session = req.getSession(false);
        if (session == null || !"ACCOUNTANT".equals(session.getAttribute("role"))) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String studentEmail = req.getParameter("email");
        int amount = Integer.parseInt(req.getParameter("amount"));
        String accountantEmail = (String) session.getAttribute("email");

        StudentFeeDao feeDao = new StudentFeeDao();
        boolean success = feeDao.payFee(studentEmail, amount);

        if (success) {
            // ✅ Save receipt
            FeeReceiptDao receiptDao = new FeeReceiptDao();
            receiptDao.saveReceipt(studentEmail, amount, accountantEmail);

            // Redirect to receipt page
            resp.sendRedirect("feeReceipt?email=" + studentEmail);
        } else {
            resp.sendRedirect("payFee.jsp?error=invalidAmount");
        }
    }
}
