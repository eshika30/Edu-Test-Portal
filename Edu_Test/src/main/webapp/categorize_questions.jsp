<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Question Categorization & Assignment</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: url('imgs/background.jpg') no-repeat center center/cover;
            display: flex;
        }

        /* Navbar */
        .navbar {
            width: 100%;
            background: linear-gradient(135deg, #6db3f2, #1e88e5);
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 22px;
            font-weight: 600;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
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
        
        

        /* Content Section */
        .content {
            margin-left: 280px;
            padding: 80px 20px 20px;
            width: calc(100% - 280px);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h2 {
            color: #1e88e5;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .card {
            width: 90%;
            max-width: 800px;
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
            overflow-x: auto;
        }

        /* Form Inputs */
        label {
            font-size: 16px;
            font-weight: 500;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            margin-bottom: 15px;
            font-size: 16px;
        }

        /* Table */
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            margin-top: 10px;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        th {
            background: linear-gradient(135deg, #6db3f2, #1e88e5);
            color: white;
            font-size: 16px;
        }

        tr:hover {
            background: #f0f8ff;
        }

        /* Assign Button */
        .assign-btn {
            width: 100%;
            background: linear-gradient(135deg, #6db3f2, #1e88e5);
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            cursor: pointer;
            transition: 0.3s;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            margin-top: 15px;
        }

        .assign-btn:hover {
            background: linear-gradient(135deg, #1e88e5, #1565c0);
            transform: scale(1.05);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
            }
            .content {
                margin-left: 220px;
            }
        }

        @media (max-width: 600px) {
            .sidebar {
                width: 180px;
            }
            .content {
                margin-left: 200px;
                padding: 80px 10px;
            }
            .card {
                width: 95%;
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

    <div class="content">
        <h2>Categorize & Assign Questions</h2>
        <div class="card">
            <form action="AssignTestServlet" method="post">
                <label for="test_id">Test ID:</label>
                <input type="text" name="test_id" required>
                
                <table>
                    <tr>
                        <th>Select</th>
                        <th>Question</th>
                        <th>Option A</th>
                        <th>Option B</th>
                        <th>Option C</th>
                        <th>Option D</th>
                        <th>Answer</th>
                        <th>Category</th>
                    </tr>
                    
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutestdata", "root", "Eshu@3002");
                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT * FROM questions ORDER BY category");

                            while (rs.next()) {
                    %>
                        <tr>
                            <td><input type="checkbox" name="selected_questions" value="<%= rs.getInt("qid") %>"></td>
                            <td><%= rs.getString("que") %></td>
                            <td><%= rs.getString("opt_a") %></td>
                            <td><%= rs.getString("opt_b") %></td>
                            <td><%= rs.getString("opt_c") %></td>
                            <td><%= rs.getString("opt_d") %></td>
                            <td><%= rs.getString("ans_opt") %></td>
                            <td><%= rs.getString("category") %></td>
                        </tr>
                    <%
                            }
                            con.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </table>

                <button type="submit" class="assign-btn">Assign Selected Questions to Test</button>
            </form>
        </div>
    </div>

</body>
</html>
