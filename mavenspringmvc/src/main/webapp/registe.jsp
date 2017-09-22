<%--
  Created by IntelliJ IDEA.
  User: congshibo
  Date: 22/9/17
  Time: 11:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registe</title>
</head>
<body>
<h2>Registe</h2>
<form action="registe" method="post">
    username:<input type = "text" name="username"><br>
    password:<input type = "text" name ="password"><br>
    nickname:<input type = "text" name ="name"><br>
    gender:<input type = "radio" name = "gender" value = "male" checked>
    <input type = "radio" name = "gender" value = "female"><br>
    dob:<input type = "date" name = "doB" value="1990-2-1"><br>
    email:<input type = "email" name = "emailAddress"><br>
    <input type="submit" value = "registe">
</form>

</body>
</html>
