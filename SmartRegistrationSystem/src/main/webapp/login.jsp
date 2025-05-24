<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Smart Complaint Registration - Login</title>
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

    .container h1 {
      text-align: center;
      color: #133;
      margin-bottom: 20px;
    }

    .form-group {
      margin-bottom: 15px;
    }

    .form-group label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
      color: #555;
    }

    .form-group input {
      width: 100%;
      padding: 10px;
      font-size: 14px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    .form-group input:focus {
      border-color: #a81c1c;
      outline: none;
    }

    .btn {
      width: 100%;
      padding: 10px;
      font-size: 16px;
      color: white;
      background-color: #a81c1c;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    .btn:hover {
      background-color: #901717;
    }

    .links {
      text-align: center;
      margin-top: 15px;
    }

    .links a {
      color: #a81c1c;
      text-decoration: none;
    }

    .admin-link {
      text-align: center;
      margin-top: 20px;
    }

    .admin-link a {
      color: white;
      text-decoration: none;
      background-color: #a81c1c;
      padding: 10px 20px;
      border-radius: 5px;
      font-weight: bold;
      display: inline-block;
    }

    .admin-link a:hover {
      background-color: #901717;
    }
  </style>
</head>
<body>
  <div class="header">
    Smart Complaint Registration System
  </div>

  <div class="container">
    <h1>Login</h1>
    <form action="loginServlet" method="POST">
      <div class="form-group">
        <label for="email">Email</label>
        <input type="text" id="email" name="email" placeholder="Enter your email" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter your password" required>
      </div>

      <button type="submit" class="btn">Login</button>
    </form>

    <div class="links">
      <a href="ForgotPassword.jsp">Forgot Password?</a> | <a href="SignUp.jsp">Sign Up</a>
    </div>

    <div class="admin-link">
      <a href="AdminLogin.jsp">Are you an Admin? Login</a>
    </div>
  </div>
</body>
</html>