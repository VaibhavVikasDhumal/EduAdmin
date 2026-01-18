<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>EduAdmin | Login</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

    <style>
        body {
            min-height: 100vh;
            background: 
                linear-gradient(rgba(0,0,0,0.55), rgba(0,0,0,0.55)),
                url("https://images.unsplash.com/photo-1524995997946-a1c2e315a42f");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: "Segoe UI", sans-serif;
        }

        .login-card {
            border-radius: 16px;
            overflow: hidden;
            backdrop-filter: blur(12px);
            background: rgba(255, 255, 255, 0.92);
            animation: fadeIn 0.7s ease-in-out;
        }

        .login-header {
            background: linear-gradient(135deg, #4e54c8, #6c63ff);
            color: white;
            padding: 25px;
            text-align: center;
        }

        .login-header h4 {
            margin: 0;
            font-weight: 600;
        }

        .form-control {
            border-radius: 10px;
            padding: 11px 15px;
        }

        .form-control:focus {
            box-shadow: 0 0 0 0.2rem rgba(78,84,200,.25);
            border-color: #4e54c8;
        }

        .input-group-text {
            background: #f1f1f1;
            border-radius: 10px 0 0 10px;
        }

        .btn-login {
            background: #4e54c8;
            border: none;
            border-radius: 10px;
            font-weight: 600;
            padding: 10px;
            transition: all 0.3s ease;
        }

        .btn-login:hover {
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

        .footer-text {
            font-size: 13px;
            color: #777;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>

<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-4 col-sm-10">
            <div class="card shadow-lg login-card">

                <!-- Header -->
                <div class="login-header">
                    <i class="fa-solid fa-graduation-cap fa-2x mb-2"></i>
                    <h4>EduAdmin Login</h4>
                    <small>Student Management System</small>
                </div>

                <!-- Body -->
                <div class="card-body p-4">

                    <!-- Optional Message Area -->
                    <% if(request.getAttribute("msg") != null) { %>
                        <div class="alert alert-danger text-center">
                            <%= request.getAttribute("msg") %>
                        </div>
                    <% } %>

                    <form action="login" method="post">

                        <!-- Email -->
                        <div class="mb-3">
                            <label class="form-label">Email Address</label>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fa-solid fa-envelope"></i>
                                </span>
                                <input type="email" name="email"
                                       class="form-control"
                                       placeholder="Enter email" required>
                            </div>
                        </div>

                        <!-- Password -->
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fa-solid fa-lock"></i>
                                </span>
                                <input type="password" name="password" id="password"
                                       class="form-control"
                                       placeholder="Enter password" required>
                                <span class="input-group-text" style="cursor:pointer;"
                                      onclick="togglePassword()">
                                    <i class="fa-solid fa-eye" id="eyeIcon"></i>
                                </span>
                            </div>
                        </div>

                        <!-- Button -->
                        <button class="btn btn-login w-100 mt-3">
                            <i class="fa-solid fa-right-to-bracket"></i> Login
                        </button>

                    </form>
                </div>

                <!-- Footer -->
                <div class="card-footer text-center bg-white">
                    New User? <a href="register.jsp">Register Here</a>
                    <div class="footer-text mt-2">
                        © 2026 EduAdmin ERP
                    </div>
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
