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
<script>
    function vote(mid,like) {
        var uid = ${currentUserId};
        //not finished yet
    }
</script>
<body><a href = "advancedSearch.jsp">advancedSearch</a>
<c:forEach var="messagelist" items="${messageList}">
    <tr>
        <td>${messagelist.title}</td>
    </tr>
    <tr>
        <td>${messagelist.content}</td>
    </tr>
    <tr>
        <td>${messagelist.image}</td>
    </tr>
    <tr>
        <td>${messagelist.time}</td>
    </tr>
    <tr>
        <td>${messagelist.thumbUp}</td>
    </tr>
    <tr>
        <td>${messagelist.thumbDown}</td>
    </tr>
    <button onclick="vote(${messagelist.id},1)"></button>
    <button onclick="vote(${messagelist.id},-1)"></button>
</c:forEach>
<c:if test="${role=='user'}">
<form action="postMessage" method="post">
    title:<input type = "text" name="title"><br>
    content:<input type = "text" name ="content"><br>
    url:<input type = "text" name ="url"><br>

    <input type="submit" value = "post"></form>
</c:if>
</body>
</html>
