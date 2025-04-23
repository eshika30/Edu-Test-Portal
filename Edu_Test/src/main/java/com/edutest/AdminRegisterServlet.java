package com.edutest;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminRegisterServlet")
public class AdminRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String name = request.getParameter("Fullname");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");

        try {
            Connection con = DatabaseConnection.initializeDatabase();
            PreparedStatement pst = con.prepareStatement("INSERT INTO admin (admin_name, admin_email, admin_mobile, admin_password) VALUES (?,?,?,?)");
            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, mobile);
            pst.setString(4, password);
            pst.executeUpdate();
            response.sendRedirect("adminregister.jsp?success=Signup Successful! Login Now.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminregister.jsp?error=Signup Failed! Try Again.");
        }
    }
}
