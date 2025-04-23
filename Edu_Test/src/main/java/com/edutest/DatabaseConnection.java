package com.edutest;
import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/edutestdata";
    private static final String USER = "root";
    private static final String PASSWORD = "Eshu@3002"; // Change to your MySQL password

    public static Connection initializeDatabase() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
