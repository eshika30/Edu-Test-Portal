<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Registration - EduTest</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: url('imgs/back_login1.avif') no-repeat center center/cover;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            width: 400px;
            border-radius: 12px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #1e88e5;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
            transition: 0.3s;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus {
            border-color: #1e88e5;
            box-shadow: 0 0 8px rgba(30, 136, 229, 0.3);
            outline: none;
        }

        input[type="submit"] {
            width: 100%;
            background: linear-gradient(135deg, #6db3f2, #1e88e5);
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 18px;
            cursor: pointer;
            transition: 0.3s;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        input[type="submit"]:hover {
            background: linear-gradient(135deg, #1e88e5, #1565c0);
            transform: scale(1.05);
        }

        .footer {
            margin-top: 15px;
        }

        .footer a {
            color: #1e88e5;
            text-decoration: none;
            font-weight: 500;
            transition: 0.3s;
        }

        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Admin Registration</h2>
        <form action="AdminRegisterServlet" method="POST">
            <input type="text" name="Fullname" placeholder="Enter Your Full Name" required>
            <input type="email" name="email" placeholder="Enter Your Email" required>
            <input type="text" name="mobile" placeholder="Enter Your Mobile Number" required>
            <input type="password" name="password" placeholder="Enter Your Password" required>
            <input type="password" name="confirmpassword" placeholder="Confirm Your Password" required>
            <input type="submit" value="Register">
        </form>
        <div class="footer">
            <p>Already have an account? <a href="adminlogin.jsp">Login here</a></p>
        </div>
    </div>

</body>
</html>
