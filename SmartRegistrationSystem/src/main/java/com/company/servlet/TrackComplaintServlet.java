package com.company.servlet;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.company.model.Complaint;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/TrackComplaintServlet")
public class TrackComplaintServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/smartcomplaintdb";
    private static final String JDBC_USERNAME = "user1";
    private static final String JDBC_PASSWORD = "password123";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("TrackComplaintServlet invoked");

        HttpSession session = request.getSession();

        // Uncomment this for testing if needed:
        // session.setAttribute("user_id", 1);

        Integer userId = (Integer) session.getAttribute("user_id");
        System.out.println("User ID from session: " + userId);

        if (userId == null) {
            System.out.println("User not logged in. Redirecting to login.jsp");
            response.sendRedirect("login.jsp");
            return;
        }

        List<Complaint> complaintsList = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD)) {
            String sql = "SELECT * FROM complaints WHERE user_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Complaint complaint = new Complaint();
                complaint.setComplaintId(rs.getInt("complaint_id"));
                complaint.setFullName(rs.getString("full_name"));
                complaint.setPhone(rs.getString("phone"));
                complaint.setCategory(rs.getString("category"));
                complaint.setTypeOfComplaint(rs.getString("type_of_complaint"));
                complaint.setLocation(rs.getString("location"));
                complaint.setDescription(rs.getString("description"));
                complaint.setCreatedAt(rs.getTimestamp("created_at"));
                complaint.setStatus(rs.getString("status"));

                complaintsList.add(complaint);
            }

            System.out.println("Number of complaints fetched: " + complaintsList.size());

            request.setAttribute("complaintsList", complaintsList);
            request.getRequestDispatcher("TrackComplaints.jsp").forward(request, response);

        } catch (Exception e) {
            System.out.println("Error fetching complaints:");
            e.printStackTrace();
        }
    }
}
