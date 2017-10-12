<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%--
  Created by IntelliJ IDEA.
  User: congshibo
  Date: 22/9/17
  Time: 12:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>Mainpage | UNSWBook</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <script src="likes.js"></script>
  <script src="misc.js"></script>
  <link href="style.css" type="text/css" rel="stylesheet">
</head>
<script>
    function check() {
        var title = document.getElementById("title").value;
        var content = document.getElementById("content").value;
        var url = document.getElementById("url").value;
        var image = document.getElementById("image").value;
        if(title==""&&content==""&&url==""&&image==""){
            alert("you can't post NOTHING");
            return false;
        }
    }
</script>
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
        <a href="showMessage" class="header-logo">UNSWBook</a>
        <button class="btn btn-default right-text logout-button" onclick="window.location.href='index.jsp'">Logout</button>
      </div>

    </div>
    <div class="header-strip">
    </div>
  </nav>

  <div  class="container">
    <div class="row">
      <c:if test="${role=='user'}">
      <div class="col-sm-2">
        <div class="vertical-menu">
          <a href="showMessage">Main Page</a>
          <a href="advancedSearch.jsp">Advanced Search</a>
          <a href="getMyMessage">My Message</a>
          <a href="changeDetail.jsp">Change My Details</a>
          <a href="getNotification" id="notification">Notifications</a>
          <a href="index.jsp">Log out</a>
        </div>
      </div>
      </c:if>
      <div class="col-sm-10">
        <div class="pane">
          <a href="#" id="postTogg" class="postTogg">Make a comment!</a>

          <form action="postMessage" method="POST" class="center-flex" enctype="multipart/form-data" onsubmit="return check()">
          <hr>
            <div class="form-group center-flex">
              <label for="title">Post title:</label>
              <input type="text" name="title" class="form-control" id="title">
            </div>
            <div class="form-group center-flex">
              <label for="content">Post:</label>
              <textarea name="content" class="form-control" rows="3" id="content"></textarea>
            </div>
            <div class="form-group center-flex">
              <label for="url">URL:</label>
              <input type="text" name="url" class="form-control" id="url">
            </div>
            <div class="form-group center-flex">
                <label for="url">Image:</label>
                <input type="file" name="image" class="form-control" id="image">
            </div>
            <button type="submit" class="btn btn-primary">Post</button>
            <a href="#" class="btn btn-default" id="postCancel">Cancel</a>
          </form>
        </div>      

        <h1>Your Feed: </h1>
      <c:forEach items="${messageList}" var="messagelist" varStatus="loop">
        <div class="panel panel-default">
          <div class="panel-body">
            <div class="media">
              <div class="media-left media-middle">
                <img src="${messagelist.image}" class="media-object" style="height:130px; width:150px;">
              </div>
              <div class="media-body">
                <div>
                  <small id="cnt_${loop.index}" class="right-text">${messagelist.thumbUp} Likes, ${messagelist.thumbDown} Dislikes</small>
                  <h4 class="media-heading">${messagelist.title} <small>Posted at ${messagelist.time}</small></h4>
                </div>
                <p>${messagelist.content}</p>
              </div>
            </div>
          </div>

          <div id="msg_${loop.index}" data-active-state="${voteList[loop.index].thumbUp}" mid="${messagelist.id}" class="panel-footer center-text">
            <a class="thumbIcon" href="#">
              <span class="glyphicon glyphicon-thumbs-up">Like</span>
            </a>
            <a class="thumbIcon" href="#">
              <span class="glyphicon glyphicon-thumbs-down">Dislike</span>
            </a>
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