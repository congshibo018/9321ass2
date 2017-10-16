<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: congshibo
  Date: 13/10/17
  Time: 4:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Graph You Asked! | UNSWBook</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link href="style.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <script type="text/javascript" src="../dist/vis.js"></script>
    <link href="../dist/vis.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        #mynetwork {
            width: 600px;
            height: 400px;
            border: 1px solid lightgray;
        }
    </style>
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
</nav><div id="content" class="container">
    <div class="row">
        <c:if test="${role=='user'}">
        <div class="col-sm-2">
            <div class="vertical-menu">
                <a href="mainpage.jsp">Main Page</a>
                <a href="advancedSearch.jsp">Advanced Search</a>
                <a href="getMyMessage">My Message</a>
                <a href="changeDetail.jsp">Change My Details</a>
                <a href="getNotification" id="notification">Notifications</a>
                <a href="graphSearch.jsp">Graph Search</a>
                <a href="index.jsp">Log out</a>
            </div>
        </div>
        </c:if><div class="col-sm-10"><div class="pane">
        <div id="mynetwork"></div></div></div>
    </div>
</div>
<script type="text/javascript">
    // create an array with nodes

    // create a network
    var container = document.getElementById('mynetwork');

    var DOTstring = <%=request.getAttribute("result")%>;
    var parsedData = vis.network.convertDot(DOTstring);
    // provide the data in the vis format
    var data = {
        nodes: parsedData.nodes,
        edges: parsedData.edges
    }
    var options = {
        groups: {
            Person: {
                shape: 'icon',
                icon:{
                    face:'FontAwesome',
                    code:'\uf007',
                    size:50,
                    color:'#aa00ff'
                }
            },
            Message: {
                shape: 'icon',
                icon:{
                    face:'FontAwesome',
                    code:'\uf27a',
                    size:50,
                    color:'#00ffff'
                }
            }
    }};

    // initialize your network!
    var network = new vis.Network(container, data, options);
</script>
<footer>
    <p>COMP9321 Social Media Assignment</p><p class="right-text">UNSWBook</p>
</footer>

</body>

</html>