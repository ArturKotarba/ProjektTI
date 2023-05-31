<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="rejestracja_logowanie.css">
</head>
<body>
<div class="wrapper">
    <h2>Login</h2>
    <form action="login" method="post">
        <div class="input-box">
            <input type="text" name="uname" placeholder="User Name" required>
        </div>
        <div class="input-box">
            <input type="password" name="password" placeholder="Password" required>
        </div>
        <div class="input-box button">
            <input type="Submit" value="Login">
        </div>
    </form>
</div>
</body>
</html>



