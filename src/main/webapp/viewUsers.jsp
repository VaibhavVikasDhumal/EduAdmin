<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.eduadmin.dao.UserDao" %>
<%@ page import="com.eduadmin.entities.User" %>
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
    <title>View Users | EduAdmin</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background: #f4f6f9;
            font-family: "Segoe UI", sans-serif;
        }

        /* Centered header */
        .admin-header {
            background: linear-gradient(135deg, #343a40, #495057);
            color: white;
            padding: 25px;
            border-radius: 12px;

            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .user-card {
            border-radius: 15px;
        }

        .role-badge {
            font-size: 13px;
            padding: 6px 10px;
        }
    </style>
</head>

<body>

<div class="container mt-4">

    <!-- ✅ CENTERED HEADER -->
    <div class="admin-header mb-4">
        <h4>
            <i class="fa-solid fa-users me-2"></i>
            All Users
        </h4>
        <p class="mb-0">
            View registered students, staff, accountants, and admins
        </p>
    </div>

    <!-- Users Table -->
    <div class="card shadow user-card">
        <div class="card-body">

            <table class="table table-hover table-bordered align-middle text-center">
                <thead class="table-dark">
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Role</th>
                    </tr>
                </thead>

                <tbody>
                <%
                    UserDao dao = new UserDao();
                    List<User> users = dao.getAllUsers();

                    if (users.isEmpty()) {
                %>
                    <tr>
                        <td colspan="3" class="text-muted">No users found</td>
                    </tr>
                <%
                    } else {
                        for (User u : users) {
                %>
                    <tr>
                        <td><%= u.getName() %></td>
                        <td><%= u.getEmail() %></td>
                        <td>
                            <% String role = u.getRole(); %>

                            <% if ("ADMIN".equals(role)) { %>
                                <span class="badge bg-danger role-badge">ADMIN</span>
                            <% } else if ("STAFF".equals(role)) { %>
                                <span class="badge bg-warning text-dark role-badge">STAFF</span>
                            <% } else if ("ACCOUNTANT".equals(role)) { %>
                                <span class="badge bg-success role-badge">ACCOUNTANT</span>
                            <% } else { %>
                                <span class="badge bg-primary role-badge">STUDENT</span>
                            <% } %>
                        </td>
                    </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>

            <!-- Back Button -->
            <div class="text-center mt-3">
                <a href="adminDashboard.jsp" class="btn btn-secondary">
                    <i class="fa-solid fa-arrow-left"></i> Back to Dashboard
                </a>
            </div>

        </div>
    </div>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
