package com.edutest;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Database credentials
	private static final String DB_URL = "jdbc:mysql://localhost:3306/edutestdata";
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "Eshu@3002";

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		// Database connection and validation
		try {
			// Load JDBC Driver (For MySQL)
			Class.forName("com.mysql.cj.jdbc.Driver");

			// Establish Connection
			Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

			// SQL Query to check user credentials
			String sql = "SELECT user_id, password FROM users WHERE email = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, email);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				// Retrieve user id and stored password
				int userId = rs.getInt("user_id");
				String storedPassword = rs.getString("password");

				// Validate password
				if (password.equals(storedPassword)) {
					// Successful Login
					HttpSession session = request.getSession();
	                session.setAttribute("userId", userId); // Store userId
	                session.setAttribute("userEmail", email); // Store email

	                response.sendRedirect("dashboard.jsp");  
					
				} else {
					// Invalid Password
					out.print("<h2>Invalid Credentials : Please Relogin</h2>");
					RequestDispatcher view = request.getRequestDispatcher("login.jsp");
					view.include(request, response);
				}
				
			} else {
				// No user found with the given email
				out.print("<h2>User not found. Please sign up first.</h2>");
				RequestDispatcher view = request.getRequestDispatcher("register.jsp");
				view.include(request, response);
			}

			// Close resources
			rs.close();
			stmt.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
			out.print("<h2>Error Occurred: " + e.getMessage() + "</h2>");
		}
	}
}
