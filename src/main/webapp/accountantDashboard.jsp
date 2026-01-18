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
    <title>Accountant Dashboard | EduAdmin</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background: #f4f6f9;
            font-family: "Segoe UI", sans-serif;
        }

        .dashboard-header {
            background: linear-gradient(135deg, #198754, #20c997);
            color: white;
            padding: 30px;
            border-radius: 14px;
            min-height: 140px;

            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .dashboard-card {
            border-radius: 15px;
            transition: 0.3s ease;
            width: 320px;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }

        .card-icon {
            font-size: 40px;
            margin-bottom: 15px;
        }
    </style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container-fluid">
        <span class="navbar-brand fw-semibold">
            <i class="fa-solid fa-file-invoice-dollar me-2"></i>
            EduAdmin | Accountant Panel
        </span>
        <a href="logout" class="btn btn-outline-light btn-sm">
            <i class="fa-solid fa-right-from-bracket"></i> Logout
        </a>
    </div>
</nav>

<div class="container mt-4">

    <!-- Centered Welcome Section -->
    <div class="dashboard-header mb-5">
        <h4>Welcome, Accountant 👋</h4>
        <p class="mb-0">Manage student fee records and payments efficiently</p>
    </div>

    <!-- Centered Cards -->
    <div class="d-flex justify-content-center gap-4 flex-wrap">

        <!-- Pay Fee Card -->
        <a href="payFee.jsp" class="text-decoration-none text-dark">
            <div class="card dashboard-card text-center p-4">
                <div class="card-icon text-success">
                    <i class="fa-solid fa-indian-rupee-sign"></i>
                </div>
                <h5>Pay Student Fee</h5>
                <p class="text-muted">Record student fee payments</p>
            </div>
        </a>

        <!-- ✅ Fee Receipt Card -->
        <a href="feeReceipt" class="text-decoration-none text-dark">
            <div class="card dashboard-card text-center p-4">
                <div class="card-icon text-primary">
                    <i class="fa-solid fa-receipt"></i>
                </div>
                <h5>Fee Receipt</h5>
                <p class="text-muted">View / generate fee receipt</p>
            </div>
        </a>

    </div>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
