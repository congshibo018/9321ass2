<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: congshibo
  Date: 25/9/17
  Time: 11:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>User Details | UNSWBook</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <link href="style.css" type="text/css" rel="stylesheet">
</head>
<script type="text/javascript">
function showButton() {
  var role = "${role}";
  if (role === ("user")) {
    var isFriend = "${isFriend}";
    var currentUserId = "${currentUserId}";
    var userId = "${user.id}";
    if (isFriend == "true"||currentUserId==userId) {
      document.getElementById("addFriendButton").style.display = "none";
    }
  }
  if (role === ("admin")) {
    var isBanned = "${isBanned}";
    if (isBanned == "true") {
        document.getElementById("banUserButton").innerHTML="Ban";
    }else {
        document.getElementById("banUserButton").innerHTML="Unban";
    }
  }
}

function addFriend() {
  location.href = "addFriend?fid=${user.id}";
  alert("friend request send");
}

function changeUserStatus() {
  location.href = "changeUserStatus?uid=${user.id}";
  alert("user status changed");
}
</script>

<body onload="showButton()">
  <nav>
    <div class="header-bar">
      <div class="container">
        <a href="#" class="header-logo">UNSWBook</a>
        <button class="btn btn-default right-text logout-button">Logout</button>
      </div>

    </div>
    <div class="header-strip">
    </div>
  </nav>

  <div id="content" class="container">
    <div class="row">
      <div class="col-sm-2">
        <div class="vertical-menu">
          <a href="mainpage.jsp">Main Page</a>
          <a href="advancedSearch.jsp">Advanced Search</a>
          <a href="myMessage.jsp">My Message</a>
          <a href="changeDetail.jsp">Change My Details</a>
          <a href="index.jsp">Log out</a>
        </div>
      </div>
      <div class="col-sm-10">
        <div class="well well-white" style="margin-bottom: 10px;">
          <h2>${user.name}</h2>
          <h4>UID: ${user.id}</h4>
          <img src="${user.photo}" class="media-object" style="height:130px; width:150px; margin-bottom: 10px;">
          <c:if test="${role=='admin'}">
            <button class="btn btn-danger" id="banUserButton" onclick="changeUserStatus()">Ban User</button>
          </c:if>
          
          <c:if test="${role=='user'}">
            <button class="btn btn-success" id="addFriendButton" onclick="addFriend()">Add Friend</button>
          </c:if>
        </div>

        <div class="row">
          <div class="col-sm-8">
            <h2>Feed for User:</h2>
            <c:forEach items="${messageList}" var="messagelist">
              <div class="panel panel-default">
                <div class="panel-body">
                  <div class="media">
                    <div class="media-left media-middle">
                      <img src="${messagelist.image}" class="media-object" style="height:130px; width:150px;">
                    </div>
                    <div class="media-body">
                      <h4 class="media-heading">${messagelist.title} <small>Posted at ${messagelist.time}</small></h4>
                      <p>${messagelist.content}</p>
                    </div>
                  </div>
                </div>

                <div class="panel-footer center-text">
                  ${messagelist.thumbUp} Likes, ${messagelist.thumbDown} Dislikes
                </div>

              </div>
            </c:forEach>
          </div>
        
          <div class="col-sm-4">
            <c:if test="${role=='admin'}">
              <h2>User Activity:</h2>
              <ul class="list-group">
                <c:forEach var="activitylist" items="${activityList}">
                  <li class="list-group-item">
                    <h4 class="list-group-heading">${activitylist.activity}</h4>
                    <p class="list-group-item-text">${activitylist.time}</p>
                  </li>
                </c:forEach>
              </ul>
            </c:if>
          </div>
        </div>
      </div>
    </div>
  </div>

  <footer>
    <p>COMP9321 Social Media Assignment</p><p class="right-text">UNSWBook</p>
  </footer>

</body>

</html>