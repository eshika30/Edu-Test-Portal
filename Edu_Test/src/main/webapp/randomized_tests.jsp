<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduTest - Randomized Tests</title>
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

        /* Card */
        .card {
            background: white;
            padding: 25px;
            margin-bottom: 20px;
            border-radius: 12px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
        }

        .card:hover {
            transform: scale(1.03);
        }

        .card h3 {
            color: #1e88e5;
        }

        /* Iframe Styling */
        iframe {
            width: 100%;
            height: 500px;
            border: none;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
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
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h3>Welcome, Admin</h3>
        <a href="admindashboard.jsp">Dashboard</a>
        <a href="user_management.jsp">User Management</a>
        <a href="exam_management.jsp">Exam Creation & Scheduling</a>
        <a href="question_bank.jsp">Question Bank Management</a>
        <a href="randomized_tests.jsp">Randomized Question Selection</a>
        <a href="result_analysis.jsp">Result Analysis & Reports</a>
        <a href="login.jsp">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="content">
        <div class="header">Randomized Question Selection</div>

        <div class="card">
            <h3>View 10 Random Questions</h3>
            <iframe src="RandomQuestionsServlet"></iframe>
        </div>
    </div>

</body>
</html>
