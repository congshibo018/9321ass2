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

<body>
  <nav class="navbar navbar-default">
    <div class="container">
      <a style="font-size: 25px;" class="navbar-brand" href="mainpage.jsp">UNSWBook</a>
    </div>
  </nav>

  <div class="container">
    <div class="row">
      <div class="col-sm-2">
        <ul class="nav nav-pills">
          <li><a href="advancedSearch.jsp">Advanced Search</a></li>
        </ul>
        <ul class="nav nav-pills">
          <li><a href="myMessage.jsp">My Message</a></li>
        </ul>
        <ul class="nav nav-pills">
          <li><a href="changeDetail.jsp">Change My Details</a></li>
        </ul>
        <ul class="nav nav-pills">
          <li><a href="login.jsp">Log out</a></li>
        </ul>
      </div>

      <div class="col-sm-9">
        <h1>Users found: </h1>
        <c:forEach items="${userlist}" var="userList">
          <div class="list-group">
            <a href="showUserDetail?uid=${userList.id}" class="list-group-item">
              <h5 class="list-group-item-heading">Username: ${userList.name}</h5>
              <p class="list-group-item-text">User ID: ${userList.id}</p>
            </a>
          </div>
        </c:forEach>


      </div>
    </div>
  </div>

</body>

</html>