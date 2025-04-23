package com.edutest;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

@WebServlet("/SubmitTestServlet")
public class SubmitTestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("user_id");
        int examId = Integer.parseInt(request.getParameter("exam_id"));
        
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutestdata", "root", "password");
            
            int totalQuestions = 0;
            int correctAnswers = 0;
            
            for (String qid : request.getParameterMap().keySet()) {
                if (qid.startsWith("q")) {
                    int questionId = Integer.parseInt(qid.substring(1));
                    String userAnswer = request.getParameter(qid);
                    
                    ps = con.prepareStatement("SELECT ans_opt FROM questions WHERE qid=?");
                    ps.setInt(1, questionId);
                    rs = ps.executeQuery();
                    
                    if (rs.next()) {
                        totalQuestions++;
                        if (rs.getString("ans_opt").equalsIgnoreCase(userAnswer)) {
                            correctAnswers++;
                        }
                    }
                }
            }
            
            int wrongAnswers = totalQuestions - correctAnswers;
            float marks = (correctAnswers * 100) / (float) totalQuestions;
            
            ps = con.prepareStatement("INSERT INTO results (user_id, total_que, correct_ans, wrong_ans, marks) VALUES (?, ?, ?, ?, ?)");
            ps.setInt(1, userId);
            ps.setInt(2, totalQuestions);
            ps.setInt(3, correctAnswers);
            ps.setInt(4, wrongAnswers);
            ps.setFloat(5, marks);
            ps.executeUpdate();
            
            JSONObject json = new JSONObject();
            json.put("total_questions", totalQuestions);
            json.put("correct_answers", correctAnswers);
            json.put("wrong_answers", wrongAnswers);
            json.put("score", marks);
            
            response.setContentType("application/json");
            response.getWriter().write(json.toString());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException e) {}
            try { if (ps != null) ps.close(); } catch (SQLException e) {}
            try { if (con != null) con.close(); } catch (SQLException e) {}
        }
    }
}