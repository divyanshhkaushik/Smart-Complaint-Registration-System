<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Use the implicit session object directly without redefining it
    if (session == null || session.getAttribute("user_id") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String email = (String) session.getAttribute("email");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smart Complaint Registration</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            color: brown;
            background-color: white;
        }

        header {
            background-color: #a81c1c;
            color: white;
            padding: 10px 20px;
            display: flex;
            align-items: center;
            font-size: 24px;
            justify-content: space-between;
            position: relative;
        }

        .header-title {
            flex: 1;
            text-align: center;
            margin: auto;
        }

        .profile-section {
            position: relative;
            display: flex;
            align-items: center;
            cursor: pointer;
        }

        .profile-photo {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            border: 2px solid #ccc;
            overflow: hidden;
            object-fit: cover;
        }

        .dropdown-menu {
            position: absolute;
            top: 60px;
            right: 0;
            background-color: white;
            border: 1px solid #ccc;
            border-radius: 5px;
            overflow: hidden;
            display: none;
            z-index: 1000;
            width: 200px;
        }

        .dropdown-header {
            background-color: #a81c1c;
            color: white;
            text-align: left;
            padding: 10px 15px;
            font-size: 18px;
            font-weight: bold;
        }

        .dropdown-item {
            display: flex;
            align-items: center;
            padding: 10px 15px;
            border-top: 1px solid #ddd;
            cursor: pointer;
        }

        .dropdown-item:hover {
            background-color: #f5f5f5;
        }

        .dropdown-item:first-child {
            border-top: none;
        }

        .dropdown-icon {
            font-size: 18px;
            margin-right: 10px;
            color: #a81c1c;
        }

        .dropdown-text {
            font-size: 16px;
            color: #333;
        }

        .hero {
            background-color: #f5f5dc;
            padding: 20px 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            border-bottom: 2px solid #a81c1c;
        }

        .hero h1 {
            font-size: 2.5rem;
            color: #0d47a1;
            margin-bottom: 10px;
        }

        .hero p {
            font-size: 1rem;
            color: #555;
            margin-bottom: 20px;
            text-align: center;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin: 20px;
            padding: 20px;
        }

        .grid-item {
            background: #e3f2fd;
            border: 1px solid #bbdefb;
            padding: 50px;
            border-radius: 5px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            cursor: pointer;
            transition: transform 0.2s ease;
        }

        .grid-item:hover {
            transform: scale(1.05);
        }

        .grid-item img {
            width: 100%;
            max-height: 200px;
            object-fit: cover;
            border-radius: 8px;
        }

        .grid-item h3 {
            margin-top: 15px;
            font-size: 1.5rem;
            color: #0d47a1;
        }

        .grid-item p {
            color: #616161;
            font-size: 1rem;
        }

        .footer {
            background-color: brown;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <header>
        <div class="header-title">User Dashboard</div>
        <div class="profile-section" onclick="toggleDropdown()">
            <img src="https://shorturl.at/C5nKT" alt="Profile Photo" class="profile-photo">
            <div class="dropdown-menu" id="profileDropdown">
                <div class="dropdown-header">Profile Options</div>
                <div class="dropdown-item">
                    <div class="dropdown-icon">👤</div>
                    <div class="dropdown-text">Open User Profile</div>
                </div>
                <div class="dropdown-item">
                    <div class="dropdown-icon">🚪</div>
                    <div class="dropdown-text">Logout</div>
                </div>
            </div>
        </div>
    </header>

    <div class="hero">
        <h1>Welcome to Smart Complaint Registration<br><%= email %></h1>
        <p>
            Enhance efficiency and transparency by registering and tracking your complaints here.
        </p>
    </div>

    <div class="grid">
        <div class="grid-item" onclick="window.location.href='complaintregister.jsp';">
            <img src="https://dolphinlifesciences.com/wp-content/uploads/2020/02/Complaint-e1563181059332.jpg" alt="Complaint Image 1">
            <h3>Register Complaints</h3>
            <p>File your complaints easily and track their progress in real time.</p>
        </div>
        <div class="grid-item" onclick="window.location.href='TrackComplaintServlet';">
            <img src="https://www.apcpdcl.in/img/spandana3.png" alt="Complaint Image 2">
            <h3>Track Complaints</h3>
            <p>Know about the status and resolution of your complaints.</p>
        </div>
        <div class="grid-item">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT85RNtcse2nPr0Ex-JSrTTE0Zkq9AA8XWZ4Q&s" alt="Complaint Image 3">
            <h3>Important Contacts</h3>
            <p>Connect with the responsible authorities for emergency cases.</p>
        </div>
    </div>

    <div class="footer">
        &copy; 2025 Smart Complaint Registration. All rights reserved.
    </div>

    <script>
        function toggleDropdown() {
            const dropdown = document.getElementById('profileDropdown');
            dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
        }

        window.addEventListener('click', function(e) {
            const dropdown = document.getElementById('profileDropdown');
            if (!e.target.closest('.profile-section')) {
                dropdown.style.display = 'none';
            }
        });
    </script>
</body>
</html>