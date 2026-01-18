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
    <title>Delete User | EduAdmin</title>

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
            background: linear-gradient(135deg, #dc3545, #b02a37);
            color: white;
            padding: 20px;
            border-radius: 12px;
            text-align: center;
        }

        .delete-card {
            border-radius: 15px;
        }

        .form-control {
            border-radius: 10px;
            padding: 11px 14px;
        }

        .form-control:focus {
            box-shadow: 0 0 0 0.2rem rgba(220,53,69,.25);
            border-color: #dc3545;
        }
    </style>
</head>

<body>

<div class="container mt-4 col-md-5 col-sm-11">

    <!-- Header -->
    <div class="admin-header mb-4">
        <h4>
            <i class="fa-solid fa-user-xmark me-2"></i>
            Delete User
        </h4>
        <p class="mb-0">
            This action will permanently remove a user account
        </p>
    </div>

    <!-- Delete Form -->
    <div class="card shadow delete-card">
        <div class="card-body p-4">

            <!-- Optional Message -->
            <% if(request.getAttribute("msg") != null) { %>
                <div class="alert alert-warning text-center">
                    <%= request.getAttribute("msg") %>
                </div>
            <% } %>

            <form action="deleteUser" method="post">

                <!-- Email -->
                <div class="mb-4">
                    <label class="form-label">User Email</label>
                    <div class="input-group">
                        <span class="input-group-text">
                            <i class="fa-solid fa-envelope"></i>
                        </span>
                        <input type="email"
                               name="email"
                               class="form-control"
                               placeholder="user@example.com"
                               required>
                    </div>
                    <small class="text-muted">
                        Ensure the email is correct before deleting
                    </small>
                </div>

                <!-- Button -->
                <button class="btn btn-danger w-100">
                    <i class="fa-solid fa-trash"></i> Delete User
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

</body>
</html>
