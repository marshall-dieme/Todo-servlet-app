<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SarataTech Servlet</title>
</head>
<body>
    
    <h1>Welcome to STS</h1>

    <form action="/login.do" method="post">
        Username : <input type="text" name="username" />
        Password : <input type="password" name="password" />
        <input type="submit" name="login" value="Login" />
    </form>
</body>
</html>