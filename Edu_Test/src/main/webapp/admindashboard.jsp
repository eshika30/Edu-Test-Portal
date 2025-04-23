<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduTest Admin Dashboard</title>
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
        }

        .sidebar h3 {
            text-align: center;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .sidebar a {
            display: block;
            padding: 15px 20px;
            color: white;
            text-decoration: none;
            font-size: 16px;
            transition: 0.3s;
        }

        .sidebar a:hover {
            background: rgba(255, 255, 255, 0.2);
            padding-left: 25px;
        }

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
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .card {
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
            transition: 0.3s;
        }

        .card:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body>

    <div class="sidebar">
        <h3>Admin Dashboard</h3>
        <a href="admindashboard.jsp">Dashboard</a>
        <a href="user_management.jsp">User Management</a>
        <a href="exam_management.jsp">Exam Creation & Scheduling</a>
        <a href="question_bank.jsp">Question Bank Management</a>
        <a href="randomized_tests.jsp">Randomized Question Selection</a>
        <a href="result_analysis.jsp">Result Analysis & Reports</a>
        <a href="login.jsp">Logout</a>
    </div>

    <div class="content">
        <div class="header">Welcome to EduTest Admin Panel</div>
        
        <div class="card-container">
            <div class="card">
                <h3>User Management</h3>
                <p>Add, edit, and remove students.</p>
            </div>
            
            <div class="card">
                <h3>Exam Creation & Scheduling</h3>
                <p>Set up tests, define total marks, and schedule exams.</p>
            </div>
            
            <div class="card">
                <h3>Question Bank Management</h3>
                <p>Store, categorize, and select questions from a database.</p>
            </div>
            
            <div class="card">
                <h3>Randomized Question Selection</h3>
                <p>Auto-generate tests with random questions.</p>
            </div>
            
            <div class="card">
                <h3>Result Analysis & Reports</h3>
                <p>View test submissions, evaluate performance, and declare results.</p>
            </div>
        </div>
    </div>

</body>
</html>
