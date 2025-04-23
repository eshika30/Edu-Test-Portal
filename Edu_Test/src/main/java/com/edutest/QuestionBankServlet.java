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

@WebServlet("/QuestionBankServlet")
public class QuestionBankServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String question = request.getParameter("question");
        String optionA = request.getParameter("optionA");
        String optionB = request.getParameter("optionB");
        String optionC = request.getParameter("optionC");
        String optionD = request.getParameter("optionD");
        String answer = request.getParameter("answer");
        String category = request.getParameter("category");
        
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutestdata", "root", "Eshu@3002");
            PreparedStatement ps = con.prepareStatement("INSERT INTO questions (que, opt_a, opt_b, opt_c, opt_d, ans_opt, category) VALUES (?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, question);
            ps.setString(2, optionA);
            ps.setString(3, optionB);
            ps.setString(4, optionC);
            ps.setString(5, optionD);
            ps.setString(6, answer);
            ps.setString(7, category);
            ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("question_bank.jsp");
    }
}