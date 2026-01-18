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
    <title>Set Fee Structure | EduAdmin</title>

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

        .fee-card {
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

<div class="container mt-4 col-md-6 col-sm-11">

    <!-- Header -->
    <div class="admin-header mb-4">
        <h4>
            <i class="fa-solid fa-coins me-2"></i>
            Set Fee Structure
        </h4>
        <p class="mb-0">Define or update fee structure for each standard</p>
    </div>

    <!-- Fee Structure Form -->
    <div class="card shadow fee-card mx-auto">
        <div class="card-body p-4">

            <!-- Optional Message -->
            <% if(request.getAttribute("msg") != null) { %>
                <div class="alert alert-info text-center">
                    <%= request.getAttribute("msg") %>
                </div>
            <% } %>

            <form action="setFee" method="post">

                <!-- Standard -->
                <div class="mb-3">
                    <label class="form-label">Standard</label>
                    <select name="standard" class="form-select" required>
                        <option value="">Select Standard</option>
                        <option>FE</option>
                        <option>SE</option>
                        <option>TE</option>
                        <option>BE</option>
                    </select>
                </div>

                <!-- Total Fee -->
                <div class="mb-4">
                    <label class="form-label">Total Fee (₹)</label>
                    <div class="input-group">
                        <span class="input-group-text">
                            <i class="fa-solid fa-indian-rupee-sign"></i>
                        </span>
                        <input type="number"
                               name="totalFee"
                               class="form-control"
                               placeholder="Enter total fee amount"
                               required>
                    </div>
                </div>

                <!-- Button -->
                <button class="btn btn-primary w-100">
                    <i class="fa-solid fa-floppy-disk"></i> Save Fee Structure
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
