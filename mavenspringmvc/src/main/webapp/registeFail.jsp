<%--
  Created by IntelliJ IDEA.
  User: congshibo
  Date: 22/9/17
  Time: 2:50 PM
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

<body>

  <nav>
    <div class="header-bar">
      <div class="container">
        <a href="index.jsp" class="header-logo">UNSWBook</a>
      </div>

    </div>
    <div class="header-strip">
    </div>
  </nav>


<div class="container">
  <div class="alert alert-danger">
    <strong>Registration Failed!</strong> ${failReason} already exists
  </div>
  <div class="panel panel-default">
    <div class="panel-body">
      <p>It appears that your registration has failed.</p> 
      <p>No Fear! You can always try again!</p>
    </div>
  </div>
  <a href="registe.jsp" class="btn btn-primary">Try Again</a>
</div>

  <footer>
    <p>COMP9321 Social Media Assignment</p><p class="right-text">UNSWBook</p>
  </footer>


</body>

</html>