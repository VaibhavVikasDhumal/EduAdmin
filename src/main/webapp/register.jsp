<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register | EduAdmin</title>

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

        .register-card {
            border-radius: 16px;
            animation: fadeIn 0.7s ease-in-out;
        }

        .card-header {
            background: linear-gradient(135deg, #4e54c8, #6c63ff);
            color: white;
            text-align: center;
            padding: 20px;
        }

        .form-control, .form-select {
            border-radius: 10px;
            padding: 11px 15px;
        }

        .form-control:focus, .form-select:focus {
            box-shadow: 0 0 0 0.2rem rgba(78,84,200,.25);
            border-color: #4e54c8;
        }

        .input-group-text {
            background: #f1f1f1;
            border-radius: 10px 0 0 10px;
        }

        .btn-register {
            background: #4e54c8;
            border: none;
            border-radius: 10px;
            font-weight: 600;
            padding: 10px;
            transition: 0.3s ease;
        }

        .btn-register:hover {
            background: #3b40a4;
            transform: translateY(-1px);
        }

        .card-footer a {
            text-decoration: none;
            font-weight: 500;
            color: #4e54c8;
        }

        .card-footer a:hover {
            text-decoration: underline;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-5 col-sm-10">

            <div class="card shadow-lg register-card">

                <!-- Header -->
                <div class="card-header">
                    <i class="fa-solid fa-user-plus fa-2x mb-2"></i>
                    <h4>New User Registration</h4>
                    <small>EduAdmin Student Management System</small>
                </div>

                <!-- Body -->
                <div class="card-body p-4">

                    <!-- Optional Message (Safe JSP) -->
                    <% if(request.getAttribute("msg") != null) { %>
                        <div class="alert alert-info text-center">
                            <%= request.getAttribute("msg") %>
                        </div>
                    <% } %>

                    <!-- SAME RegisterServlet -->
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
                                       placeholder="Enter full name"
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
                                       placeholder="example@email.com"
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
                                       placeholder="Enter password"
                                       required>
                                <span class="input-group-text" style="cursor:pointer"
                                      onclick="togglePassword()">
                                    <i class="fa-solid fa-eye" id="eyeIcon"></i>
                                </span>
                            </div>
                        </div>

                        <!-- Role -->
                        <div class="mb-3">
                            <label class="form-label">Role</label>
                            <select name="role" class="form-select" required>
                                <option value="">Select Role</option>
                                <option value="STUDENT">Student</option>
                                <option value="STAFF">Staff</option>
                                <option value="ACCOUNTANT">Accountant</option>
                            </select>
                        </div>

                        <!-- Button -->
                        <button type="submit" class="btn btn-register w-100 mt-3">
                            <i class="fa-solid fa-user-check"></i> Register
                        </button>

                    </form>
                </div>

                <!-- Footer -->
                <div class="card-footer text-center bg-white">
                    Already registered?
                    <a href="login.jsp">Login here</a>
                </div>

            </div>

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
