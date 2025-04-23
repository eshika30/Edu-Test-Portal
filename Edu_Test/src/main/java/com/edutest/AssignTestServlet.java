package com.edutest;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AssignTestServlet")
public class AssignTestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String testId = request.getParameter("test_id");
        String[] selectedQuestions = request.getParameterValues("selected_questions");

        if (selectedQuestions != null && testId != null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutestdata", "root", "Eshu@3002");

                String sql = "INSERT INTO test_questions (test_id, qid) VALUES (?, ?)";
                PreparedStatement ps = con.prepareStatement(sql);

                for (String qid : selectedQuestions) {
                    ps.setString(1, testId);
                    ps.setInt(2, Integer.parseInt(qid));
                    ps.executeUpdate();
                }

                con.close();
                response.sendRedirect("categorize_questions.jsp?msg=success");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("categorize_questions.jsp?msg=error");
            }
        } else {
            response.sendRedirect("categorize_questions.jsp?msg=invalid");
        }
    }
}
