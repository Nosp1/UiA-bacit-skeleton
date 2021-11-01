<%@page import="modell.loggInn.Bruker"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Bruker bruker = (Bruker) session.getAttribute("logUser");
    if(bruker==null){
        response.sendRedirect("index.jsp"); } %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Responsive Navbar</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/hjemstyle.css">
</head>
<body>
<header><h1></h1></header>



<div class="container">
    <div class="topmeny">
        <img src="css/Hamburger_icon.svg.png" id="sidemeny" alt="meny" width="87" height="87" onclick="show()" >

                <h2>Verktøy</h2>

        <div class="logo"><img src="https://images.squarespace-cdn.com/content/v1/5bcf4baf90f904e66e8eb8bf/1571139220977-8Y75FILX6E39M4ZH8REW/Logo-eng-web-blue.png?format=1500w" alt="logo" width="159" height="87">
        </div>

        <input type="text" id="mySearch" onkeyup="myFunction()" placeholder="Search.." title="Type in a category">



    </div>

    <nav>

        <div id="links">
            <ul>
                <a href="#verktøy" class="active">Verktøy</a>
                <a href="#nyheter">nyheter</a>
                <a href="#nyheter">nyheter</a>
                <a href="#nyheter">nyheter</a>
            </ul>
        </div>
    </nav>

    <div class="containerhjem">
        <ul>
            <li><div class="title"></div></li>
            <li><div class="title"></div></li>
            <li><div class="title"></div></li>
            <li><div class="title"></div></li>
            <li><div class="title"></div></li>
            <li><div class="title"></div></li>
            <li><div class="title"></div></li>
            <li><div class="title"></div></li>
        </ul>
    </div>
</div>

    <script>
    function show() {
        let x = document.getElementById("links");
        if (x.style.display === "block") {
            x.style.display = "none";
        } else {
            x.style.display = "block";
        }
    }

    </script>
</body>
</html>
