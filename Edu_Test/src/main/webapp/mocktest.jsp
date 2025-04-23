<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduTest Portal - Mock Test</title>
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
            text-align: center;
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

        .card {
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
            width: 400px;
            margin: auto;
            text-align: center;
        }

        .submit-btn {
            margin-top: 20px;
            padding: 12px 20px;
            font-size: 16px;
            color: white;
            background-color: #1e88e5;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            transition: 0.3s;
        }

        .submit-btn:hover {
            background-color: #1669bb;
        }

        select {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h3>EduTest Portal</h3>
        <a href="homepage.jsp">Home</a> 
        <a href="dashboard.jsp">Dashboard</a>
        <a href="mocktest.jsp">Mock Tests</a> 
        <a href="technicaltest.jsp">Technical Tests</a> 
        <a href="myresult.jsp">My Result</a> 
        <a href="login.jsp">Logout</a>
    </div>

    <div class="content">
        <div class="header">Mock Test Selection</div>
        <div class="card">
            <h2>Select a Subject for the Mock Test</h2>
            <form action="startmocktest.jsp" method="GET">
                <label for="subject">Choose a subject:</label>
                <select id="subject" name="category" required>
                    <option value="os">Operating System</option>
                    <option value="ds">Data Structures</option>
                    <option value="cpp">C++</option>
                    <option value="aiml">AI/ML</option>
                    <option value="dbms">DBMS</option>
                </select>
                <br><br>
                <button type="submit" class="submit-btn">Start Test</button>
            </form>
        </div>
    </div>
</body>
</html>
