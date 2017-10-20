<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <meta charset="utf-8">
    <title>Graph Search | UNSWBook</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="likes.js"></script>
    <script src="misc.js"></script>
    <link href="style.css" type="text/css" rel="stylesheet">
    <script>
        function changeInput(){
            var method =document.getElementById("methodChoose").value;
            if(method=="searchUserByName"||method=="searchMessageByTitle"||method=="searchFriendsOfFriends"){
                $("input[type='radio']").removeAttr('checked');
                document.getElementById("factor").type="text";
                document.getElementById("factor1").style.display="";
                document.getElementById("factor2").style.display="none";
            }
            if(method=="searchUserByDob"){
                $("input[type='radio']").removeAttr('checked');
                document.getElementById("factor").type="date";
                document.getElementById("factor1").style.display="";
                document.getElementById("factor2").style.display="none";
            }
            if(method=="searchUserByGender"){
                document.getElementById("factor").value="";
                document.getElementById("factor").type="text";
                document.getElementById("factor1").style.display="none";
                document.getElementById("factor2").style.display="";
            }
        }
    </script>
</head>
<body>
<nav>
    <div class="header-bar">
        <div class="container">
            <c:if test="${role=='user'}">
                <a href="mainpage.jsp" class="header-logo">UNSWBook</a>
            </c:if>
            <c:if test="${role=='admin'}">
                <a href="advancedSearch.jsp" class="header-logo">UNSWBook</a>
            </c:if>

            <button class="btn btn-default right-text logout-button" onclick="window.location.href='index.jsp'">Logout</button>
        </div>

    </div>
    <div class="header-strip">
    </div>
</nav>

<div id="content" class="container">
    <div class="row">
        <c:if test="${role=='user'}">
        <div class="col-sm-2">
            <div class="vertical-menu">
                <a href="mainpage.jsp">Main Page</a>
                <a href="advancedSearch.jsp">Advanced Search</a>
                <a href="getMyMessage">My Message</a>
                <a href="changeDetail.jsp">Change My Details</a>
                <a href="getNotification" id="notification">Notifications</a>
                <a href="index.jsp">Log out</a>
            </div>
        </div>
        </c:if>
        <c:if test="${role=='admin'}">
            <div class="col-sm-2">
                <div class="vertical-menu">
                    <a href="advancedSearch.jsp">Advanced Search</a>
                </div>
            </div>
        </c:if>
        <div class="col-sm-10">
            <div class="pane">
                <h1 class="col-sm-offset-1">Graph Search</h1>
                <br>
        <form class="form-horizontal" action="getGraph" method="POST">
            <div class="form-group">
                <label class="control-label col-sm-2" for="factor">Value:</label>
                <div class="col-sm-5" id="factor1">
                    <input type="text" class="form-control" id="factor" placeholder="Enter value" name="factor">
                </div>
                <div class="col-sm-5" style="display: none" id="factor2">
                    <label class="radio-inline">
                        <input type="radio" name="factor" value="male">Male
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="factor" value="female">Female
                    </label>
                </div>
                <select name="method" id="methodChoose" onchange="changeInput()">
                    <option value="searchUserByName">searchUserByName</option>
                    <option value="searchUserByDob">searchUserByDob</option>
                    <option value="searchMessageByTitle">searchMessageByTitle</option>
                    <option value="searchFriendsOfFriends">searchFriendsOfFriends</option>
                    <option value="searchUserByGender">searchUserByGender</option>
                </select>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="submit" class="btn btn-primary" value="Search">
                    <a href="index.jsp" class="btn btn-default">Cancel</a>
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