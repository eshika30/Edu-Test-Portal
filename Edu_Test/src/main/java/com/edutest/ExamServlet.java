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

@WebServlet("/ExamServlet")
public class ExamServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Database credentials
    private static final String DB_URL = "jdbc:mysql://localhost:3306/edutestdata";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Eshu@3002";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            if ("add".equals(action)) {
                String query = "INSERT INTO exams (exam_name, exam_date, exam_time, duration, total_marks) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(query);
                stmt.setString(1, request.getParameter("exam_name"));
                stmt.setString(2, request.getParameter("exam_date"));
                stmt.setString(3, request.getParameter("exam_time"));
                stmt.setInt(4, Integer.parseInt(request.getParameter("duration")));
                stmt.setInt(5, Integer.parseInt(request.getParameter("total_marks")));
                stmt.executeUpdate();
            } 
            else if ("delete".equals(action)) {
                String query = "DELETE FROM exams WHERE exam_id = ?";
                PreparedStatement stmt = conn.prepareStatement(query);
                stmt.setInt(1, Integer.parseInt(request.getParameter("exam_id")));
                stmt.executeUpdate();
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        response.sendRedirect("exam_management.jsp");
    }
}
