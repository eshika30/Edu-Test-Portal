<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exam Management</title>
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

        .form-container {
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
            width: 50%;
            margin: auto;
            text-align: center;
        }

        input, button {
            padding: 12px;
            margin: 8px 0;
            width: 100%;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        button {
            background: #1e88e5;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: 0.3s;
        }

        button:hover {
            background: #1565c0;
        }

        .table-container {
            margin-top: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 12px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background: #1e88e5;
            color: white;
            font-weight: 600;
        }
    </style>
</head>
<body>

    <div class="sidebar">
        <h3>EduTest Dashboard</h3>
        <a href="admindashboard.jsp">Dashboard</a>
        <a href="user_management.jsp">User Management</a>
        <a href="exam_management.jsp">Exam Creation & Scheduling</a>
        <a href="question_bank.jsp">Question Bank Management</a>
        <a href="randomized_tests.jsp">Randomized Question Selection</a>
        <a href="result_analysis.jsp">Result Analysis & Reports</a>
        <a href="login.jsp">Logout</a>
    </div>

    <div class="content">
        <div class="header">Exam Management</div>

        <div class="form-container">
            <h3>Add New Exam</h3>
            <form action="ExamServlet" method="post">
                <input type="text" name="exam_name" placeholder="Exam Name" required>
                <input type="date" name="exam_date" required>
                <input type="time" name="exam_time" required>
                <input type="number" name="duration" placeholder="Duration (mins)" required>
                <input type="number" name="total_marks" placeholder="Total Marks" required>
                <button type="submit" name="action" value="add">Add Exam</button>
            </form>
        </div>

        <div class="table-container">
            <h3>Scheduled Exams</h3>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Duration</th>
                    <th>Total Marks</th>
                    <th>Actions</th>
                </tr>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutestdata", "root", "Ayushi13");
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM exams");

                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("exam_id") %></td>
                    <td><%= rs.getString("exam_name") %></td>
                    <td><%= rs.getString("exam_date") %></td>
                    <td><%= rs.getString("exam_time") %></td>
                    <td><%= rs.getInt("duration") %> mins</td>
                    <td><%= rs.getInt("total_marks") %></td>
                    <td>
                        <form action="ExamServlet" method="post" style="display:inline;">
                            <input type="hidden" name="exam_id" value="<%= rs.getInt("exam_id") %>">
                            <button type="submit" name="action" value="delete" class="delete-btn">Delete</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
        </div>
    </div>
</body>
</html>
