package com.company.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet("/VerifyCodeServlet")
public class VerifyCodeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String code = request.getParameter("code"); // Make sure 'code' is retrieved from the request.
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcomplaintdb", "user1", "password123");
            System.out.println("Connecting to the database...");

            // Updated query to include both email and code
            String query = "SELECT * FROM password_reset WHERE email = ? AND code = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, code);
            System.out.println("Query to execute: " + query);
            System.out.println("Email: " + email + ", Code: " + code);


            rs = ps.executeQuery();

            if (rs.next()) {
                response.getWriter().println("Code verified successfully!");
                // Proceed to reset password or the next step
                request.setAttribute("email", email);
                RequestDispatcher dispatcher = request.getRequestDispatcher("ResetPassword.jsp");
                dispatcher.forward(request, response);
            } else {
                response.getWriter().println("Invalid code or email. Please try again.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred while verifying the code. Please try again later.");
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}