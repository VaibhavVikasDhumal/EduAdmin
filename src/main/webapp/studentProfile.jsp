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
    <title>Student Profile | EduAdmin</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background: #f4f6f9;
            font-family: "Segoe UI", sans-serif;
        }

        .profile-header {
            background: linear-gradient(135deg, #0d6efd, #6ea8fe);
            color: white;
            padding: 20px;
            border-radius: 12px;
            text-align: center;
        }

        .profile-card {
            border-radius: 15px;
        }

        .form-control, .form-select {
            border-radius: 10px;
            padding: 11px 14px;
        }

        .form-control:focus, .form-select:focus {
            box-shadow: 0 0 0 0.2rem rgba(13,110,253,.25);
            border-color: #0d6efd;
        }
    </style>
</head>

<body>

<div class="container mt-4 col-md-5 col-sm-11">

    <!-- Header -->
    <div class="profile-header mb-4">
        <h4>
            <i class="fa-solid fa-user-graduate me-2"></i>
            Student Profile
        </h4>
        <p class="mb-0">Update your personal academic details</p>
    </div>

    <!-- Profile Form -->
    <div class="card shadow profile-card">
        <div class="card-body p-4">

            <!-- Optional Message -->
            <% if(request.getAttribute("msg") != null) { %>
                <div class="alert alert-info text-center">
                    <%= request.getAttribute("msg") %>
                </div>
            <% } %>

            <form action="updateStudentProfile" method="post">

                <!-- DOB -->
                <div class="mb-3">
                    <label class="form-label">Date of Birth</label>
                    <div class="input-group">
                        <span class="input-group-text">
                            <i class="fa-solid fa-calendar"></i>
                        </span>
                        <input type="date"
                               name="dob"
                               class="form-control"
                               required>
                    </div>
                </div>

                <!-- Standard -->
                <div class="mb-4">
                    <label class="form-label">Standard</label>
                    <select name="standard" class="form-select" required>
                        <option value="">Select</option>
                        <option>FE</option>
                        <option>SE</option>
                        <option>TE</option>
                        <option>BE</option>
                    </select>
                </div>

                <!-- Button -->
                <button class="btn btn-primary w-100">
                    <i class="fa-solid fa-floppy-disk"></i> Save Profile
                </button>
            </form>
        </div>

        <!-- Footer -->
        <div class="card-footer text-center bg-white">
            <a href="studentDashboard.jsp" class="btn btn-secondary btn-sm">
                <i class="fa-solid fa-arrow-left"></i> Back to Dashboard
            </a>
        </div>
    </div>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
