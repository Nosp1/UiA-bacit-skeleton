<%@page import="modell.loggInn.Bruker"%>
<%@ page import="java.util.ArrayList" %>
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
                <a href="#Verktøy" class="active">Verktøy</a>
                <a href="RegistrerBruker">Nyheter</a>
                <a href="#Dine ordre">Dine ordre</a>
                <a href="LoggUt">Logg ut</a>
            </ul>
        </div>
    </nav>

    <div class="wrapper">

        <div><p>Vinkelsliper</p><img src="view/css/verktoybilder/9%20Vinkelsliper%20Stein.PNG" alt="Vinkelsliper" id="4" class="responsive"></div>
        <div><p>Bandsliper</p><img src="view/css/verktoybilder/Bandsliper%20230v.PNG" alt="Bandsliper" id="6" class="responsive"></div>
        <div><p>Bildiagnose</p><img src="view/css/verktoybilder/Bildiagnose.PNG" alt="Bildiagnose" id="22" class="responsive"></div>
        <div><p>Soundboks</p><img src="view/css/verktoybilder/Bluetooth%20h¢ytaler%20SOUNDBOKS.PNG" alt="SOUNDBOKS" id="30" class="responsive"></div>
        <div><p>Eksentersliper</p><img src="view/css/verktoybilder/Eksentersliper%20230V.PNG" alt="Eksentersliper" id="3" class="responsive"></div>
        <div><p>Fein multimaskin</p><img src="view/css/verktoybilder/Fein%20multimaskin.PNG" alt="Fein multimaskin" id="2" class="responsive"></div>
        <div><p>Flisekutter keramikk</p><img src="view/css/verktoybilder/Flisekutter%20keramikk.PNG" alt="Flisekutter keramikk" id="5" class="responsive"></div>
        <div><p>Flisekutter Trevirke</p><img src="view/css/verktoybilder/Flisekutter%20Trevirke.PNG" alt="Flisekutter Trevirke" id="18" class="responsive"></div>
        <div><p>Gjære kombisag</p><img src="view/css/verktoybilder/Gjære%20Kombisag.PNG" alt="Gjære Kombisag" id="8" class="responsive"></div>
        <div><p>Hoppetusse bensin</p><img src="view/css/verktoybilder/Hoppetusse%20bensin.PNG" alt="Hoppetusse bensin" id="16" class="responsive"></div>
        <div><p>Høvel</p><img src="view/css/verktoybilder/H¢vel%20230v.PNG" alt="Høvel" id="7" class="responsive"></div>
        <div><p>Kantklipper</p><img src="view/css/verktoybilder/Kantklipper%20Bensin.PNG" alt="Kantklipper" id="14" class="responsive"></div>
        <div><p>Snekkerlaser</p><img src="view/css/verktoybilder/Leica%20Snekkerlaser.PNG" alt="Snekkerlaser" id="27" class="responsive"></div>
        <div><p>Leirduekaster</p><img src="view/css/verktoybilder/Leirduekaster.PNG" alt="Leirduekaster" id="26" class="responsive"></div>
        <div><p>Meiselmaskin</p><img src="view/css/verktoybilder/Meiselmaskin%20230v.PNG" alt="Meiselmaskin" id="13" class="responsive"></div>
        <div><p>Slagdrill</p><img src="view/css/verktoybilder/Milwaukee%20Slagdrill.PNG" alt="Slagdrill" id="28" class="responsive"></div>
        <div><p>Trillebår</p><img src="view/css/verktoybilder/Motorisert%20trillebår.PNG" alt="Trillebår" id="19" class="responsive"></div>
        <div><p>Personlift</p><img src="view/css/verktoybilder/Personl¢ft%20Niftylift.PNG" alt="Personlift" id="17" class="responsive"></div>
        <div><p>Skap henger</p><img src="view/css/verktoybilder/Skap%20Henger.PNG" alt="Skap henger" id="29" class="responsive"></div>
        <div><p>Skruemaskin</p><img src="view/css/verktoybilder/Skruemaskin.PNG" alt="Skruemaskin" id="1" class="responsive"></div>
        <div><p>Spikerpistol liten luft</p><img src="view/css/verktoybilder/Spikerpistol%20liten%20luft.PNG" alt="Spikerpistol liten luft" id="12" class="responsive"></div>
        <div><p>Spikerpistol liten</p><img src="view/css/verktoybilder/Spikerpistol%20Milwaukee%20Dykk%20liten.PNG" alt="Spikerpistol liten" id="25" class="responsive"></div>
        <div><p>Spikerpistol mellom</p><img src="view/css/verktoybilder/Spikerpistol%20Milwaukee%20krampe%20mellom.PNG" alt="Spikerpistol mellom" id="24" class="responsive"></div>
        <div><p>Spikerpistol stor</p><img src="view/css/verktoybilder/Spikerpistol%20Milwaukee%20spiker%20stor.PNG" alt="Spikerpistol stor" id="23" class="responsive"></div>
        <div><p>Strømaggregat</p><img src="view/css/verktoybilder/Str¢maggregat%203,7kw.PNG" alt="Strømaggregat" id="20" class="responsive"></div>
        <div><p>Tilhenger Boggi</p><img src="view/css/verktoybilder/Tilhenger%20Boggi.PNG" alt="Tilhenger Boggi" id="10" class="responsive"></div>
        <div><p>Tilhenger liten</p><img src="view/css/verktoybilder/Tilhenger%20liten.PNG" alt="Tilhenger liten" id="11" class="responsive"></div>
        <div><p>Vedkløyver</p><img src="view/css/verktoybilder/Vedkl¢yver%20bensin.PNG" alt="Vedkløyver" id="9" class="responsive"></div>
        <div><p>Dekkmaskin</p><img src="view/css/verktoybilder" alt="Dekkmaskin" id="21" class="responsive"></div>
        <div><p>Kompressor 203vac</p><img src="view/css/verktoybilder" alt="Kompressor 203vac" id="15" class="responsive"></div>
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
