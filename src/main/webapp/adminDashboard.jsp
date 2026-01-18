<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
HttpSession s = request.getSession(false);
if (s == null || !"ADMIN".equals(s.getAttribute("role"))) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard | EduAdmin</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background: #f4f6f9;
            font-family: "Segoe UI", sans-serif;
        }

        /* 🔹 Centered welcome section */
        .dashboard-header {
            background: linear-gradient(135deg, #2f3e46, #354f52);
            color: #e9ecef;
            padding: 30px;
            border-radius: 14px;
            min-height: 140px;

            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .dashboard-header h4 {
            font-weight: 600;
        }

        .dashboard-header p {
            color: #cfd8dc;
            margin-bottom: 0;
        }

        /* Card styling */
        .dashboard-card {
            border-radius: 15px;
            transition: 0.3s ease;
            height: 100%;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }

        .card-body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            height: 220px;
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
            <i class="fa-solid fa-user-shield me-2"></i>
            EduAdmin | Admin Panel
        </span>
        <a href="logout" class="btn btn-outline-light btn-sm">
            <i class="fa-solid fa-right-from-bracket"></i> Logout
        </a>
    </div>
</nav>

<div class="container-fluid mt-4 px-4">

    <!-- ✅ Centered Welcome Section -->
    <div class="dashboard-header mb-4">
        <h4>Welcome, Admin 👋</h4>
        <p>Manage users, fee structure, and system settings</p>
    </div>

    <!-- Dashboard Cards -->
    <div class="row g-4">

        <div class="col-md-6">
            <a href="adminFeeStructure.jsp" class="text-decoration-none text-dark">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <div class="card-icon text-warning">
                            <i class="fa-solid fa-coins"></i>
                        </div>
                        <h5>Set Fee Structure</h5>
                        <p class="text-muted">Define and update institute fee structure</p>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-6">
            <a href="adminAddUser.jsp" class="text-decoration-none text-dark">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <div class="card-icon text-success">
                            <i class="fa-solid fa-user-plus"></i>
                        </div>
                        <h5>Add User</h5>
                        <p class="text-muted">Create student, staff, or accountant accounts</p>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-6">
            <a href="deleteUser.jsp" class="text-decoration-none text-dark">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <div class="card-icon text-danger">
                            <i class="fa-solid fa-user-xmark"></i>
                        </div>
                        <h5>Delete User</h5>
                        <p class="text-muted">Remove users from the system</p>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-6">
            <a href="viewUsers.jsp" class="text-decoration-none text-dark">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <div class="card-icon text-info">
                            <i class="fa-solid fa-users"></i>
                        </div>
                        <h5>View All Users</h5>
                        <p class="text-muted">View all registered system users</p>
                    </div>
                </div>
            </a>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
