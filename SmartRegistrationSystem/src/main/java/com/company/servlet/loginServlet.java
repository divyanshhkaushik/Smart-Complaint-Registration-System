package com.company.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.sql.*;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Database connection
            String dbURL = "jdbc:mysql://localhost:3306/smartcomplaintdb";
            String dbUser = "user1";
            String dbPassword = "password123";
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // SQL query
            String sql = "SELECT id, email FROM users WHERE email = ? AND password = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            rs = ps.executeQuery();

            if (rs.next()) {
                // Login successful: Save user ID and email in session
                int userId = rs.getInt("id");
                HttpSession session = request.getSession();
                session.setAttribute("user_id", userId); // Store user_id in session
                session.setAttribute("email", email);    // Optional: Store email in session

                response.sendRedirect("UserDashboard.jsp"); // Redirect to complaint registration
            } else {
                // Invalid credentials
                response.getWriter().println("<h3 style='color:red;'>Invalid email or password!</h3>");
                response.getWriter().println("<a href='login.jsp'>Back to Login</a>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3 style='color:red;'>An error occurred: " + e.getMessage() + "</h3>");
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}