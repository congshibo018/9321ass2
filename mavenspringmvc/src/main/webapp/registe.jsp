<%--
  Created by IntelliJ IDEA.
  User: congshibo
  Date: 22/9/17
  Time: 11:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Register | UNSWBook</title>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>

<body>

<nav class="navbar navbar-default">
  <div class="container">
    <a style="font-size: 25px;"class="navbar-brand" href="#">UNSWBook</a>
  </div>
</nav>

<div class="container">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h1 class="col-sm-offset-1">Register</h1>
    </div>
    <div class="panel-body">
      <form class="form-horizontal" action="/registe" method="POST">
        <div class="form-group">
          <label class="control-label col-sm-2" for="email">Email:</label>
          <div class="col-sm-5">
            <input type="email" class="form-control" id="email" placeholder="Enter email" name="emailAddress">
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-2" for="username">Username:</label>
          <div class="col-sm-5">
            <input type="text" class="form-control" id="username" placeholder="Enter username" name="username">
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-2" for="pwd">Password:</label>
          <div class="col-sm-5">          
            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="password">
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-2" for="name">Name:</label>
          <div class="col-sm-5">
            <input type="text" class="form-control" id="name" placeholder="Enter nickname" name="name">
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-2">Gender:</label>
          <div class="col-sm-5">
            <label class="radio-inline" id="gender">
              <input type="radio" name="gender" value="male">Male
            </label>
            <label class="radio-inline">
              <input type="radio" name="gender">Female
            </label>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-2" for="dob">Date of Birth:</label>
          <div class="col-sm-5">
            <input type="date" class="form-control" name="doB" id="dob" value="1990-01-01">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <input type="submit" class="btn btn-default" value="Register">
          </div>
        </div>
      </form>
    </div>
  </div>
</div>

</body>

</html>