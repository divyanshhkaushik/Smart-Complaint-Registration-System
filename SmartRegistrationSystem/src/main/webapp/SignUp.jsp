<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign Up</title>
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

    .links {
      text-align: center;
      margin-top: 20px;
    }

    .links a {
      text-decoration: none;
      color: #3498db;
      font-weight: 600;
      font-size: 0.9rem;
      transition: color 0.3s;
    }

    .links a:hover {
      color: #2980b9;
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