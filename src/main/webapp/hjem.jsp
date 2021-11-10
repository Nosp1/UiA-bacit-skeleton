<%@page import="modell.loggInn.Bruker"%>
<%@page import="java.util.ArrayList" %>
<%@ page import="DAO.VerktoyTypeDao" %>
<%@ page import="modell.loggInn.VerktoyType" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Bruker bruker = (Bruker) session.getAttribute("logUser");
    if(bruker==null){
        response.sendRedirect("index.jsp"); } %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Responsive Navbar</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="view/css/hjemstyle.css">
</head>
<body>
<header><h1></h1></header>



<div class="container">
    <div class="topmeny">
        <img src="view/css/Hamburger_icon.svg.png" id="sidemeny" alt="meny" width="87" height="87" onclick="show()" >

                <h2>Book verktøy</h2>

        <div class="logo"><img src="https://images.squarespace-cdn.com/content/v1/5bcf4baf90f904e66e8eb8bf/1571139220977-8Y75FILX6E39M4ZH8REW/Logo-eng-web-blue.png?format=1500w" alt="logo" width="160" height="87">
        </div>

        <input type="text" id="mySearch" onkeyup="myFunction()" placeholder="Søk etter ønsket verktøy" title="Type in a category">



    </div>

    <nav>

        <div id="links">
            <ul>
                <a href="RegistrerVerktoy">Registrer verktøy</a>
                <a href="RegistrerBruker">Registrer bruker</a>
                <a href="LoggUt">Logg ut</a>
            </ul>
        </div>
    </nav>

    <div class="wrapper">

        <%
            ArrayList<VerktoyType> verktoyTypes = VerktoyTypeDao.getAllVerktoyType();
            for (VerktoyType vt : verktoyTypes) {
        %>

                <div>
                    <form action="">

                        <p><%=vt.getNavn()%></p>
                        <input type="image" name="submit" value="<%=vt.getID()%>" src="view/css/verktoybilder/<%=vt.getBildePath()%>" class="responsive">
                    </form>
                </div>
        <%
            }
        %>
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
