<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
HttpSession s = request.getSession(false);
if (s == null || !"ACCOUNTANT".equals(s.getAttribute("role"))) {
    response.sendRedirect("login.jsp");
    return;
}

String email = (String) request.getAttribute("email");
Integer totalFee = (Integer) request.getAttribute("totalFee");
Integer paidFee = (Integer) request.getAttribute("paidFee");
Integer remainingFee = (Integer) request.getAttribute("remainingFee");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Pay Fee | EduAdmin</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

    <script>
        function validatePayment() {
            let amount = document.getElementById("amount").value;
            let remaining = document.getElementById("remainingFee").value;

            if (parseInt(amount) > parseInt(remaining)) {
                alert("Amount cannot be greater than remaining fee!");
                return false;
            }
            return true;
        }
    </script>

    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #667eea, #764ba2);
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: "Segoe UI", sans-serif;
        }

        .fee-card {
            border-radius: 16px;
            animation: fadeIn 0.6s ease-in-out;
        }

        .card-header {
            background: linear-gradient(135deg, #28a745, #20c997);
            color: white;
            text-align: center;
            font-weight: 600;
            font-size: 18px;
        }

        .form-control {
            border-radius: 10px;
            padding: 11px 14px;
        }

        .form-control:focus {
            box-shadow: 0 0 0 0.2rem rgba(40,167,69,.25);
            border-color: #28a745;
        }

        .btn-load {
            border-radius: 10px;
            font-weight: 600;
        }

        .btn-pay {
            background: #28a745;
            border: none;
            border-radius: 10px;
            font-weight: 600;
            padding: 10px;
        }

        .btn-pay:hover {
            background: #218838;
        }

        .fee-box p {
            margin-bottom: 6px;
            font-size: 15px;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>

<div class="container col-md-6 col-sm-11">
    <div class="card shadow-lg fee-card">

        <!-- Header -->
        <div class="card-header">
            <i class="fa-solid fa-indian-rupee-sign me-2"></i>
            Pay Student Fee
        </div>

        <!-- Body -->
        <div class="card-body p-4">

            <!-- Load Fee Details -->
            <form action="fetchStudentFee" method="get" class="mb-4">
                <label class="form-label">Student Email</label>
                <div class="input-group mb-2">
                    <span class="input-group-text">
                        <i class="fa-solid fa-envelope"></i>
                    </span>
                    <input type="email"
                           name="email"
                           class="form-control"
                           value="<%= email != null ? email : "" %>"
                           required>
                </div>
                <button class="btn btn-primary btn-load w-100">
                    <i class="fa-solid fa-magnifying-glass"></i> Load Fee Details
                </button>
            </form>

            <% if (totalFee != null) { %>

            <!-- Fee Summary -->
            <div class="alert alert-info fee-box">
                <p><b>Total Fee:</b> ₹ <%= totalFee %></p>
                <p><b>Paid Fee:</b> ₹ <%= paidFee %></p>
                <p><b>Remaining Fee:</b> ₹ <%= remainingFee %></p>
            </div>

            <!-- Pay Fee -->
            <form action="payFee" method="post" onsubmit="return validatePayment();">
                <input type="hidden" name="email" value="<%= email %>">
                <input type="hidden" id="remainingFee" value="<%= remainingFee %>">

                <label class="form-label">Pay Amount</label>
                <div class="input-group mb-3">
                    <span class="input-group-text">
                        <i class="fa-solid fa-indian-rupee-sign"></i>
                    </span>
                    <input type="number"
                           id="amount"
                           name="amount"
                           class="form-control"
                           required>
                </div>

                <button class="btn btn-pay w-100">
                    <i class="fa-solid fa-credit-card"></i> Pay Fee
                </button>
            </form>

            <% } %>

        </div>

        <!-- Footer -->
        <div class="card-footer text-center bg-white">
            <a href="accountantDashboard.jsp" class="text-decoration-none">
                <i class="fa-solid fa-arrow-left"></i> Back to Dashboard
            </a>
        </div>

    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
