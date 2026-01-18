package com.eduadmin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eduadmin.dao.FeeStructureDao;

@WebServlet("/setFee")
public class SetFeeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String standard = req.getParameter("standard");
        int totalFee = Integer.parseInt(req.getParameter("totalFee"));

        FeeStructureDao dao = new FeeStructureDao();
        dao.setFee(standard, totalFee);

        resp.sendRedirect("adminFeeStructure.jsp");
    }
}
