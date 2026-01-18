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
    <title>Add / Update Marks | EduAdmin</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background: #f4f6f9;
            font-family: "Segoe UI", sans-serif;
        }

        .marks-header {
            background: linear-gradient(135deg, #198754, #20c997);
            color: white;
            padding: 20px;
            border-radius: 12px;
            text-align: center;
        }

        .marks-card {
            border-radius: 15px;
        }

        .form-control, .form-select {
            border-radius: 10px;
            padding: 11px 14px;
        }

        .form-control:focus, .form-select:focus {
            box-shadow: 0 0 0 0.2rem rgba(25,135,84,.25);
            border-color: #198754;
        }
    </style>
</head>

<body>

<div class="container mt-4 col-md-5 col-sm-11">

    <!-- Header -->
    <div class="marks-header mb-4">
        <h4>
            <i class="fa-solid fa-pen-to-square me-2"></i>
            Add / Update Marks
        </h4>
        <p class="mb-0">Enter or modify student subject-wise marks</p>
    </div>

    <!-- Form Card -->
    <div class="card shadow marks-card">
        <div class="card-body p-4">

            <!-- Optional Message -->
            <% if(request.getAttribute("msg") != null) { %>
                <div class="alert alert-info text-center">
                    <%= request.getAttribute("msg") %>
                </div>
            <% } %>

            <form action="addMarks" method="post">

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
                               placeholder="student@example.com"
                               required>
                    </div>
                </div>

                <!-- Subject -->
                <div class="mb-3">
                    <label class="form-label">Subject</label>
                    <select name="subject"
                            class="form-select"
                            size="4"
                            required>
                        <option value="Mathematics">Mathematics</option>
                        <option value="Physics">Physics</option>
                        <option value="Chemistry">Chemistry</option>
                        <option value="Computer Science">Computer Science</option>
                    </select>
                    <small class="text-muted">
                        Selecting the same subject again will update marks
                    </small>
                </div>

                <!-- Marks -->
                <div class="mb-4">
                    <label class="form-label">Marks</label>
                    <div class="input-group">
                        <span class="input-group-text">
                            <i class="fa-solid fa-chart-line"></i>
                        </span>
                        <input type="number"
                               name="marks"
                               class="form-control"
                               min="0"
                               max="100"
                               placeholder="Enter marks (0 - 100)"
                               required>
                    </div>
                </div>

                <!-- Button -->
                <button type="submit" class="btn btn-success w-100">
                    <i class="fa-solid fa-floppy-disk"></i> Save Marks
                </button>

            </form>
        </div>

        <!-- Footer -->
        <div class="card-footer text-center bg-white">
            <a href="staffDashboard.jsp" class="btn btn-secondary btn-sm">
                <i class="fa-solid fa-arrow-left"></i> Back to Dashboard
            </a>
        </div>
    </div>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
