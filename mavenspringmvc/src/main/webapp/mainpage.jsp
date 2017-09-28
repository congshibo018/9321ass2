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
  <link href="style.css" type="text/css" rel="stylesheet">
</head>
<script>
    function vote(mid,like) {
        var uid = ${currentUserId};
        //not finished yet
    }
</script>
<body><a href = "advancedSearch.jsp">advancedSearch</a>


<body>
  <nav class="navbar navbar-default">
    <div class="container">
      <a style="font-size: 25px;" class="navbar-brand" href="#">UNSWBook</a>
    </div>
  </nav>

  <div class="container">
    <div class="row">
      <div class="col-sm-2">
        <ul class="nav nav-pills">
          <li><a href="advancedsearch.jsp">Advanced Search</a></li>
        </ul>
      </div>

      <div class="col-sm-9">
        <form action="postMessage" method="POST" class="center-flex">
        <fieldset>
          <legend>Speak your mind here:</legend>
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
          <button type="submit" class="btn btn-default">Post</button>
        </fieldset>
      </form>
      <h1>Your Feed: </h1>
      <c:forEach items="${messageList}" var="messagelist">
        <div class="panel panel-default">
          <div class="panel-body">
            <div class="media">
              <div class="media-left media-middle">
                <img src="${messagelist.image}" class="media-object" style="height:130px; width:150px;">
              </div>
              <div class="media-body">
                <div>
                  <small class="left-text">${messagelist.thumbUp} Likes, ${messagelist.thumbDown} Dislikes</small>
                  <h4 class="media-heading">${messagelist.title} <small>Posted at ${messagelist.time}</small></h4>
                </div>
                <p>${messagelist.content}</p>
              </div>
            </div>
          </div>

          <div class="panel-footer">
            <a href="#">
              <span class="glyphicon glyphicon-thumbs-up">Like</span>
            </a>
            <a href="#">
              <span class="glyphicon glyphicon-thumbs-down">Dislike</span>
            </a>
          </div>          
        </div>
      </c:forEach>

      </div>
    </div>
  </div>

</body>

</html>