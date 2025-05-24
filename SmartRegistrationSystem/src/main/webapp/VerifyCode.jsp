<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Verify Code</title>
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
      box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
    }

    .container h1 {
      text-align: center;
      color: #133;
      margin-bottom: 30px;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      display: block;
      font-weight: bold;
      margin-bottom: 10px;
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
      box-shadow: 0 0 5px rgba(168, 28, 28, 0.5);
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
  </style>
</head>
<body>

  <div class="header">
    Smart Complaint Registration System
  </div>

  <div class="container">
    <h1>Enter Code</h1>
    <form action="ForgotPasswordServlet" method="POST">
      <div class="form-group">
        <label for="code">Enter the code sent to your email:</label>
        <input type="text" id="code" name="code" placeholder="Enter the code" required>
      </div>

      <button type="submit" class="btn">Verify Code</button>
    </form>
  </div>

</body>
</html>