package com.company.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!newPassword.equals(confirmPassword)) {
            response.getWriter().println("<script>alert('Passwords do not match!');window.location='ResetPassword.jsp';</script>");
            return;
        }

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcomplaintdb", "user1", "password123");
            System.out.println("Connecting to the database...");

            // Update the password in the 'users' table
            String updateQuery = "UPDATE users SET password = ? WHERE email = ?";
            ps = conn.prepareStatement(updateQuery);
            ps.setString(1, newPassword); // You can hash the password before storing it.
            ps.setString(2, email);

            int rowsUpdated = ps.executeUpdate();

            if (rowsUpdated > 0) {
                response.getWriter().println("<script>alert('Password updated successfully!');window.location='login.jsp';</script>");
            } else {
                response.getWriter().println("<script>alert('Failed to update password. Please try again.');window.location='ResetPassword.jsp';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('An error occurred. Please try again later.');window.location='ResetPassword.jsp';</script>");
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}