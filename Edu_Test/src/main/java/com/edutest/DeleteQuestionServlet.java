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

/**
 * Servlet implementation class DeleteQuestionServlet
 */
@WebServlet("/DeleteQuestionServlet")
public class DeleteQuestionServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int qid = Integer.parseInt(request.getParameter("qid"));
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutestdata", "root", "Eshu@3002");
            PreparedStatement ps = con.prepareStatement("DELETE FROM questions WHERE qid=?");
            ps.setInt(1, qid);
            ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("question_bank.jsp");
    }
}
