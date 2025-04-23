package com.edutest;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminResultsServlet")
public class AdminResultServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // HTML + Styles
        out.println("<html><head><title>Results Overview</title>");
        out.println("<style>");
        out.println("table { width: 100%; border-collapse: collapse; }");
        out.println("th, td { border: 1px solid #ddd; padding: 8px; text-align: center; }");
        out.println("th { background-color: #4CAF50; color: white; }");
        out.println("</style></head><body>");
        
        out.println("<h2>Admin Panel - Student Results</h2>");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutestdata", "root", "Eshu@3002");

            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM results ORDER BY exam_date DESC");

            out.println("<table>");
            out.println("<tr><th>Result ID</th><th>User ID</th><th>Category</th><th>Total Questions</th><th>Correct Answers</th><th>Wrong Answers</th><th>Marks</th><th>Percentage</th><th>Exam Date</th><th>Status</th></tr>");
            
            while (rs.next()) {
                int resultId = rs.getInt("result_id");
                int userId = rs.getInt("user_id");
                String category = rs.getString("category");
                int totalQuestions = rs.getInt("total_que");
                int correctAnswers = rs.getInt("correct_ans");
                int wrongAnswers = rs.getInt("wrong_ans");
                int marks = rs.getInt("marks");
                int percent = rs.getInt("percent");
                Timestamp examDate = rs.getTimestamp("exam_date");

                String status = (percent >= 5) ? "Passed" : "Failed";

                out.println("<tr>");
                out.println("<td>" + resultId + "</td>");
                out.println("<td>" + userId + "</td>");
                out.println("<td>" + category + "</td>");
                out.println("<td>" + totalQuestions + "</td>");
                out.println("<td>" + correctAnswers + "</td>");
                out.println("<td>" + wrongAnswers + "</td>");
                out.println("<td>" + marks + "</td>");
                out.println("<td>" + percent + "%</td>");
                out.println("<td>" + examDate + "</td>");
                out.println("<td><b>" + status + "</b></td>");
                out.println("</tr>");
            }

            out.println("</table>");
            con.close();

        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }

        out.println("</body></html>");
    }
}
