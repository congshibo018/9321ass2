<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>UNSWBook</title>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <link href="style.css" type="text/css" rel="stylesheet">
</head>

<body>

<nav class="jumbotron jumbo-custom" style="text-align:center;">
  <h1>UNSWBook</h1>
  <p>The social solution for UNSW students</p>
</nav>
<div class="header-strip"></div>

<div class="container">
  <div class="well well-white">
    <div class="center-text" style="margin-bottom: 40px;">
      <h3>Here at UNSWBook, we aim to make your university life a pleasant one!</h3> 
      <h3>Join Us or Login now with UNSWBook!</h3>
    </div>
    <hr>

    <ul class="nav nav-tabs nav-justified">
      <li class="active"><a data-toggle="tab" href="#home">Register</a></li>
      <li><a data-toggle="tab" href="#menu1">Login</a></li>
      <li><a data-toggle="tab" href="#menu2">Admin</a></li>  
    </ul>

    <div class="tab-content">
      <div id="home" class="tab-pane fade in active center-text">
        <br>
        <h3>Register</h3>
        <p>Intended for the uninitiated. Click the button below to begin your Registration process!</p>
        <a href="registe.jsp" class="btn btn-success" role="button">Register</a>
      </div>
      <div id="menu1" class="tab-pane fade center-text">
        <br>
        <h3>Login</h3>
        <p>For those who already have an account. Click the button below to Login!</p>
        <a href="login.jsp" class="btn btn-primary" role="button">Login</a>        
      </div>
      <div id="menu2" class="tab-pane fade center-text">
        <br>
        <h3>Admin</h3>
        <p>Usage for those who have privileged access.</p>
        <a href="adminLogin.jsp" class="btn btn-danger" role="button">adminLogin</a>
      </div>
    </div>
  </div>

</div>

  <footer>
    <p>COMP9321 Social Media Assignment</p><p class="right-text">UNSWBook</p>
  </footer>

</body>

</html>