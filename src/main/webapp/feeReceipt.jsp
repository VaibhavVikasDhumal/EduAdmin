<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
HttpSession s = request.getSession(false);
if (s == null || !"ACCOUNTANT".equals(s.getAttribute("role"))) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Fee Receipt | EduAdmin</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background: #f4f6f9;
    font-family: "Segoe UI", sans-serif;
}
.receipt-box {
    background: white;
    padding: 30px;
    border-radius: 12px;
}
@media print {
    .no-print { display: none; }
    body { background: white; }
}
</style>
</head>

<body>

<div class="container mt-5 col-md-6">
    <div class="receipt-box shadow">

        <h4 class="text-center mb-3">EduAdmin – Fee Receipt</h4>
        <hr>

        <% if (request.getAttribute("msg") != null) { %>
            <div class="alert alert-warning text-center">
                <%= request.getAttribute("msg") %>
            </div>
        <% } else { %>

        <p><b>Receipt No:</b> <%= request.getAttribute("receiptId") %></p>
        <p><b>Student Email:</b> <%= request.getAttribute("email") %></p>
        <p><b>Paid Amount:</b> ₹ <%= request.getAttribute("amount") %></p>
        <p><b>Payment Date:</b> <%= request.getAttribute("date") %></p>
        <p><b>Accountant:</b> <%= request.getAttribute("accountant") %></p>

        <hr>
        <p class="text-center text-muted">
            This receipt shows the most recent fee payment.
        </p>

        <div class="text-center no-print">
            <button class="btn btn-primary" onclick="window.print()">Print Receipt</button>
            <a href="accountantDashboard.jsp" class="btn btn-secondary ms-2">Back</a>
        </div>

        <% } %>

    </div>
</div>

</body>
</html>
