<%--
  Created by IntelliJ IDEA.
  User: congshibo
  Date: 16/10/17
  Time: 1:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Graph Search</title>
</head>
<body>
<div class="col-sm-10">
    <div class="pane">
        <h1 class="col-sm-offset-1">Advanced Search</h1>
        <br>
        <form class="form-horizontal" action="getGraph" method="POST">
            <div class="form-group">
                <label class="control-label col-sm-2" for="factor">Value:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="factor" placeholder="Enter nickname" name="factor">
                </div>
            </div>
            <select name="method">
                <option value="searchUserByName">searchUserByName</option>
                <option value="searchUserByDob">searchUserByDob</option>
                <option value="searchMessageByTitle">searchMessageByTitle</option>
                <option value="searchFriendsOfFriends">searchFriendsOfFriends</option>
                <option value="searchUserByGender">searchUserByGender</option>
            </select>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="submit" class="btn btn-primary" value="Search">
                    <a href="index.jsp" class="btn btn-default">Cancel</a>
                </div>
            </div>

        </form>
    </div>
</div>
</body>
</html>
