<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - EduTest</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');
        
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }

        .header {
            text-align: center;
            color: white;
            height: 220px;
            background: linear-gradient(135deg, #6db3f2, #1e88e5);
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 0 0 20px 20px;
            font-size: 34px;
            font-weight: 600;
        }

        .nav {
            display: flex;
            justify-content: center;
            background-color: #ffffff;
            padding: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
            border-radius: 10px;
            margin: 20px auto;
            width: 90%;
        }

        .nav a {
            color: #1e88e5;
            text-decoration: none;
            padding: 12px 20px;
            margin: 0 15px;
            font-size: 18px;
            font-weight: 500;
            transition: 0.3s;
            border-radius: 8px;
        }

        .nav a:hover {
            background-color: #1e88e5;
            color: white;
            transform: scale(1.05);
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 40px auto;
            text-align: center;
        }

        .box {
            background-color: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
            margin: 20px 0;
            transition: 0.3s;
        }

        .box:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        .box h2 {
            font-size: 26px;
            color: #1e88e5;
        }

        .box p, .box ul {
            font-size: 18px;
            line-height: 1.6;
            color: #555;
        }

        .box ul {
            list-style: none;
            padding: 0;
        }

        .box ul li {
            padding: 8px 0;
        }

        .footer {
            text-align: center;
            padding: 20px;
            background-color: #f1f1f1;
            color: #555;
            font-size: 16px;
            margin-top: 40px;
            border-radius: 10px;
        }
    </style>
</head>
<body>

    <div class="header">
        About EduTest - Online Exam Portal
    </div>

    <div class="nav">
        <a href="homepage.jsp">Home</a>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
        <a href="adminlogin.jsp">AdminLogin</a>
        <a href="about.jsp">About</a>
    </div>

    <div class="container">
        <div class="box">
            <h2>Who We Are</h2>
            <p>EduTest is a modern online examination platform designed to help students and professionals assess their skills through interactive tests. We provide a seamless and efficient way to conduct and participate in exams online.</p>
        </div>

        <div class="box">
            <h2>Our Mission</h2>
            <p>Our mission is to make learning and assessment accessible, effective, and engaging for everyone. We aim to provide an easy-to-use, secure, and reliable online test-taking experience.</p>
        </div>

        <div class="box">
            <h2>Why Choose EduTest?</h2>
            <ul>
                <li>✔ Wide range of test categories</li>
                <li>✔ Instant results and performance analysis</li>
                <li>✔ Secure and fair testing environment</li>
                <li>✔ User-friendly interface</li>
                <li>✔ Flexible test scheduling</li>
            </ul>
        </div>

        <div class="box">
            <h2>Contact Us</h2>
            <p>If you have any questions or need support, feel free to contact us.</p>
        </div>
    </div>

    <div class="footer">
        © 2025 EduTest | All Rights Reserved
    </div>

</body>
</html>
