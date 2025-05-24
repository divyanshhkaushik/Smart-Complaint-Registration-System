<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign Up</title>
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
      box-shadow: 0 0 0 0;
      border-radius: 8px;
    }

    .container h1 {
      text-align: center;
      color: #133;
      margin-bottom: 30px;
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
      text-decoration: none;
      color: #a81c1c;
    }
  </style>
</head>
<body>

  <div class="header">
    Smart Complaint Registration System
  </div>

  <div class="container">
    <h1>Sign Up</h1>
    <form action="SignUpServlet" method="post" onsubmit="return validateForm()">
      <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" placeholder="Enter your email" required>
      </div>

      <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" placeholder="Enter your password" required>
      </div>

      <div class="form-group">
        <label for="confirm-password">Confirm Password:</label>
        <input type="password" id="confirm-password" name="confirm-password" placeholder="Re-enter your password" required>
      </div>

      <button type="submit" class="btn">Sign Up</button>
    </form>

    <div class="links">
      <a href="login.jsp">Already have an account? Login</a>
    </div>
  </div>

  <script>
    function validateForm() {
      const password = document.getElementById("password").value;
      const confirmPassword = document.getElementById("confirm-password").value;

      if (password !== confirmPassword) {
        alert("Passwords do not match!");
        return false;
      }
      return true;
    }
  </script>

</body>
</html>