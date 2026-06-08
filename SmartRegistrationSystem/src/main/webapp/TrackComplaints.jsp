<%@ page import="java.util.List" %>
<%@ page import="com.company.model.Complaint" %>

<%
    List<Complaint> complaintsList = (List<Complaint>) request.getAttribute("complaintsList");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Registered Complaints</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            color: #34495e;
        }
        header {
            background-color: #2c3e50;
            color: white;
            padding: 15px 30px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .header-title {
            font-size: 1.5rem;
            font-weight: 600;
        }
        .back-btn {
            color: white;
            text-decoration: none;
            background: #3498db;
            padding: 8px 16px;
            border-radius: 5px;
            font-weight: 600;
            transition: background 0.3s;
        }
        .back-btn:hover {
            background: #2980b9;
        }
        .container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            overflow-x: auto;
        }
        h2 {
            text-align: center;
            color: #2c3e50;
            margin-top: 0;
            margin-bottom: 30px;
            font-weight: 700;
        }
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 8px;
            overflow: hidden;
            border: 1px solid #ecf0f1;
            min-width: 900px;
        }
        th, td {
            padding: 15px 20px;
            text-align: left;
            border-bottom: 1px solid #ecf0f1;
        }
        th {
            background-color: #3498db;
            color: white;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 0.5px;
        }
        tr:last-child td {
            border-bottom: none;
        }
        tr:hover td {
            background-color: #f9fbfd;
        }
        .status-badge {
            background-color: #e8f4f8;
            color: #2980b9;
            border: 1px solid #3498db;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 600;
            text-align: center;
            display: inline-block;
        }
        .no-complaints {
            text-align: center;
            color: #e74c3c;
            padding: 40px;
            font-size: 1.2rem;
            font-weight: 600;
        }
    </style>
</head>
<body>

<header>
    <div class="header-title">Track Complaints</div>
    <a href="UserDashboard.jsp" class="back-btn">Back to Dashboard</a>
</header>

<div class="container">
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
            <td><span class="status-badge"><%= c.getStatus() %></span></td>
            <td><%= c.getCreatedAt() %></td>
        </tr>
        <% } %>
    </table>
<% } %>
</div>

</body>
</html>
