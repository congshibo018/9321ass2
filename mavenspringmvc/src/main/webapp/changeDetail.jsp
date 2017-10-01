<%--
  Created by IntelliJ IDEA.
  User: congshibo
  Date: 29/9/17
  Time: 4:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Change Details | UNSWBook</title>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <link href="style.css" type="text/css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Allerta" />
</head>

<body>

  <nav>
    <div class="header-bar">
      <div class="container">
        <a href="mainpage.jsp" class="header-logo">UNSWBook</a>
        <button class="btn btn-default right-text logout-button">Logout</button>
      </div>
    </div>
    <div class="header-strip">
    </div>
  </nav>

  <div id="content" class="container">
    <div class="row">
      <div class="col-sm-2">
        <div class="vertical-menu">
          <a href="mainpage.jsp">Main Page</a>
          <a href="advancedSearch.jsp">Advanced Search</a>
          <a href="myMessage.jsp">My Message</a>
          <a href="changeDetail.jsp">Change My Details</a>
          <a href="index.jsp">Log out</a>
        </div>
      </div>

      <div class="col-sm-10">
        <div class="well well-white">
          <h1 class="col-sm-offset-1">Update your details</h1>

          <form class="form-horizontal" action="changeUserDetail" method="POST" enctype="multipart/form-data">
            <div class="form-group">
              <label class="control-label col-sm-2" for="email">Email:</label>
              <div class="col-sm-5">
                <input type="email" class="form-control" id="email" placeholder="Enter email" name="emailAddress">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="pwd">Password:</label>
              <div class="col-sm-5">
                <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="password">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="name">Nickname:</label>
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
                    <input type="radio" name="gender" value="female">Female
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
              <label class="control-label col-sm-2" for="image">Profile picture:</label>
              <div class="col-sm-5">
                <input type="file" class="form-control" name="image" id="image">
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <input type="submit" class="btn btn-primary" value="Update Details">
                <a href="mainpage.jsp" class="btn btn-default">Cancel</a>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <footer>
    <p>COMP9321 Social Media Assignment</p><p class="right-text">UNSWBook</p>
  </footer>

</body>


</html>
