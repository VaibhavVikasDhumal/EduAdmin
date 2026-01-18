<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
HttpSession s = request.getSession(false);
if (s == null || !"STUDENT".equals(s.getAttribute("role"))) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard | EduAdmin</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background: #f4f6f9;
            font-family: "Segoe UI", sans-serif;
        }

        /* Centered welcome header */
        .dashboard-header {
            background: linear-gradient(135deg, #0d6efd, #6ea8fe);
            color: white;
            padding: 30px;
            border-radius: 14px;
            text-align: center;

            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .dashboard-card {
            border-radius: 15px;
            transition: 0.3s ease;
            cursor: pointer;
            height: 100%;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }

        .card-icon {
            font-size: 36px;
            margin-bottom: 12px;
        }
    </style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container-fluid">
        <span class="navbar-brand fw-semibold">
            <i class="fa-solid fa-user-graduate me-2"></i>
            EduAdmin | Student Panel
        </span>
        <a href="logout" class="btn btn-outline-light btn-sm">
            <i class="fa-solid fa-right-from-bracket"></i> Logout
        </a>
    </div>
</nav>

<div class="container mt-4">

    <!-- ✅ Centered Welcome Section -->
    <div class="dashboard-header mb-5">
        <h4>Welcome, Student 👋</h4>
        <p class="mb-0">
            Access your profile, fees, attendance, and marks in one place
        </p>
    </div>

    <!-- ✅ Centered Dashboard Cards (2 x 2 layout) -->
    <div class="row justify-content-center g-4">

        <div class="col-md-5 col-sm-6">
            <a href="studentProfile.jsp" class="text-decoration-none text-dark">
                <div class="card dashboard-card text-center p-4">
                    <div class="card-icon text-primary">
                        <i class="fa-solid fa-id-card"></i>
                    </div>
                    <h5>My Profile</h5>
                    <p class="text-muted">View and update your details</p>
                </div>
            </a>
        </div>

        <div class="col-md-5 col-sm-6">
            <a href="studentFee.jsp" class="text-decoration-none text-dark">
                <div class="card dashboard-card text-center p-4">
                    <div class="card-icon text-success">
                        <i class="fa-solid fa-indian-rupee-sign"></i>
                    </div>
                    <h5>Fee Details</h5>
                    <p class="text-muted">Check paid and remaining fees</p>
                </div>
            </a>
        </div>

        <div class="col-md-5 col-sm-6">
            <a href="studentAttendance.jsp" class="text-decoration-none text-dark">
                <div class="card dashboard-card text-center p-4">
                    <div class="card-icon text-warning">
                        <i class="fa-solid fa-calendar-check"></i>
                    </div>
                    <h5>Attendance</h5>
                    <p class="text-muted">View your attendance record</p>
                </div>
            </a>
        </div>

        <div class="col-md-5 col-sm-6">
            <a href="studentMarks.jsp" class="text-decoration-none text-dark">
                <div class="card dashboard-card text-center p-4">
                    <div class="card-icon text-info">
                        <i class="fa-solid fa-pen"></i>
                    </div>
                    <h5>Marks</h5>
                    <p class="text-muted">Check subject-wise marks</p>
                </div>
            </a>
        </div>

    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
