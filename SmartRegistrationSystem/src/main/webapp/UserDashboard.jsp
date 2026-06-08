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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            color: #34495e;
            background-color: #f4f6f8;
        }

        header {
            background-color: #2c3e50; /* Dark blue-gray */
            color: white;
            padding: 15px 30px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .header-title {
            flex: 1;
            text-align: center;
            font-size: 1.8rem;
            font-weight: 600;
        }

        .profile-section {
            position: relative;
            display: flex;
            align-items: center;
            cursor: pointer;
        }

        .profile-photo {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            border: 2px solid #fff;
            object-fit: cover;
        }

        .dropdown-menu {
            position: absolute;
            top: 60px;
            right: 0;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            overflow: hidden;
            display: none;
            z-index: 1000;
            width: 220px;
            border: 1px solid #ecf0f1;
        }

        .dropdown-header {
            background-color: #f8f9fa;
            color: #2c3e50;
            text-align: left;
            padding: 12px 15px;
            font-size: 1rem;
            font-weight: 600;
            border-bottom: 1px solid #ecf0f1;
        }

        .dropdown-item {
            display: flex;
            align-items: center;
            padding: 12px 15px;
            cursor: pointer;
            text-decoration: none;
            color: #34495e;
            transition: background-color 0.2s ease;
        }

        .dropdown-item:hover {
            background-color: #f4f6f8;
        }

        .dropdown-icon {
            font-size: 20px;
            margin-right: 15px;
            color: #3498db; /* A nice blue for icons */
            width: 20px;
            text-align: center;
        }

        .dropdown-text {
            font-size: 1rem;
        }

        .hero {
            background: linear-gradient(to right, #3498db, #2980b9);
            color: white;
            padding: 60px 20px;
            text-align: center;
        }

        .hero h1 {
            font-size: 2.8rem;
            font-weight: 700;
            margin: 0 0 10px 0;
        }

        .hero p {
            font-size: 1.1rem;
            font-weight: 300;
            max-width: 600px;
            margin: 0 auto;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            padding: 40px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .grid-item {
            background: #ffffff;
            border: 1px solid #e0e0e0;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            text-align: center;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .grid-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }

        .grid-item img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .grid-item h3 {
            margin-top: 0;
            margin-bottom: 10px;
            font-size: 1.5rem;
            font-weight: 600;
            color: #2c3e50;
        }

        .grid-item p {
            color: #7f8c8d;
            font-size: 1rem;
            line-height: 1.5;
        }

        .footer {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: 40px;
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
                <a href="#" class="dropdown-item">
                    <div class="dropdown-icon">👤</div>
                    <div class="dropdown-text">User Profile</div>
                </a>
                <a href="LogoutServlet" class="dropdown-item">
                    <div class="dropdown-icon">🚪</div>
                    <div class="dropdown-text">Logout</div>
                </a>
            </div>
        </div>
    </header>

    <div class="hero">
        <h1>Welcome, <%= email %></h1>
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