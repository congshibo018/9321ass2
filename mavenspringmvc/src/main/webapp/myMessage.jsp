<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: congshibo
  Date: 29/9/17
  Time: 4:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>My Message | UNSWBook</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="likes.js"></script>
    <link href="style.css" type="text/css" rel="stylesheet">
</head>
<script type="text/javascript" src="jquery-easyui-v1.4.4/jquery.min.js"></script>

<script type="text/javascript">
    setInterval(function(){
        getMsgNum();
    },3000);

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
            <ul class="nav nav-pills">
                <li><a href="advancedSearch.jsp">Advanced Search</a></li>
            </ul>
            <ul class="nav nav-pills">
                <li><a href="getMyMessage">My Message</a></li>
            </ul>
            <ul class="nav nav-pills">
                <li><a href="changeDetail.jsp">Change My Details</a></li>
            </ul>
            <ul class="nav nav-pills">
                <li><a href="getNotification" id="notification">Notifications</a></li>
            </ul>
            <ul class="nav nav-pills">
                <li><a href="index.jsp">Log out</a></li>
            </ul>
        </div>
      </div>
      <div class="col-sm-10">
        <div class="pane">
          <h1>Your Messages: </h1>
        </div>
        <c:forEach items="${myMessageList}" var="messagelist" varStatus="loop">
          <div class="panel panel-default">
            <div class="panel-body">
              <div class="media">
                <div class="media-left media-middle">
                  <img src="${messagelist.image}" class="media-object" style="height:130px; width:150px;">
                </div>
                <div class="media-body">
                  <small id="cnt_${loop.index}" class="right-text">${messagelist.thumbUp} Likes, ${messagelist.thumbDown} Dislikes</small>
                  <h4 class="media-heading">${messagelist.title} <small>Posted at ${messagelist.time}</small></h4>
                  <p>${messagelist.content}</p>
                </div>
              </div>
            </div>

          </div>
        </c:forEach>

      </div>
    </div>
  </div>

  <footer>
    <p>COMP9321 Social Media Assignment</p><p class="right-text">UNSWBook</p>
  </footer>


</body>
</html>
