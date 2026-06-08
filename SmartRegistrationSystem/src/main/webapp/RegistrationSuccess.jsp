<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Successful</title>
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
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
            text-align: center;
        }

        .container h1 {
            color: #27ae60;
            font-size: 2rem;
            margin-top: 0;
            margin-bottom: 20px;
            font-weight: 700;
        }

        .message {
            font-size: 1rem;
            color: #7f8c8d;
            margin-bottom: 30px;
            line-height: 1.5;
        }

        .btn {
            display: inline-block;
            padding: 12px 24px;
            font-size: 16px;
            font-weight: 600;
            font-family: 'Poppins', sans-serif;
            color: white;
            background-color: #3498db;
            text-decoration: none;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
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
        <h1>Success!</h1>
        <p class="message">Your registration was successful. You can now log in to your account.</p>
        <a href="login.jsp" class="btn">Go to Login Page</a>
    </div>

</body>
</html>