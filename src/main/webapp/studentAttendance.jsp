<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.eduadmin.utils.ConnectionProvider" %>

<%
HttpSession s = request.getSession(false);
if (s == null || !"STUDENT".equals(s.getAttribute("role"))) {
    response.sendRedirect("login.jsp");
    return;
}

String email = (String) s.getAttribute("email");
Connection con = ConnectionProvider.getConnection();
PreparedStatement ps = con.prepareStatement(
    "SELECT date, status FROM attendance WHERE email=?"
);
ps.setString(1, email);
ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Attendance | EduAdmin</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background: #f4f6f9;
            font-family: "Segoe UI", sans-serif;
        }

        .page-header {
            background: linear-gradient(135deg, #0d6efd, #6ea8fe);
            color: white;
            padding: 20px;
            border-radius: 12px;
        }

        .attendance-card {
            border-radius: 14px;
        }
    </style>
</head>

<body>

<div class="container mt-4">

    <!-- Header -->
    <div class="page-header mb-4">
        <h4>
            <i class="fa-solid fa-calendar-check me-2"></i>
            My Attendance
        </h4>
        <p class="mb-0">View your attendance records</p>
    </div>

    <!-- Attendance Table -->
    <div class="card shadow attendance-card">
        <div class="card-body">

            <table class="table table-hover table-bordered align-middle text-center">
                <thead class="table-light">
                    <tr>
                        <th>Date</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    boolean hasData = false;
                    while (rs.next()) {
                        hasData = true;
                %>
                    <tr>
                        <td><%= rs.getDate("date") %></td>
                        <td>
                            <% if ("Present".equalsIgnoreCase(rs.getString("status"))) { %>
                                <span class="badge bg-success">
                                    <i class="fa-solid fa-check"></i> Present
                                </span>
                            <% } else { %>
                                <span class="badge bg-danger">
                                    <i class="fa-solid fa-xmark"></i> Absent
                                </span>
                            <% } %>
                        </td>
                    </tr>
                <%
                    }
                    if (!hasData) {
                %>
                    <tr>
                        <td colspan="2" class="text-muted">
                            No attendance records found
                        </td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>

            <div class="text-center mt-3">
                <a href="studentDashboard.jsp" class="btn btn-secondary">
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
