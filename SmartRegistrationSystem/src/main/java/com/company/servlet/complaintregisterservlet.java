package com.company.servlet;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@WebServlet("/complaintregisterservlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class complaintregisterservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/smartcomplaintdb";
    private static final String JDBC_USERNAME = "user1";
    private static final String JDBC_PASSWORD = "password123";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        // Retrieve user_id from session
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");

        if (userId == null) {
            // Redirect to login if user is not logged in
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Retrieve form data
            String fullName = request.getParameter("fullName");
            String phone = request.getParameter("phone");
            String category = request.getParameter("category");
            String typeOfComplaint = request.getParameter("typeOfComplaint");
            String location = request.getParameter("location");
            String description = request.getParameter("description");

            // Save complaint in the database
            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD)) {
                String sql = "INSERT INTO complaints (user_id, full_name, phone, category, type_of_complaint, location, description) "
                           + "VALUES (?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, userId);                 // User ID from session
                stmt.setString(2, fullName);           // Full Name
                stmt.setString(3, phone);              // Phone
                stmt.setString(4, category);           // Category
                stmt.setString(5, typeOfComplaint);    // Type of Complaint
                stmt.setString(6, location);           // Location
                stmt.setString(7, description);        // Description

                int rowsInserted = stmt.executeUpdate();
                if (rowsInserted > 0) {
                    // Redirect to the success page
                    response.sendRedirect("ComplaintSuccess.jsp");
                } else {
                    response.getWriter().println("<h2>Failed to register the complaint. Please try again.</h2>");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h2>Error: " + e.getMessage() + "</h2>");
        }
    }
}