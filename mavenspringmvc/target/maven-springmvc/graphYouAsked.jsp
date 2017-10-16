<%--
  Created by IntelliJ IDEA.
  User: congshibo
  Date: 13/10/17
  Time: 4:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
<div id="mynetwork"></div>

<script type="text/javascript">
    // create an array with nodes
    var nodes = new vis.DataSet([
        {id: 1,group:'users', label: 'Node 1'},
        {id: 2, label: 'Node 2'},
        {id: 3, label: 'Node 3'},
        {id: 4, label: 'Node 4'},
        {id: 5, label: 'Node 5'}
    ]);

    // create an array with edges
    var edges = new vis.DataSet([
        {from: 1, to: 3},
        {from: 1, to: 2},
        {from: 2, to: 4},
        {from: 2, to: 5}
    ]);

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
</body>
</html>