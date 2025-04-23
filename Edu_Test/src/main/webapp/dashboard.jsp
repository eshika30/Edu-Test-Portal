<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduTest Portal - Dashboard</title>
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
        <h3>EduTest Dashboard</h3>
        <a href="homepage.jsp">Home</a>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="mocktest.jsp">Mock Tests</a>
        <a href="technicaltest.jsp">Technical Tests</a>
        <a href="myresult.jsp">My Result</a>
        <a href="login.jsp">Logout</a>
    </div>

    <div class="content">
        <div class="header">Welcome to EduTest Portal</div>
        
        <div class="card-container">
            <div class="card">
                <h3>Subjects for Test</h3>
                <p>1. Operating System</p>
                <p>2. Data Structures</p>
                <p>3. Java</p>
                <p>4. AI/ML</p>
                <p>5. DBMS</p>
            </div>
            
            <div class="card">
                <h3>Test Analysis</h3>
                <p>Operating System: 40%</p>
                <p>Data Structures: 65%</p>
                <p>Java: 86%</p>
                <p>AI/ML: 43%</p>
                <p>DBMS: 88%</p>
            </div>
        </div>
    </div>

</body>
</html>
