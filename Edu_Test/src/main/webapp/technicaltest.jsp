<%@page import="java.util.HashMap"%>
<%@ page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="true"%>

<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduTest - Technical Tests</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
            display: flex;
        }

        /* Sidebar */
        .sidebar {
            width: 260px;
            height: 100vh;
            background: linear-gradient(135deg, #6db3f2, #1e88e5);
            color: white;
            position: fixed;
            top: 0;
            left: 0;
            padding-top: 20px;
            box-shadow: 4px 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .sidebar h3 {
            margin-bottom: 20px;
            font-weight: 600;
        }

        .sidebar a {
            display: block;
            padding: 15px;
            color: white;
            text-decoration: none;
            font-size: 16px;
            transition: 0.3s;
        }

        .sidebar a:hover {
            background: rgba(255, 255, 255, 0.2);
            padding-left: 25px;
        }

        /* Content */
        .content {
            margin-left: 260px;
            padding: 40px;
            width: calc(100% - 260px);
        }

        .header {
            background: white;
            padding: 20px;
            text-align: center;
            font-size: 22px;
            font-weight: 600;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }

        .card {
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
            text-align: center;
        }

        .card:hover {
            transform: scale(1.03);
        }

        .card h3 {
            color: #1e88e5;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 14px;
            color: #555;
            margin-bottom: 15px;
        }

        .btn {
            padding: 12px;
            background: #1e88e5;
            color: white;
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
            border-radius: 6px;
            display: inline-block;
            transition: 0.3s;
        }

        .btn:hover {
            background: #1565c0;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }

            .content {
                margin-left: 0;
                width: 100%;
                padding: 20px;
            }

            .card-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h3>Welcome, User</h3>
        <a href="homepage.jsp">Home</a> 
        <a href="dashboard.jsp">Dashboard</a>
        <a href="mocktest.jsp">Mock Tests</a> 
        <a href="technicaltest.jsp">Technical Tests</a> 
        <a href="myresult.jsp">My Results</a> 
        <a href="login.jsp">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="content">
        <div class="header">Technical Tests</div>

        <div class="card-container">
            <%
                String[][] exams = {
                    {"Operating System", "os.jsp", "Test your knowledge of OS concepts."},
                    {"Data Structures", "ds.jsp", "Evaluate arrays, linked lists, trees, and graphs."},
                    {"C++ Programming", "cpp.jsp", "Assess OOP concepts and C++ fundamentals."},
                    {"AI/ML", "aiml.jsp", "Check your fundamental AI and ML knowledge."},
                    {"DBMS", "dbms.jsp", "Test SQL, normalization, and database concepts."}
                };

                for (String[] exam : exams) {
                    String examName = exam[0];
                    String examPage = exam[1];
                    String examDesc = exam[2];
            %>

            <div class="card">
                <h3><%= examName %></h3>
                <p><%= examDesc %></p>
                <a href="<%= examPage %>" class="btn">Start Test</a>
            </div>

            <% } %>
        </div>

    </div>
</body>
</html>
