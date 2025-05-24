<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complaint Registered</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            max-width: 600px;
            background: white;
            padding: 30px;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .container h1 {
            color: #4caf50;
            font-size: 2rem;
            margin-bottom: 20px;
        }

        .container p {
            font-size: 1rem;
            color: #555;
            margin-bottom: 30px;
        }

        .btn-group a {
            display: inline-block;
            margin: 0 10px;
            padding: 10px 20px;
            font-size: 1rem;
            color: white;
            background-color: #a81c1c;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn-group a:hover {
            background-color: #8b0000;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Complaint Registered Successfully!</h1>
        <p>Your complaint has been registered successfully. You can track its progress or return to your dashboard.</p>
        <div class="btn-group">
            <a href="UserDashboard.jsp">Back to Dashboard</a>
            <a href="TrackComplaints.jsp">Track Complaints</a>
        </div>
    </div>
</body>
</html>