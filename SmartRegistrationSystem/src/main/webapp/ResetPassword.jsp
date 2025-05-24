<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reset Password</title>
  <style>
    body {
      font-family: Arial, Helvetica, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f8f8f8;
    }

    .header {
      background-color: #a81c1c;
      color: white;
      padding: 15px 20px;
      text-align: center;
      font-size: 24px;
    }

    .container {
      max-width: 500px;
      margin: 50px auto;
      padding: 20px;
      background: white;
      border: 1px solid #ddd;
      border-radius: 8px;
    }

    .form-group {
      margin-bottom: 15px;
    }

    .form-group label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
    }

    .form-group input {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    .btn {
      width: 100%;
      padding: 10px;
      background-color: #a81c1c;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    .btn:hover {
      background-color: #901717;
    }
  </style>
</head>
<body>
  <div class="header">
    Reset Your Password
  </div>
  <div class="container">
    <h1>Reset Password</h1>
    <form action="ResetPasswordServlet" method="POST">
      <input type="hidden" name="email" value="${email}">
      <div class="form-group">
        <label for="newPassword">New Password:</label>
        <input type="password" id="newPassword" name="newPassword" required>
      </div>
      <div class="form-group">
        <label for="confirmPassword">Confirm Password:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required>
      </div>
      <button type="submit" class="btn">Update Password</button>
    </form>
  </div>
</body>
</html>