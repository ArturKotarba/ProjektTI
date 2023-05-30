<%--
  Created by IntelliJ IDEA.
  User: Karolina
  Date: 04.05.2023
  Time: 01:58
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Registration</title>
    <link rel="stylesheet" href="rejestracja_logowanie.css">
</head>
<body>
<div class="wrapper">
    <h2>Registration</h2>
    <form action="register" method="post">
        <div class="input-box">
            <input type="text" name="uname" placeholder="Enter your User Name" required>
        </div>
        <div class="input-box">
            <input type="password" name="password" placeholder="Create password" required>
        </div>
        <div class="input-box">
            <input type="text" name="email" placeholder="Enter your email" required>
        </div>
        <div class="input-box">
            <input type="text" name="phone" placeholder="Phone Number" required>
        </div>
        <div class="input-box button">
            <input type="Submit" value="Register Now">
        </div>
    </form>
</div>
</body>
</html>
