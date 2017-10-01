<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: congshibo
  Date: 30/9/17
  Time: 4:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Advanced Search | UNSWBook</title>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <link href="style.css" type="text/css" rel="stylesheet">
</head>
<script type="text/javascript" src="jquery-easyui-v1.4.4/jquery.min.js"></script>

<script type="text/javascript">
    setInterval(function(){
        getMsgNum();
    },3000);

    function delNotification(id) {
      $.ajax({
        url:'delete?item=notification&id='+id,
        type:'POST',

      });
      return false;
    }

    function getMsgNum(){
        $.ajax({
            url:'PollingNotification',
            type:'post',
            dataType:'json',
            success:function(data){
                if(data && data.msgNum){
                    $("#notification").html("Unread notification("+data.msgNum+")");
                }else{
                    $("#notification").html("Notification");
                }
            }
        });
    }

</script>
<body>
  <nav>
    <div class="header-bar">
      <div class="container">
        <a href="mainpage.jsp" class="header-logo">UNSWBook</a>
          <button class="btn btn-default right-text logout-button" onclick="window.location.href('index.jsp')">Logout</button>
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
          <a href="getMyMessage">My Message</a>
          <a href="changeDetail.jsp">Change My Details</a>
          <a href="index.jsp">Log out</a>
        </div>
      </div>
      <div class="col-sm-10">
        <div class="well well-white">
          <h1>Your Notifications: </h1>
          <c:forEach items="${notificationList}" var="notificationlist" varStatus="loop">
            <div class="alert alert-info alert-dismissable">
              <a href="#" onclick="delNotification(${notificationlist.id})" class="close" data-dismiss="alert" aria-label="close">&times;</a>
              <strong>${notificationlist.title}</strong>
              <p>${notificationlist.text}</p>
              <p><small>Received at ${notificationlist.time}</small></p>
            </div>
          </c:forEach>
        </div>
      </div>
    </div>
  </div>

  <footer>
    <p>COMP9321 Social Media Assignment</p><p class="right-text">UNSWBook</p>
  </footer>

</body>
</html>
