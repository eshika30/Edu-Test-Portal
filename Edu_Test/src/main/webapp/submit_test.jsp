<%@ page import="java.sql.*, java.util.*, javax.servlet.http.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    // Session Handling
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int userId = (Integer) sessionObj.getAttribute("userId");
    String category = request.getParameter("category");

    if (category == null || category.trim().isEmpty()) {
        response.sendRedirect("technicaltest.jsp");
        return;
    }

    // Database Configuration
    String dbURL = "jdbc:mysql://localhost:3306/edutestdata";
    String dbUser = "root";
    String dbPass = "Eshu@3002";

    int correctAns = 0;
    int totalQue = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection con = DriverManager.getConnection(dbURL, dbUser, dbPass)) {

            // Fetch correct answers
            String getAnswersQuery = "SELECT qid, ans_opt FROM questions WHERE category = ?";
            try (PreparedStatement pst = con.prepareStatement(getAnswersQuery)) {
                pst.setString(1, category);
                try (ResultSet rs = pst.executeQuery()) {
                    while (rs.next()) {
                        int qid = rs.getInt("qid");
                        String correctOption = rs.getString("ans_opt");
                        String userAnswer = request.getParameter("answer_" + qid);

                        totalQue++; // Count total questions
                        if (userAnswer != null && userAnswer.equals(correctOption)) {
                            correctAns++;
                        }
                    }
                }
            }

            // Compute wrong answers and percentage
            int wrongAns = totalQue - correctAns;
            int percent = (int) ((correctAns / (double) totalQue) * 100);

            // Insert result into `results` table
            String insertResultQuery = "INSERT INTO results (user_id, total_que, correct_ans, wrong_ans, marks, percent, category) VALUES (?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement pst = con.prepareStatement(insertResultQuery)) {
                pst.setInt(1, userId);
                pst.setInt(2, totalQue);
                pst.setInt(3, correctAns);
                pst.setInt(4, wrongAns);
                pst.setInt(5, correctAns); // Assuming each correct answer gives 1 mark
                pst.setInt(6, percent);
                pst.setString(7, category);
                pst.executeUpdate();
            }

            // Redirect to `myresult.jsp` with userId and category to display results
            response.sendRedirect("myresult.jsp?userId=" + userId + "&category=" + category);
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage()); // Debugging output
    }
%>
