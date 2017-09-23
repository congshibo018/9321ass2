<%--
  Created by IntelliJ IDEA.
  User: congshibo
  Date: 23/9/17
  Time: 11:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AdvancedSearch</title>
</head>
<body>
<form action="advancedSearch" method="post">
    nickname:<input type = "text" name="nickname"><br>
    gender:<input type = "radio" name = "gender" value = "male" checked>
    <input type = "radio" name = "gender" value = "female"><br>
    dob:<input type = "date" name = "doB" value="1990-2-1"><br>
    email:<input type = "email" name = "emailAddress"><br>
    <input type="submit">
</form>
</body>
</html>
