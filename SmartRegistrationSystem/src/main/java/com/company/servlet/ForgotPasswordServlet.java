package com.company.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.sql.*;
import com.company.utils.CodeGenerator;
import com.company.utils.EmailSender;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcomplaintdb", "user1", "password123");

            // Check if email exists in the database
            String query = "SELECT * FROM users WHERE email = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();

            if (rs.next()) {
                String code = CodeGenerator.generateCode();

                // Store the code in the database
                String insertQuery = "REPLACE INTO password_reset (email, code) VALUES (?, ?)";
                PreparedStatement ps2 = conn.prepareStatement(insertQuery);
                ps2.setString(1, email);
                ps2.setString(2, code);
                ps2.executeUpdate();

                // Send the email
                String subject = "Password Reset Code";
                String messageContent = "Your password reset code is: " + code;
                EmailSender.sendEmail(email, subject, messageContent);

                // Redirect to RedirectPage.jsp with the email
                request.setAttribute("email", email);
                RequestDispatcher dispatcher = request.getRequestDispatcher("RedirectPage.jsp");
                dispatcher.forward(request, response);
            } else {
                response.getWriter().println("<script>alert('Email ID not registered');window.location='ForgotPassword.jsp';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('An error occurred. Please try again later.');window.location='ForgotPassword.jsp';</script>");
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