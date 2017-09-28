<%--
  Created by IntelliJ IDEA.
  User: congshibo
  Date: 27/9/17
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>adminLogin</title>
</head>
<body>
<form action="login" method="post">
    <input type = "text" name="username">
    <input type = "text" name ="password">
    <input type="hidden" name="role" value="admin">
    <input type="submit" value = "login">
</form>
</body>
</html>
