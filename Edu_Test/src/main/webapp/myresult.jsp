<%@ page import="java.sql.*, javax.servlet.http.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduTest - Result Analysis</title>
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

        /* Progress Bar */
        .progress-container {
            width: 100%;
            background-color: #ddd;
            border-radius: 10px;
            margin-top: 10px;
            overflow: hidden;
        }

        .progress-bar {
            height: 22px;
            border-radius: 10px;
            text-align: center;
            color: white;
            font-size: 14px;
            font-weight: bold;
            line-height: 22px;
        }

        .os { background-color: #ff5733; }
        .ds { background-color: #ffcc00; color: #333; }
        .cpp { background-color: #4CAF50; }
        .aiml { background-color: #2196F3; }
        .dbms { background-color: #9C27B0; }

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
    <%
        // Start session and check if the user is logged in
        HttpSession sessionObj = request.getSession(false);
        if (sessionObj == null || sessionObj.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (Integer) sessionObj.getAttribute("userId"); // Fetch user ID from session
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        String[] subjects = {"OS", "DS", "CPP", "AIML", "DBMS"};
        int totalScore = 0, subjectCount = 0;
        int[] scores = new int[subjects.length];

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutestdata", "root", "Eshu@3002");

            // Fetch test scores for the logged-in user
            pst = con.prepareStatement("SELECT category, percent FROM results WHERE user_id = ?");
            pst.setInt(1, userId);
            rs = pst.executeQuery();

            while (rs.next()) {
                String category = rs.getString("category");
                int percent = rs.getInt("percent");

                for (int i = 0; i < subjects.length; i++) {
                    if (subjects[i].equalsIgnoreCase(category)) {
                        scores[i] = percent;
                        break;
                    }
                }
                totalScore += percent;
                subjectCount++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace(); }
            if (pst != null) try { pst.close(); } catch (Exception e) { e.printStackTrace(); }
            if (con != null) try { con.close(); } catch (Exception e) { e.printStackTrace(); }
        }

        double averageScore = subjectCount > 0 ? (double) totalScore / subjectCount : 0;
    %>

    <!-- Sidebar -->
    <div class="sidebar">
        <h3>EduTest Portal</h3>
        <a href="homepage.jsp">Home</a>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="mocktest.jsp">Mock Tests</a>
        <a href="technicaltest.jsp">Technical Tests</a>
        <a href="myresult.jsp">My Result</a>
        <a href="login.jsp">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="content">
        <div class="header">Result Analysis</div>

        <div class="card">
            <h3>Overall Performance</h3>
            <p>Your average test score: <strong><%= String.format("%.2f", averageScore) %>%</strong></p>
        </div>

        <div class="card">
            <h3>Subject-Wise Performance</h3>
            <% for (int i = 0; i < subjects.length; i++) { %>
                <p>📊 <%= subjects[i] %>: <strong><%= scores[i] %>%</strong></p>
                <div class="progress-container">
                    <div class="progress-bar <%= subjects[i].toLowerCase() %>" 
                        style="width: <%= scores[i] %>%"><%= scores[i] %>%</div>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>
