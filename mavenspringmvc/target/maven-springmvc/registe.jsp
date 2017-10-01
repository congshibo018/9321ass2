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
  <link href="style.css" type="text/css" rel="stylesheet">
</head>
<script>
  function check() {
      var email = document.getElementById("email").value;
      var username = document.getElementById("username").value;
      var password = document.getElementById("pwd").value;
      var name = document.getElementById("name").value;
      if(email==""){
          alert("email cannot be null");
          return false;
      }
      if(username==""){
          alert("username cannot be null");
          return false;
      }
      if(password==""){
          alert("password cannot be null");
          return false;
      }
      if(name==""){
          alert("name cannot be null");
          return false;
      }
  }
</script>
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
        <h1 class="col-sm-offset-2">Register</h1>
        <div class="register-strip"></div>
          <form class="form-horizontal" action="/registe" method="POST" onsubmit="return check()">
            <div class="form-group">
              <label class="control-label col-sm-2" for="email">Email:</label>
              <div class="col-sm-10">
                <input type="email" class="form-control" id="email" placeholder="Enter email" name="emailAddress">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="username">Username:</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="username" placeholder="Enter username" name="username">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="pwd">Password:</label>
              <div class="col-sm-10">          
                <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="password">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="name">Name:</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="name" placeholder="Enter nickname" name="name">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2">Gender:</label>
              <div class="col-sm-10">
                <label class="radio-inline" id="gender">
                  <input type="radio" name="gender" value="male" checked="checked">Male
                </label>
                <label class="radio-inline">
                  <input type="radio" name="gender" value="female">Female
                </label>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="dob">Date of Birth:</label>
              <div class="col-sm-10">
                <input type="date" class="form-control" name="doB" id="dob" value="1990-01-01">
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
              <input type="submit" class="btn btn-default" value="Register">
              <a href="index.jsp" class="btn btn-default">Cancel</a>
            </div>
          </div>
        </form>
      </div>
      <div class="col-sm-7">
        <img class="img-responsive" src="unsw-register.jpg">
      </div>
    </div>
  </div>
</div>

  <footer>
    <p>COMP9321 Social Media Assignment</p><p class="right-text">UNSWBook</p>
  </footer>


</body>

</html>