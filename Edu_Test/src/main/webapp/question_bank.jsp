<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduTest - Question Bank Management</title>
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

        /* Form Styling */
        input, select, button {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        button {
            background: #1e88e5;
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            background: #1565c0;
        }

        /* Table */
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background: #1e88e5;
            color: white;
        }

        tr:hover {
            background: #f1f1f1;
        }

        a.delete-btn {
            background: #ff4d4d;
            color: white;
            padding: 8px 12px;
            text-decoration: none;
            border-radius: 5px;
            transition: 0.3s;
        }

        a.delete-btn:hover {
            background: #d32f2f;
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
        <h3>Admin Panel</h3>
        <a href="admindashboard.jsp">Dashboard</a>
        <a href="question_bank.jsp">Question Bank</a>
        <a href="categorize_questions.jsp">Categorize & Assign Questions</a>
        <a href="login.jsp">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="content">
        <div class="header">Question Bank Management</div>

        <div class="card">
            <h3>Add New Question</h3>
            <form action="QuestionBankServlet" method="post">
                <input type="text" name="question" placeholder="Enter question" required>
                <input type="text" name="optionA" placeholder="Option A" required>
                <input type="text" name="optionB" placeholder="Option B" required>
                <input type="text" name="optionC" placeholder="Option C" required>
                <input type="text" name="optionD" placeholder="Option D" required>
                <input type="text" name="answer" placeholder="Correct Answer (A/B/C/D)" required>
                <select name="category" required>
                    <option value="OS">OS</option>
                    <option value="DBMS">DBMS</option>
                    <option value="AIML">AIML</option>
                    <option value="DS">DS</option>
                    <option value="CPP">CPP</option>
                </select>
                <button type="submit">Add Question</button>
            </form>
        </div>

        <div class="card">
            <h3>Existing Questions</h3>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Question</th>
                    <th>Category</th>
                    <th>Correct Answer</th>
                    <th>Action</th>
                </tr>
                <% 
                // Database connection
                Class.forName("com.mysql.cj.jdbc.Driver");    
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutestdata", "root", "Eshu@3002");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM questions");

                while (rs.next()) { 
                %>
                <tr>
                    <td><%= rs.getInt("qid") %></td>
                    <td><%= rs.getString("que") %></td>
                    <td><%= rs.getString("category") %></td>
                    <td><strong><%= rs.getString("ans_opt") %></strong></td>
                    <td>
                        <a class="delete-btn" href="DeleteQuestionServlet?qid=<%= rs.getInt("qid") %>">Delete</a>
                    </td>
                </tr>
                <% } con.close(); %>
            </table>
        </div>
    </div>

</body>
</html>
