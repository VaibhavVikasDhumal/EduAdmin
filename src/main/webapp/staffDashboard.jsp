<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
HttpSession s = request.getSession(false);
if (s == null || !"STAFF".equals(s.getAttribute("role"))) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Staff Dashboard | EduAdmin</title>

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
            background: linear-gradient(135deg, #343a40, #495057);
            color: white;
            padding: 25px;
            border-radius: 12px;
        }

        .dashboard-card {
            border-radius: 15px;
            transition: 0.3s ease;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }

        .card-icon {
            font-size: 36px;
            margin-bottom: 10px;
        }
    </style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container-fluid">
        <span class="navbar-brand fw-semibold">
            <i class="fa-solid fa-graduation-cap me-2"></i>
            EduAdmin | Staff Panel
        </span>
        <a href="logout" class="btn btn-outline-light btn-sm">
            <i class="fa-solid fa-right-from-bracket"></i> Logout
        </a>
    </div>
</nav>

<div class="container mt-4">

    <!-- Welcome Section -->
    <div class="dashboard-header mb-4">
        <h4>Welcome, Staff Member 👋</h4>
        <p class="mb-0">Manage subjects, attendance, and student marks efficiently.</p>
    </div>

    <!-- Dashboard Cards -->
    <div class="row g-4">

        <div class="col-md-4">
            <a href="chooseSubject.jsp" class="text-decoration-none">
                <div class="card dashboard-card text-center p-4">
                    <div class="card-icon text-primary">
                        <i class="fa-solid fa-book-open"></i>
                    </div>
                    <h5>Choose Subject</h5>
                    <p class="text-muted">Select and manage assigned subjects</p>
                </div>
            </a>
        </div>

        <div class="col-md-4">
            <a href="markAttendance.jsp" class="text-decoration-none">
                <div class="card dashboard-card text-center p-4">
                    <div class="card-icon text-warning">
                        <i class="fa-solid fa-calendar-check"></i>
                    </div>
                    <h5>Mark Attendance</h5>
                    <p class="text-muted">Record daily student attendance</p>
                </div>
            </a>
        </div>

        <div class="col-md-4">
            <a href="addMarks.jsp" class="text-decoration-none">
                <div class="card dashboard-card text-center p-4">
                    <div class="card-icon text-success">
                        <i class="fa-solid fa-pen-to-square"></i>
                    </div>
                    <h5>Add / Update Marks</h5>
                    <p class="text-muted">Enter or modify student marks</p>
                </div>
            </a>
        </div>

    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
