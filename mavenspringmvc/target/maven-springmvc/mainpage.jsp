<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: congshibo
  Date: 22/9/17
  Time: 12:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>mainpage</title>
</head>
<body>
<c:forEach var="messagelist" items="${messageList}">
    <tr>
        <td>${messagelist.title}</td>
    </tr>
</c:forEach>
</body>
</html>
