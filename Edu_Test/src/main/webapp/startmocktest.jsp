<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduTest - Mock Test</title>
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

        .container {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
        }

        .container:hover {
            transform: scale(1.02);
        }

        .question {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .options label {
            display: block;
            padding: 8px;
            font-size: 16px;
            cursor: pointer;
            background: #f4f4f4;
            border-radius: 5px;
            margin: 5px 0;
            transition: 0.3s;
        }

        .options label:hover {
            background: #e1e1e1;
        }

        .submit-btn, .dashboard-btn {
            display: block;
            width: 100%;
            margin-top: 20px;
            padding: 12px;
            font-size: 16px;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 8px;
            text-align: center;
            text-decoration: none;
            transition: 0.3s;
        }

        .submit-btn {
            background-color: #28a745;
        }

        .submit-btn:hover {
            background-color: #218838;
        }

        .dashboard-btn {
            background-color: #007BFF;
        }

        .dashboard-btn:hover {
            background-color: #0056b3;
        }

        .result {
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px;
            color: #333;
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
    <script>
        function calculateScore(event) {
            event.preventDefault();

            let totalQuestions = parseInt(document.getElementById("total_questions").value);
            let score = 0;

            for (let i = 0; i < totalQuestions; i++) {
                let selectedOption = document.querySelector('input[name="q' + i + '"]:checked');
                let correctOption = document.getElementById("correct" + i).value;

                if (selectedOption && selectedOption.value === correctOption) {
                    score++;
                }
            }

            let percentage = (score / totalQuestions) * 100;

            // Display the result
            document.getElementById("scoreDisplay").innerText = "Your Score: " + score + " / " + totalQuestions;
            document.getElementById("percentageDisplay").innerText = "Percentage: " + percentage.toFixed(2) + "%";

            document.getElementById("resultSection").style.display = "block";
        }
    </script>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h3>Welcome, User</h3>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="mocktest.jsp">Take Mock Test</a>
        <a href="myresult.jsp">My Results</a>
        <a href="login.jsp">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="content">
        <div class="header">Mock Test</div>

        <div class="container">
            <%
                String category = request.getParameter("category");
                if (category == null || category.trim().isEmpty()) {
                    out.println("<p style='color:red;'>Invalid Category! Please select a valid category.</p>");
                } else {
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutestdata", "root", "Eshu@3002");

                        String query = "SELECT qid, que, opt_a, opt_b, opt_c, opt_d, ans_opt FROM questions WHERE category = ? ORDER BY RAND() LIMIT 10";
                        PreparedStatement ps = con.prepareStatement(query);
                        ps.setString(1, category);
                        ResultSet rs = ps.executeQuery();

                        int index = 0;
            %>

            <form id="testForm" onsubmit="calculateScore(event)">
                <%
                    while (rs.next()) {
                        String question = rs.getString("que");
                        String optA = rs.getString("opt_a");
                        String optB = rs.getString("opt_b");
                        String optC = rs.getString("opt_c");
                        String optD = rs.getString("opt_d");
                        String correctOption = rs.getString("ans_opt");
                %>
                <div class="question">
                    <p><%= (index + 1) + ". " + question %></p>
                    <div class="options">
                        <label><input type="radio" name="q<%= index %>" value="A"> <%= optA %></label>
                        <label><input type="radio" name="q<%= index %>" value="B"> <%= optB %></label>
                        <label><input type="radio" name="q<%= index %>" value="C"> <%= optC %></label>
                        <label><input type="radio" name="q<%= index %>" value="D"> <%= optD %></label>
                    </div>
                    <input type="hidden" id="correct<%= index %>" value="<%= correctOption %>">
                </div>
                <%
                        index++;
                    }
                    con.close();
                %>
                <input type="hidden" id="total_questions" value="<%= index %>">
                <button type="submit" class="submit-btn">Submit Test</button>
            </form>

            <div id="resultSection" style="display: none;">
                <div class="result">
                    <p id="scoreDisplay"></p>
                    <p id="percentageDisplay"></p>
                </div>
                <a href="dashboard.jsp" class="dashboard-btn">Back to Dashboard</a>
            </div>

            <% } catch (Exception e) { out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>"); } } %>
        </div>
    </div>

</body>
</html>
