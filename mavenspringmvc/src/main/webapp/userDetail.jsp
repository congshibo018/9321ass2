<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: congshibo
  Date: 25/9/17
  Time: 11:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>userDetail</title>
</head>
<script>
    function addFriend(){
        location.href="addFriend?fid=${user.id}";
        alert("friend request send")
    }
    function showButton() {
        var isFriend = ${isFriend}
        if (isFriend==true){
            document.getElementById("addFriendButton").style.display="none"
        }
    }
</script>
<body onload="showButton()">
${user.id}
${user.name}
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
</c:forEach>
<button id="addFriendButton"onclick="addFriend()">add friend</button>
</body>

</html>
