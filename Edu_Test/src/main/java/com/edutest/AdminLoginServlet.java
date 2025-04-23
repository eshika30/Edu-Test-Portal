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


/**
 * Servlet implementation class LoginValidate
 */
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
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
			String sql = "SELECT admin_password FROM admin WHERE admin_email = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, email);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				// Retrieve the stored password from the database
				String storedPassword = rs.getString("admin_password");

				// Validate password
				if (password.equals(storedPassword)) {
					// Successful Login
					HttpSession session = request.getSession();
	                session.setAttribute("user", email);  // Store email in session
	                
	                response.sendRedirect("admindashboard.jsp");  
					
				} else {
					// Invalid Password
					out.print("<h2>Invalid Credentials : Please Relogin</h2>");
					RequestDispatcher view = request.getRequestDispatcher("adminlogin.jsp");
					view.include(request, response);
				}
				
				int id;
				String query = "Select admin_id from admin where admin_email = ?";
				PreparedStatement pstmt = conn.prepareStatement(query);
				pstmt.setString(1, email);
				ResultSet res = pstmt.executeQuery();
				
				if(res.next()) {
					id = res.getInt("id");
					HttpSession session = request.getSession();
	                session.setAttribute("userId", id);
					//System.out.println(id);
				}
				
			} else {
				// No user found with the given email
				out.print("<h2>User not found. Please sign up first.</h2>");
				RequestDispatcher view = request.getRequestDispatcher("adminregister.jsp");
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
