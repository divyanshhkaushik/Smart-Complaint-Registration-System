<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reset Password</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f6f8;
      color: #34495e;
    }

    .header {
      background-color: #2c3e50;
      color: white;
      padding: 15px 30px;
      text-align: center;
      font-size: 1.5rem;
      font-weight: 600;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }

    .container {
      max-width: 450px;
      margin: 60px auto;
      padding: 40px;
      background: white;
      border: 1px solid #ecf0f1;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
      border-radius: 10px;
    }

    .container h1 {
      text-align: center;
      color: #2c3e50;
      margin-top: 0;
      margin-bottom: 30px;
      font-weight: 700;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      display: block;
      font-weight: 600;
      margin-bottom: 8px;
      color: #7f8c8d;
      font-size: 0.9rem;
    }

    .form-group input {
      width: 100%;
      padding: 12px 15px;
      font-size: 14px;
      font-family: 'Poppins', sans-serif;
      border: 1px solid #dcdde1;
      border-radius: 6px;
      box-sizing: border-box;
      transition: border-color 0.3s, box-shadow 0.3s;
    }

    .form-group input:focus {
      border-color: #3498db;
      box-shadow: 0 0 5px rgba(52, 152, 219, 0.3);
      outline: none;
    }

    .btn {
      width: 100%;
      padding: 12px;
      font-size: 16px;
      font-weight: 600;
      font-family: 'Poppins', sans-serif;
      color: white;
      background-color: #3498db;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      transition: background-color 0.3s, transform 0.2s;
      margin-top: 10px;
    }

    .btn:hover {
      background-color: #2980b9;
      transform: translateY(-2px);
    }
  </style>
</head>
<body>
  <div class="header">
    Smart Complaint Registration System
  </div>
  <div class="container">
    <h1>Reset Password</h1>
    <form action="ResetPasswordServlet" method="POST">
      <input type="hidden" name="email" value="${email}">
      <div class="form-group">
        <label for="newPassword">New Password</label>
        <input type="password" id="newPassword" name="newPassword" placeholder="Enter new password" required>
      </div>
      <div class="form-group">
        <label for="confirmPassword">Confirm Password</label>
        <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm your new password" required>
      </div>
      <button type="submit" class="btn">Update Password</button>
    </form>
  </div>
</body>
</html>