<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.eduadmin.dao.StudentFeeDao" %>

<%
HttpSession s = request.getSession(false);
if (s == null || !"STUDENT".equals(s.getAttribute("role"))) {
    response.sendRedirect("login.jsp");
    return;
}

String email = (String) s.getAttribute("email");
StudentFeeDao dao = new StudentFeeDao();
int remaining = dao.getRemainingFee(email);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Fee Details | EduAdmin</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background: #f4f6f9;
            font-family: "Segoe UI", sans-serif;
        }

        .fee-header {
            background: linear-gradient(135deg, #198754, #20c997);
            color: white;
            padding: 20px;
            border-radius: 12px;
            text-align: center;
        }

        .fee-card {
            border-radius: 15px;
        }

        .fee-amount {
            font-size: 36px;
            font-weight: 700;
        }
    </style>
</head>

<body>

<div class="container mt-4 col-md-5 col-sm-11">

    <!-- Header -->
    <div class="fee-header mb-4">
        <h4>
            <i class="fa-solid fa-indian-rupee-sign me-2"></i>
            Fee Details
        </h4>
        <p class="mb-0">Your current fee status</p>
    </div>

    <!-- Fee Card -->
    <div class="card shadow fee-card">
        <div class="card-body text-center py-4">
            <h5 class="text-muted mb-2">Remaining Fee</h5>

            <div class="fee-amount text-success">
                ₹ <%= remaining %>
            </div>

            <p class="text-muted mt-2">
                Please contact the accounts office for payment details.
            </p>
        </div>

        <div class="card-footer text-center bg-white">
            <a href="studentDashboard.jsp" class="btn btn-secondary">
                <i class="fa-solid fa-arrow-left"></i> Back to Dashboard
            </a>
        </div>
    </div>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
