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

@WebServlet("/PerformanceTracking")
public class PerformanceTrackingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("user_id");
        
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutestdata", "root", "password");
            
            ps = con.prepareStatement("SELECT exam_date, total_que, correct_ans, wrong_ans, marks FROM results WHERE user_id=? ORDER BY exam_date DESC");
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            
            JSONObject json = new JSONObject();
            while (rs.next()) {
                JSONObject record = new JSONObject();
                record.put("exam_date", rs.getTimestamp("exam_date"));
                record.put("total_questions", rs.getInt("total_que"));
                record.put("correct_answers", rs.getInt("correct_ans"));
                record.put("wrong_answers", rs.getInt("wrong_ans"));
                record.put("score", rs.getFloat("marks"));
                json.append("performance", record);
            }
            
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