<%--
  Created by IntelliJ IDEA.
  User: Adrian
  Date: 03.11.2021
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="view/css/reigistrerBrukerstyle.css">
</head>
<body>

<div class="title"><h1><img
        src="https://images.squarespace-cdn.com/content/v1/5bcf4baf90f904e66e8eb8bf/1571139220977-8Y75FILX6E39M4ZH8REW/Logo-eng-web-blue.png?format=1500w"
        alt="logo" width="203" height="110"></h1>
</div>
<div class="container">
    <form action="RegistrerVerktoy3" method="post">
        <input type="text" name="Gratis" placeholder="Er verktøyet gratis for alle ansatte?"><br>
        <input type="text" name="Kostnad" placeholder="Hvor mye koster verktoyet hvis det ikke er gratis"><br>
        <input type="hidden" name="VtID" value="<%= request.getAttribute("VtID")%>"><br>

        <input type="submit">

    </form>
</div>
</body>
</html>
