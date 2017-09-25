<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: congshibo
  Date: 23/9/17
  Time: 4:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SearchResult</title>
</head>
<body>
<c:forEach var="result" items="${userlist}">
    <tr>
        <td><a href="showUserDetail?uid=${result.id}">${result.name}</a>
        </td><br>
    </tr>
</c:forEach>
</body>
</html>
