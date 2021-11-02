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

                <h2>Book verktøy</h2>

        <div class="logo"><img src="https://images.squarespace-cdn.com/content/v1/5bcf4baf90f904e66e8eb8bf/1571139220977-8Y75FILX6E39M4ZH8REW/Logo-eng-web-blue.png?format=1500w" alt="logo" width="160" height="87">
        </div>

        <input type="text" id="mySearch" onkeyup="myFunction()" placeholder="Søk etter ønsket verktøy" title="Type in a category">



    </div>

    <nav>

        <div id="links">
            <ul>
                <a href="#Verktøy" class="active">Verktøy</a>
                <a href="#Nyheter">Nyheter</a>
                <a href="#Dine ordre">Dine ordre</a>
                <a href=<form action="./LoggUt" method="get">Logg ut</a>
            </ul>
        </div>
    </nav>

    <div class="wrapper">

        <div><p>Vinkelsliper</p><img src="css/verktoybilder/9%20Vinkelsliper%20Stein.PNG" alt="Vinkelsliper" id="4" class="responsive"></div>
        <div><p>Bandsliper</p><img src="css/verktoybilder/Bandsliper 230v.PNG" alt="Bandsliper" id="6" class="responsive"></div>
        <div><p>Bildiagnose</p><img src="css/verktoybilder/Bildiagnose.PNG" alt="Bildiagnose" id="22" class="responsive"></div>
        <div><p>Soundboks</p><img src="css/verktoybilder/Bluetooth h¢ytaler SOUNDBOKS.PNG" alt="SOUNDBOKS" id="30" class="responsive"></div>
        <div><p>Eksentersliper</p><img src="css/verktoybilder/Eksentersliper 230V.PNG" alt="Eksentersliper" id="3" class="responsive"></div>
        <div><p>Fein multimaskin</p><img src="css/verktoybilder/Fein multimaskin.PNG" alt="Fein multimaskin" id="2" class="responsive"></div>
        <div><p>Flisekutter keramikk</p><img src="css/verktoybilder/Flisekutter keramikk.PNG" alt="Flisekutter keramikk" id="5" class="responsive"></div>
        <div><p>Flisekutter Trevirke</p><img src="css/verktoybilder/Flisekutter Trevirke.PNG" alt="Flisekutter Trevirke" id="18" class="responsive"></div>
        <div><p>Gjære kombisag</p><img src="css/verktoybilder/Gjære Kombisag.PNG" alt="Gjære Kombisag" id="8" class="responsive"></div>
        <div><p>Hoppetusse bensin</p><img src="css/verktoybilder/Hoppetusse bensin.PNG" alt="Hoppetusse bensin" id="16" class="responsive"></div>
        <div><p>Høvel</p><img src="css/verktoybilder/H¢vel 230v.PNG" alt="Høvel" id="7" class="responsive"></div>
        <div><p>Kantklipper</p><img src="css/verktoybilder/Kantklipper Bensin.PNG" alt="Kantklipper" id="14" class="responsive"></div>
        <div><p>Snekkerlaser</p><img src="css/verktoybilder/Leica Snekkerlaser.PNG" alt="Snekkerlaser" id="27" class="responsive"></div>
        <div><p>Leirduekaster</p><img src="css/verktoybilder/Leirduekaster.PNG" alt="Leirduekaster" id="26" class="responsive"></div>
        <div><p>Meiselmaskin</p><img src="css/verktoybilder/Meiselmaskin 230v.PNG" alt="Meiselmaskin" id="13" class="responsive"></div>
        <div><p>Slagdrill</p><img src="css/verktoybilder/Milwaukee Slagdrill.PNG" alt="Slagdrill" id="28" class="responsive"></div>
        <div><p>Trillebår</p><img src="css/verktoybilder/Motorisert trillebår.PNG" alt="Trillebår" id="19" class="responsive"></div>
        <div><p>Personlift</p><img src="css/verktoybilder/Personl¢ft Niftylift.PNG" alt="Personlift" id="17" class="responsive"></div>
        <div><p>Skap henger</p><img src="css/verktoybilder/Skap Henger.PNG" alt="Skap henger" id="29" class="responsive"></div>
        <div><p>Skruemaskin</p><img src="css/verktoybilder/Skruemaskin.PNG" alt="Skruemaskin" id="1" class="responsive"></div>
        <div><p>Spikerpistol liten luft</p><img src="css/verktoybilder/Spikerpistol liten luft.PNG" alt="Spikerpistol liten luft" id="12" class="responsive"></div>
        <div><p>Spikerpistol liten</p><img src="css/verktoybilder/Spikerpistol Milwaukee Dykk liten.PNG" alt="Spikerpistol liten" id="25" class="responsive"></div>
        <div><p>Spikerpistol mellom</p><img src="css/verktoybilder/Spikerpistol Milwaukee krampe mellom.PNG" alt="Spikerpistol mellom" id="24" class="responsive"></div>
        <div><p>Spikerpistol stor</p><img src="css/verktoybilder/Spikerpistol Milwaukee spiker stor.PNG" alt="Spikerpistol stor" id="23" class="responsive"></div>
        <div><p>Strømaggregat</p><img src="css/verktoybilder/Str¢maggregat 3,7kw.PNG" alt="Strømaggregat" id="20" class="responsive"></div>
        <div><p>Tilhenger Boggi</p><img src="css/verktoybilder/Tilhenger Boggi.PNG" alt="Tilhenger Boggi" id="10" class="responsive"></div>
        <div><p>Tilhenger liten</p><img src="css/verktoybilder/Tilhenger liten.PNG" alt="Tilhenger liten" id="11" class="responsive"></div>
        <div><p>Vedkløyver</p><img src="css/verktoybilder/Vedkl¢yver bensin.PNG" alt="Vedkløyver" id="9" class="responsive"></div>
        <div><p>Dekkmaskin</p><img src="css/verktoybilder/" alt="Dekkmaskin" id="21" class="responsive"></div>
        <div><p>Kompressor 203vac</p><img src="css/verktoybilder/" alt="Kompressor 203vac" id="15" class="responsive"></div>
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
