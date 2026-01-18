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
    <title>Add User | EduAdmin</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background: #f4f6f9;
            font-family: "Segoe UI", sans-serif;
        }

        .admin-header {
            background: linear-gradient(135deg, #343a40, #495057);
            color: white;
            padding: 20px;
            border-radius: 12px;
            text-align: center;
        }

        .admin-card {
            border-radius: 15px;
        }

        .form-control, .form-select {
            border-radius: 10px;
            padding: 11px 14px;
        }

        .form-control:focus, .form-select:focus {
            box-shadow: 0 0 0 0.2rem rgba(52,58,64,.25);
            border-color: #343a40;
        }
    </style>
</head>

<body>

<div class="container mt-4 col-md-5 col-sm-11">

    <!-- Header -->
    <div class="admin-header mb-4">
        <h4>
            <i class="fa-solid fa-user-plus me-2"></i>
            Add New User
        </h4>
        <p class="mb-0">Create staff, student, or accountant accounts</p>
    </div>

    <!-- Form Card -->
    <div class="card shadow admin-card">
        <div class="card-body p-4">

            <!-- Optional Message -->
            <% if(request.getAttribute("msg") != null) { %>
                <div class="alert alert-info text-center">
                    <%= request.getAttribute("msg") %>
                </div>
            <% } %>

            <form action="register" method="post">

                <!-- Name -->
                <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <div class="input-group">
                        <span class="input-group-text">
                            <i class="fa-solid fa-user"></i>
                        </span>
                        <input type="text"
                               name="name"
                               class="form-control"
                               required>
                    </div>
                </div>

                <!-- Email -->
                <div class="mb-3">
                    <label class="form-label">Email Address</label>
                    <div class="input-group">
                        <span class="input-group-text">
                            <i class="fa-solid fa-envelope"></i>
                        </span>
                        <input type="email"
                               name="email"
                               class="form-control"
                               required>
                    </div>
                </div>

                <!-- Password -->
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <div class="input-group">
                        <span class="input-group-text">
                            <i class="fa-solid fa-lock"></i>
                        </span>
                        <input type="password"
                               name="password"
                               id="password"
                               class="form-control"
                               required>
                        <span class="input-group-text" style="cursor:pointer"
                              onclick="togglePassword()">
                            <i class="fa-solid fa-eye" id="eyeIcon"></i>
                        </span>
                    </div>
                </div>

                <!-- Role -->
                <div class="mb-4">
                    <label class="form-label">Role</label>
                    <select name="role" class="form-select" required>
                        <option value="">Select Role</option>
                        <option value="ACCOUNTANT">Accountant</option>
                        <option value="STAFF">Staff</option>
                        <option value="STUDENT">Student</option>
                    </select>
                </div>

                <!-- Button -->
                <button class="btn btn-success w-100">
                    <i class="fa-solid fa-user-check"></i> Add User
                </button>

            </form>
        </div>

        <!-- Footer -->
        <div class="card-footer text-center bg-white">
            <a href="adminDashboard.jsp" class="btn btn-secondary btn-sm">
                <i class="fa-solid fa-arrow-left"></i> Back to Dashboard
            </a>
        </div>
    </div>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
    function togglePassword() {
        const pwd = document.getElementById("password");
        const icon = document.getElementById("eyeIcon");

        if (pwd.type === "password") {
            pwd.type = "text";
            icon.classList.replace("fa-eye", "fa-eye-slash");
        } else {
            pwd.type = "password";
            icon.classList.replace("fa-eye-slash", "fa-eye");
        }
    }
</script>

</body>
</html>
