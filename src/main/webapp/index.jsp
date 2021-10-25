<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
     <head>
          <meta charset="UTF-8">
          <title></title>
          <link rel="stylesheet" href="view/css/indexstyle.css">
     </head>


     <div class="title"> <h1><img src="https://images.squarespace-cdn.com/content/v1/5bcf4baf90f904e66e8eb8bf/1571139220977-8Y75FILX6E39M4ZH8REW/Logo-eng-web-blue.png?format=1500w" alt="logo" width="398" height="217"> </h1>
</div>
<!--
GAMMEL LOGG INN KNAPP OM VI ØNSKER DETTE SYSTEMET TILBAKE
<br/>
<a href="LoggIn">Logg inn</a>
-->

<!--
     <div class="title"><h1>Logg inn</h1></div> -->
     <div class="container">
          <div class="left"></div>
          <div class="right">
               <div class="formBox">
                    <form action="./loggInn" method="post">
                         <p>Epost:</p>
                         <input type="text" name="email" placeholder="Skriv inn E-post">
                         <p>Passord:</p>
                         <input type="Password" name="passord" placeholder="Skriv inn passord">
                         <input type="submit" name="" value="Logg Inn">
                         <a href="#">Glemt passord</a>
                         <!-- se om vi har tid til å fikse en glemt passord funksjon, kan være litt for mye jobb -->
                    </form>
               </div>

          </div>
     </div>
</body>
</html>