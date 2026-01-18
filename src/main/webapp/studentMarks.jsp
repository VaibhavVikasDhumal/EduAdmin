<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.eduadmin.dao.MarksDao" %>

<%
HttpSession s = request.getSession(false);
if (s == null || !"STUDENT".equals(s.getAttribute("role"))) {
    response.sendRedirect("login.jsp");
    return;
}

String email = (String) s.getAttribute("email");

MarksDao dao = new MarksDao();
Map<String, Integer> marksMap = dao.getMarksByStudent(email);

// Fixed subject list
String[] subjects = {
    "Mathematics",
    "Physics",
    "Chemistry",
    "Computer Science"
};
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Marks | EduAdmin</title>

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
            background: linear-gradient(135deg, #0dcaf0, #6edff6);
            color: white;
            padding: 20px;
            border-radius: 12px;
        }

        .marks-card {
            border-radius: 15px;
        }
    </style>
</head>

<body>

<div class="container mt-4 col-md-6 col-sm-11">

    <!-- Header -->
    <div class="marks-header mb-4">
        <h4>
            <i class="fa-solid fa-chart-column me-2"></i>
            Marks Report
        </h4>
        <p class="mb-0">Subject-wise marks overview</p>
    </div>

    <!-- Marks Table -->
    <div class="card shadow marks-card">
        <div class="card-body">

            <table class="table table-hover table-bordered text-center align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>Subject</th>
                        <th>Marks</th>
                    </tr>
                </thead>
                <tbody>

                <%
                    for (String subject : subjects) {
                        Integer m = marksMap.get(subject);
                %>
                    <tr>
                        <td><%= subject %></td>
                        <td>
                            <% if (m != null) { %>
                                <span class="badge bg-success fs-6">
                                    <%= m %>
                                </span>
                            <% } else { %>
                                <span class="badge bg-secondary fs-6">
                                    Not Assigned
                                </span>
                            <% } %>
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
