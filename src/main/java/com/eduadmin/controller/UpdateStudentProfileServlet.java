package com.eduadmin.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eduadmin.dao.FeeStructureDao;
import com.eduadmin.dao.StudentFeeDao;
import com.eduadmin.dao.StudentProfileDao;

@WebServlet("/updateStudentProfile")
public class UpdateStudentProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        HttpSession session = req.getSession(false);

        if (session == null || !"STUDENT".equals(session.getAttribute("role"))) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String email = (String) session.getAttribute("email");
        Date dob = Date.valueOf(req.getParameter("dob"));
        String standard = req.getParameter("standard");

        // Save profile
        StudentProfileDao profileDao = new StudentProfileDao();
        profileDao.saveProfile(email, dob, standard);

        // ✅ AUTO ASSIGN FEE (FIXED)
        FeeStructureDao feeDao = new FeeStructureDao();
        StudentFeeDao studentFeeDao = new StudentFeeDao();

        int totalFee = feeDao.getFeeByStandard(standard);
        studentFeeDao.assignFee(email, standard, totalFee); // ✅ ERROR FIXED

        resp.sendRedirect("studentDashboard.jsp");
    }
}
