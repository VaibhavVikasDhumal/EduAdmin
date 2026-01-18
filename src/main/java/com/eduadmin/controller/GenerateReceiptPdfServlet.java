package com.eduadmin.controller;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfWriter;

@WebServlet("/generatePdf")
public class GenerateReceiptPdfServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        res.setContentType("application/pdf");
        res.setHeader("Content-Disposition", "attachment; filename=FeeReceipt.pdf");

        Document document = new Document();

        try {
            PdfWriter.getInstance(document, res.getOutputStream());
            document.open();

            Font titleFont = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD);
            Font bodyFont = new Font(Font.FontFamily.HELVETICA, 12);

            document.add(new Paragraph("EduAdmin Fee Receipt", titleFont));
            document.add(new Paragraph(" "));
            document.add(new Paragraph("--------------------------------------"));
            document.add(new Paragraph("Student Email : " + req.getParameter("email"), bodyFont));
            document.add(new Paragraph("Paid Amount   : ₹ " + req.getParameter("amount"), bodyFont));
            document.add(new Paragraph("Payment Date : " + req.getParameter("date"), bodyFont));
            document.add(new Paragraph("--------------------------------------"));
            document.add(new Paragraph(" "));
            document.add(new Paragraph("This is a system generated receipt.", bodyFont));

            document.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
