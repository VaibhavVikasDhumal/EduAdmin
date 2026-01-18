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
    <title>Mark Attendance | EduAdmin</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #667eea, #764ba2);
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: "Segoe UI", sans-serif;
        }

        .attendance-card {
            border-radius: 16px;
            animation: fadeIn 0.6s ease-in-out;
        }

        .card-header {
            background: linear-gradient(135deg, #ffb347, #ffcc33);
            font-weight: 600;
            font-size: 18px;
            text-align: center;
        }

        .form-control, .form-select {
            border-radius: 10px;
            padding: 11px 14px;
        }

        .form-control:focus, .form-select:focus {
            box-shadow: 0 0 0 0.2rem rgba(255,193,7,.35);
            border-color: #ffc107;
        }

        .btn-save {
            background: #ffc107;
            border: none;
            border-radius: 10px;
            font-weight: 600;
            padding: 10px;
        }

        .btn-save:hover {
            background: #e0a800;
        }

        .card-footer a {
            text-decoration: none;
            font-weight: 500;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>

<div class="container col-md-5 col-sm-11">
    <div class="card shadow-lg attendance-card">

        <!-- Header -->
        <div class="card-header">
            <i class="fa-solid fa-calendar-check me-2"></i>
            Mark Student Attendance
        </div>

        <!-- Body -->
        <div class="card-body p-4">

            <!-- Optional Message -->
            <% if(request.getAttribute("msg") != null) { %>
                <div class="alert alert-info text-center">
                    <%= request.getAttribute("msg") %>
                </div>
            <% } %>

            <form action="markAttendance" method="post">

                <!-- Student Email -->
                <div class="mb-3">
                    <label class="form-label">Student Email</label>
                    <div class="input-group">
                        <span class="input-group-text">
                            <i class="fa-solid fa-envelope"></i>
                        </span>
                        <input type="email"
                               name="studentEmail"
                               class="form-control"
                               placeholder="student@email.com"
                               required>
                    </div>
                </div>

                <!-- Date -->
                <div class="mb-3">
                    <label class="form-label">Date</label>
                    <div class="input-group">
                        <span class="input-group-text">
                            <i class="fa-solid fa-calendar"></i>
                        </span>
                        <input type="date"
                               name="date"
                               class="form-control"
                               required>
                    </div>
                </div>

                <!-- Status -->
                <div class="mb-4">
                    <label class="form-label">Attendance Status</label>
                    <select name="status" class="form-select">
                        <option value="Present">Present</option>
                        <option value="Absent">Absent</option>
                    </select>
                </div>

                <!-- Button -->
                <button class="btn btn-save w-100">
                    <i class="fa-solid fa-floppy-disk"></i> Save Attendance
                </button>

            </form>
        </div>

        <!-- Footer -->
        <div class="card-footer text-center bg-white">
            <a href="staffDashboard.jsp">
                <i class="fa-solid fa-arrow-left"></i> Back to Dashboard
            </a>
        </div>

    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
