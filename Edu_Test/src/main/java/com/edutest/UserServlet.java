package com.edutest;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            Connection conn = DatabaseConnection.initializeDatabase();
            
            if ("add".equals(action)) {
                String sql = "INSERT INTO users (name, email, mobile, password) VALUES (?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, request.getParameter("name"));
                stmt.setString(2, request.getParameter("email"));
                stmt.setString(3, request.getParameter("mobile"));
                stmt.setString(4, request.getParameter("password"));
                stmt.executeUpdate();
                stmt.close();
            } else if ("edit".equals(action)) {
                String sql = "UPDATE users SET name=?, email=?, mobile=? WHERE user_id=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, request.getParameter("name"));
                stmt.setString(2, request.getParameter("email"));
                stmt.setString(3, request.getParameter("mobile"));
                stmt.setInt(4, Integer.parseInt(request.getParameter("id")));
                stmt.executeUpdate();
                stmt.close();
            } else if ("delete".equals(action)) {
                String sql = "DELETE FROM users WHERE user_id=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, Integer.parseInt(request.getParameter("id")));
                stmt.executeUpdate();
                stmt.close();
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("UserListServlet");
    }
}
