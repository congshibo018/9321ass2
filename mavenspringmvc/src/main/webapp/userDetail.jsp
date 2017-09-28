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
<script type="text/javascript">
    function showButton() {
        var role = ${role};
        if (role===("user")){
            var isFriend = ${isFriend};
            if (isFriend==true){
                document.getElementById("addFriendButton").style.display="none";
                }
        }
        if (role===("admin")){
            var isBanned = ${isBanned};
            if (isBanned==true){
                document.getElementById("banUserButton").style.display="none";
            }
        }
    }
    function addFriend(){
        location.href="addFriend?fid=${user.id}";
        alert("friend request send");
    }

    function changeUserStatus() {
        alert("a");
        location.href="changeUserStatus?uid=${user.id}";
        alert("user status changed");
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

<c:if test="${role=='admin'}">
    <t2>activity</t2>
    <c:forEach var="activitylist" items="${activityList}">
        <tr>
            <td>${activitylist.activity}</td>
        </tr>
        <tr>
            <td>${activitylist.time}</td>
        </tr>
    </c:forEach>

    <button id="banUserButton" onclick="changeUserStatus()">ban this user</button>
</c:if>
<c:if test="${role=='user'}">
    <button id="addFriendButton" onclick="addFriend()">add friend</button>
</c:if>
</body>


</html>
