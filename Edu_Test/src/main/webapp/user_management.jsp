<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List, com.edutest.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduTest - User Management</title>
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

        .form-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .form-container input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
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
            border: none;
            cursor: pointer;
        }

        .btn:hover {
            background: #1565c0;
        }

        .btn-danger {
            background: #d9534f;
        }

        .btn-danger:hover {
            background: #c9302c;
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background: #1e88e5;
            color: white;
        }

        tr:hover {
            background-color: #f5f5f5;
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

            table {
                display: block;
                overflow-x: auto;
                white-space: nowrap;
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
        <div class="header">User Management</div>

        <!-- Add User Form -->
        <div class="form-container">
            <h3>Add New User</h3>
            <form action="UserServlet" method="post">
                <input type="hidden" name="action" value="add"> 
                <input type="text" name="name" placeholder="Name" required> 
                <input type="email" name="email" placeholder="Email" required> 
                <input type="text" name="mobile" placeholder="Mobile" required> 
                <input type="password" name="password" placeholder="Password" required>
                <button type="submit" class="btn">Add User</button>
            </form>
        </div>

        <!-- User List -->
        <h3>User List</h3>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="user" items="${userList}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.email}</td>
                    <td>${user.mobile}</td>
                    <td>
                        <form action="UserServlet" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="edit"> 
                            <input type="hidden" name="id" value="${user.id}"> 
                            <input type="text" name="name" value="${user.name}" required> 
                            <input type="email" name="email" value="${user.email}" required>
                            <input type="text" name="mobile" value="${user.mobile}" required>
                            <button type="submit" class="btn">Edit</button>
                        </form> 

                        <form action="UserServlet" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="delete"> 
                            <input type="hidden" name="id" value="${user.id}">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

</body>
</html>
