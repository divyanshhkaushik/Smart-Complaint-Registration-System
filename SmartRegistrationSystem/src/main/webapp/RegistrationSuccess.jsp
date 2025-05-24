<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Successful</title>
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
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .container h1 {
            color: #4CAF50;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .message {
            font-size: 18px;
            color: #333;
            margin-bottom: 20px;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: #a81c1c;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <div class="header">
        Registration Successful
    </div>

    <div class="container">
        <h1>Success!</h1>
        <p class="message">Your registration was successful. You can now log in to your account.</p>
        <a href="login.jsp" class="btn">Go to Login Page</a>
    </div>

</body>
</html>