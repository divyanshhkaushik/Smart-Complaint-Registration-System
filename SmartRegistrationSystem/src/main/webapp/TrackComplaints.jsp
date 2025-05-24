<%@ page import="java.util.List" %>
<%@ page import="com.company.model.Complaint" %>

<%
    List<Complaint> complaintsList = (List<Complaint>) request.getAttribute("complaintsList");
%>

<html>
<head>
    <title>Your Registered Complaints</title>
    <style>
        body { font-family: Arial; padding: 20px; background-color: #f8f8f8; }
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #444; color: #fff; }
        .no-complaints { color: red; font-size: 18px; margin-top: 20px; }
    </style>
</head>
<body>

<% if (complaintsList == null) { %>
    <h2 class="no-complaints">Complaints not loaded. Please access via TrackComplaintServlet.</h2>
<% } else if (complaintsList.isEmpty()) { %>
    <h2 class="no-complaints">No complaints found.</h2>
<% } else { %>
    <h2>Your Registered Complaints</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Phone</th>
            <th>Category</th>
            <th>Type</th>
            <th>Location</th>
            <th>Description</th>
            <th>Status</th>
            <th>Created At</th>
        </tr>
        <% for (Complaint c : complaintsList) { %>
        <tr>
            <td><%= c.getComplaintId() %></td>
            <td><%= c.getFullName() %></td>
            <td><%= c.getPhone() %></td>
            <td><%= c.getCategory() %></td>
            <td><%= c.getTypeOfComplaint() %></td>
            <td><%= c.getLocation() %></td>
            <td><%= c.getDescription() %></td>
            <td><%= c.getStatus() %></td>
            <td><%= c.getCreatedAt() %></td>
        </tr>
        <% } %>
    </table>
<% } %>

</body>
</html>
