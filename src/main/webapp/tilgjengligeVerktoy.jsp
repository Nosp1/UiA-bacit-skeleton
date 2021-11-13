<%--
  Created by IntelliJ IDEA.
  User: Adrian
  Date: 13.11.2021
  Time: 13:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="modell.loggInn.Verktoy"%>
<%@page import="DAO.VerktoyDAO"%>
<%@page import="kontroller.servlets.VelgVerktoyServlet"%>
<%@page import="java.util.ArrayList"%>
<html>
<head>
    <title>TILGJENGLIGE VERKTØY</title>
    <link rel="stylesheet" href="view/css/tilgjengligeVerktoystyle.css">
</head>
<body>
<h2>TILGJENGLIGE VERKTØY</h2>
<table border ="1" width="1000" align="center">
    <tr bgcolor="#021e46">
        <th><b>VerktøyID</b></th>
        <th><b>BILDEPATH INN HER</b></th>
        <th><b>Navn på verktøyet</b></th>
        <th><b>Ledig</b></th>

    </tr>
    <%-- Fetching the attributes of the request object
         which was previously set by the servlet
          "StudentServlet.java"
    --%>
    <%ArrayList<Verktoy> verktoy =
            (ArrayList<Verktoy>)request.getAttribute("hentVerktoy");
        for(Verktoy s:verktoy){%>
    <%-- Arranging data in tabular form
    --%>
    <tr>
        <td><%=s.getID()%></td>
        <td><img src="view/css/verktoybilder/<%=s.getBildePath()%>"></td>
        <td><%=s.getNavn()%></td>
        <td><%=s.isTilgjengelig()%></td>
    </tr>
    <%}%>
</table>

</body>
</html>
