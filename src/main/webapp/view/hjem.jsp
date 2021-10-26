<%@page import="modell.loggInn.Bruker"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Bruker bruker = (Bruker) session.getAttribute("logUser");
    if(bruker==null){
        response.sendRedirect("index.jsp"); }
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Verktøy</title>
</head>
<body>

<input type="text" id="mySearch" onkeyup="myFunction()" placeholder="søk...">

<ul id="myMenu">

</ul>


</body>
</html>
