<%--
  Created by IntelliJ IDEA.
  User: congshibo
  Date: 21/9/17
  Time: 10:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Login | UNSWBook</title>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <link href="style.css" type="text/css" rel="stylesheet">
</head>

<body>
  <nav>
    <div class="header-bar">
      <div class="container">
        <a href="#" class="header-logo">UNSWBook</a>
      </div>

    </div>
    <div class="header-strip">
    </div>
  </nav>


<div class="container">
  <div class="well well-white">
    <div class="row">
      <div class="col-sm-5">
        <h1 class="col-sm-offset-2">Login</h1>
          <div class="login-strip"></div>
          <form class="form-horizontal" action="login" method="POST">
            <div class="form-group">
              <label class="control-label col-sm-2" for="username">Username:</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="username" placeholder="Enter username" name="username">
              </div>
            </div>
            <input type="hidden" name="role" value="user">
            <div class="form-group">
              <label class="control-label col-sm-2" for="pwd">Password:</label>
              <div class="col-sm-10">
                <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="password">
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <input type="submit" class="btn btn-primary" value = "Login">
                <a href="index.jsp" class="btn btn-default">Cancel</a>
              </div>
            </div>
          </form>
      </div>
      <div class="col-sm-7">
        <img class="img-responsive" src="unsw-login.jpg">
      </div>
    </div>
  </div>
</div>

  <footer>
    <p>COMP9321 Social Media Assignment</p><p class="right-text">UNSWBook</p>
  </footer>

</body>

</html>