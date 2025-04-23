<%@ page import="java.sql.*, java.util.*, javax.servlet.http.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    // DB and session handling
    String dbURL = "jdbc:mysql://localhost:3306/edutestdata";
    String dbUser = "root";
    String dbPass = "Eshu@3002";

    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Object userIdObj = sessionObj.getAttribute("userId");
    int userId = (userIdObj != null) ? (Integer) userIdObj : -1;
    if (userId == -1) {
        sessionObj.invalidate();
        response.sendRedirect("login.jsp");
        return;
    }

    String category = "DS";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Data Structure Test</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f8fb;
            margin: 0;
            padding: 0;
        }
        .header {
            background: linear-gradient(90deg, #007bff, #0056b3);
            color: white;
            text-align: center;
            padding: 15px;
            font-size: 24px;
            font-weight: 600;
        }
        .container {
            width: 80%;
            margin: 30px auto;
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        h2 {
            color: #0056b3;
            text-align: center;
            font-weight: 600;
        }
        .timer {
            font-size: 20px;
            font-weight: bold;
            color: #ff3333;
            text-align: right;
            margin-bottom: 15px;
        }
        .question-slide {
            display: none;
            padding: 15px;
            margin-bottom: 15px;
            background: #eef4ff;
            border-left: 5px solid #007bff;
            border-radius: 8px;
        }
        .options label {
            display: block;
            padding: 10px;
            background: #f9f9f9;
            border-radius: 6px;
            margin: 5px 0;
            cursor: pointer;
        }
        .options input {
            margin-right: 8px;
        }
        .options label:hover {
            background: #dce9ff;
        }
        .submit-btn {
            background: #007bff;
            color: white;
            padding: 12px 20px;
            border: none;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
            border-radius: 8px;
            width: 100%;
        }
        .submit-btn:hover {
            background: #0056b3;
        }
        .nav-buttons {
            text-align: center;
            margin-top: 20px;
        }
        .nav-buttons button {
            margin: 5px;
            padding: 8px 14px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            border: none;
        }
        .nav-btn {
            background-color: red;
            color: white;
        }
        .nav-btn.attempted {
            background-color: green;
        }
        .nav-control {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body onload="showQuestion(1)">


<div class="header">Data Structure Test</div>

<div class="container">
    <h2>Data Structure Test</h2>
    <div class="timer">Time Left: <span id="timeDisplay">10:00</span></div>

    <form id="testForm" action="submit_test.jsp" method="POST">
        <input type="hidden" name="category" value="<%= category %>">

<%
    int qNumber = 1;
    List<Integer> questionIds = new ArrayList<>();

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection con = DriverManager.getConnection(dbURL, dbUser, dbPass)) {
            String query = "SELECT qid, que, opt_a, opt_b, opt_c, opt_d FROM questions WHERE category = ? ORDER BY RAND() LIMIT 10";
            try (PreparedStatement pst = con.prepareStatement(query)) {
                pst.setString(1, category);
                try (ResultSet rs = pst.executeQuery()) {
                    while (rs.next()) {
                        int qid = rs.getInt("qid");
                        questionIds.add(qid);
                        String question = rs.getString("que");
                        String optA = rs.getString("opt_a");
                        String optB = rs.getString("opt_b");
                        String optC = rs.getString("opt_c");
                        String optD = rs.getString("opt_d");
%>
        <div class="question-slide" id="question_<%= qNumber %>" style="<%= (qNumber == 1) ? "" : "display:none;" %>">
            <p><strong>Q<%= qNumber %>: <%= question %></strong></p>
            <div class="options">
                <label><input type="radio" name="answer_<%= qid %>" value="A" onchange="markAttempted(<%= qNumber %>)"> <%= optA %></label>
                <label><input type="radio" name="answer_<%= qid %>" value="B" onchange="markAttempted(<%= qNumber %>)"> <%= optB %></label>
                <label><input type="radio" name="answer_<%= qid %>" value="C" onchange="markAttempted(<%= qNumber %>)"> <%= optC %></label>
                <label><input type="radio" name="answer_<%= qid %>" value="D" onchange="markAttempted(<%= qNumber %>)"> <%= optD %></label>
            </div>
        </div>
<%
                        qNumber++;
                    }
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    int totalQuestions = questionIds.size();
%>

        <div class="nav-buttons">
            <button type="button" class="nav-control" onclick="prevQuestion()">Previous</button>
<%
    for (int i = 1; i <= totalQuestions; i++) {
%>
            <button type="button" id="btn_<%= i %>" class="nav-btn" onclick="showQuestion(<%= i %>)"><%= i %></button>
<%
    }
%>
            <button type="button" class="nav-control" onclick="nextQuestion()">Next</button>
        </div>

        <br>
        <input type="submit" class="submit-btn" value="Submit Test">
    </form>
</div>

<script>
    let currentQuestion = 1;
    const totalQuestions = <%= totalQuestions %>;

    function showQuestion(index) {
        for (let i = 1; i <= totalQuestions; i++) {
            document.getElementById("question_" + i).style.display = "none";
        }
        document.getElementById("question_" + index).style.display = "block";
        currentQuestion = index;
    }

    function nextQuestion() {
        if (currentQuestion < totalQuestions) {
            showQuestion(currentQuestion + 1);
        }
    }

    function prevQuestion() {
        if (currentQuestion > 1) {
            showQuestion(currentQuestion - 1);
        }
    }

    function markAttempted(qNum) {
        const btn = document.getElementById("btn_" + qNum);
        btn.classList.add("attempted");
    }

    // Timer
    let totalTime = 10 * 60;
    const timeDisplay = document.getElementById('timeDisplay');
    const testForm = document.getElementById('testForm');

    function updateTimer() {
        let minutes = Math.floor(totalTime / 60);
        let seconds = totalTime % 60;
        timeDisplay.textContent = minutes + ":" + (seconds < 10 ? "0" + seconds : seconds);

        if (totalTime <= 0) {
            clearInterval(timerInterval);
            alert("Time's up! Submitting the test.");
            testForm.submit();
        }
        totalTime--;
    }

    const timerInterval = setInterval(updateTimer, 1000);

    // Keep session alive
    setInterval(() => {
        fetch('keepSessionAlive.jsp');
    }, 5 * 60 * 1000);
    </script>

    </body>
    </html>
