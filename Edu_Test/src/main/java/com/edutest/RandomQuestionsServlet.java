package com.edutest;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RandomQuestionsServlet")
public class RandomQuestionsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edutestdata", "root", "Eshu@3002");

            // Get selected categories from request
            String[] selectedCategories = request.getParameterValues("category");

            out.println("<html><head><title>Random Questions</title>");
            out.println("<style>");
            out.println("body { font-family: Arial, sans-serif; background: #f4f4f4; padding: 20px; }");
            out.println(".container { max-width: 800px; margin: auto; }");
            out.println(".question-container { background: white; padding: 15px; margin: 10px 0; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.2); }");
            out.println("h2 { color: #4CAF50; }");
            out.println("</style></head><body>");
            out.println("<div class='container'>");

            if (selectedCategories == null) {
                // Display category selection form
                out.println("<h2>Select Categories</h2>");
                out.println("<form action='RandomQuestionsServlet' method='GET'>");
                out.println("<input type='checkbox' name='category' value='OS'> OS<br>");
                out.println("<input type='checkbox' name='category' value='DBMS'> DBMS<br>");
                out.println("<input type='checkbox' name='category' value='AIML'> AIML<br>");
                out.println("<input type='checkbox' name='category' value='DS'> Data Structures<br>");
                out.println("<input type='checkbox' name='category' value='CPP'> C++<br>");
                out.println("<br><input type='submit' value='Get Questions'>");
                out.println("</form>");
            } else {
                // Generate 10 random questions based on selected categories
                out.println("<h2>10 Random Questions</h2>");

                StringBuilder sql = new StringBuilder("SELECT * FROM questions WHERE category IN (");
                for (int i = 0; i < selectedCategories.length; i++) {
                    sql.append("?");
                    if (i < selectedCategories.length - 1) {
                        sql.append(",");
                    }
                }
                sql.append(") ORDER BY RAND() LIMIT 10");

                PreparedStatement ps = con.prepareStatement(sql.toString());

                for (int i = 0; i < selectedCategories.length; i++) {
                    ps.setString(i + 1, selectedCategories[i]);
                }

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    out.println("<div class='question-container'>");
                    out.println("<h3>" + rs.getString("que") + "</h3>");
                    out.println("<p>A) " + rs.getString("opt_a") + "</p>");
                    out.println("<p>B) " + rs.getString("opt_b") + "</p>");
                    out.println("<p>C) " + rs.getString("opt_c") + "</p>");
                    out.println("<p>D) " + rs.getString("opt_d") + "</p>");
                    out.println("</div>");
                }

                rs.close();
                ps.close();
            }

            con.close();
            out.println("</div></body></html>");

        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    }
}
