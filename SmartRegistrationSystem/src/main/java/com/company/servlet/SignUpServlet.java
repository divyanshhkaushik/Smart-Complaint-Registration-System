package com.company.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.sql.*;

@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        // Database connection variables
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            // Load JDBC driver
            System.out.println("Loading JDBC driver...");
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Driver loaded successfully!");

            // Connect to the database
            String dbURL = "jdbc:mysql://localhost:3306/smartcomplaintdb";
            String dbUser = "user1";
            String dbPassword = "password123";
            System.out.println("Connecting to the database...");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
            System.out.println("Connected to the database!");

            // Insert query
            String query = "INSERT INTO users (email, password) VALUES (?, ?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<h3 style='color:green;text-align:center;'>Registration successful!</h3>");
            } else {
                out.println("<h3 style='color:red;text-align:center;'>Registration failed. Please try again.</h3>");
            }

        } catch (ClassNotFoundException e) {
            System.err.println("Driver not found: " + e.getMessage());
            e.printStackTrace();
            out.println("<h3 style='color:red;text-align:center;'>Driver error: " + e.getMessage() + "</h3>");
        } catch (Exception e) {
            System.err.println("Database error: " + e.getMessage());
            e.printStackTrace();
            out.println("<h3 style='color:red;text-align:center;'>Registration failed due to an error: " + e.getMessage() + "</h3>");
        } finally {
            // Close resources
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}