<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduTest - Home</title>
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
            position: relative;
            text-align: center;
            color: white;
            height: 220px;
            background: linear-gradient(135deg, #6db3f2, #1e88e5);
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 0 0 20px 20px;
        }

        .header h1 {
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

        .intro {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-wrap: wrap;
            gap: 40px;
            text-align: left;
            padding: 40px 20px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .intro img {
            width: 40%;
            max-width: 450px;
            border-radius: 12px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.15);
        }

        .intro-text {
            max-width: 500px;
        }

        .features {
            margin-top: 40px;
            text-align: center;
        }

        .features h2 {
            font-size: 28px;
            margin-bottom: 20px;
        }

        .feature-list {
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
            margin-top: 20px;
        }

        .feature-item {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
            width: 260px;
            text-align: center;
        }

        .btn {
            background: #1e88e5;
            color: white;
            padding: 14px 24px;
            text-decoration: none;
            font-size: 18px;
            font-weight: bold;
            border-radius: 8px;
            display: inline-block;
            margin-top: 20px;
            transition: 0.3s;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .btn:hover {
            background: #1565c0;
            transform: scale(1.05);
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
        <h1>Welcome to EduTest - Online Exam Portal</h1>
    </div>

    <div class="nav">
        <a href="homepage.jsp">Home</a>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
        <a href="adminlogin.jsp">AdminLogin</a>
        <a href="about.jsp">About</a>
    </div>

    <div class="container">
        <div class="intro">
            <img src="imgs/intro1.avif" alt="Online Exam">
            <div class="intro-text">
                <h2>Take Online Tests & Improve Your Skills</h2>
                <p>EduTest provides an easy-to-use platform for online tests, assessments, and skill evaluation. Enhance your knowledge with our extensive test library.</p>
                <a href="register.jsp" class="btn">Get Started</a>
            </div>
        </div>

        <div class="features">
            <h2>Why Choose EduTest?</h2>
            <div class="feature-list">
                <div class="feature-item">
                    <h3>📚 Wide Range of Tests</h3>
                    <p>Choose from multiple subjects to enhance your skills.</p>
                </div>
                <div class="feature-item">
                    <h3>⚡ Instant Results</h3>
                    <p>Get quick analysis and feedback on your performance.</p>
                </div>
                <div class="feature-item">
                    <h3>🔒 Secure & Reliable</h3>
                    <p>Our platform ensures a safe and seamless experience.</p>
                </div>
            </div>
        </div>
    </div>

    <div class="footer">
        © 2025 EduTest | All Rights Reserved
    </div>

</body>
</html>
