<%--
  Created by IntelliJ IDEA.
  User: Adrian
  Date: 02.11.2021
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="modell.loggInn.Verktoy"%>
<%@page import="DAO.VerktoyDAO"%>
<%@page import="kontroller.servlets.VelgVerktoyServlet"%>
<%@page import="java.util.ArrayList"%>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="view/css/bookingstyle.css">
</head>
<body>
<h1>Verktøy</h1>
<table border ="1" width="1000" align="center">
    <tr bgcolor="#021e46">
        <th><b>VerktøyID</b></th>
        <th><b>BILDEPATH INN HER</b></th>
        <th><b>Navn på verktøyet</b></th>
        <th><b>Kroner pr døgn</b></th>
        <th><b>Maks antall dager</b></th>
        <th><b>Gratis å låne første dag</b></th>
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
        <td><%=s.getBildePath()%></td>
        <td><%=s.getNavn()%></td>
        <td><%=s.getKostnad()%></td>
        <td><%=s.getMaksDager()%></td>
        <td><%=s.isGratis()%></td>
        <td><%=s.isTilgjengelig()%></td>
    </tr>
    <%}%>
</table>
<hr/>

</body>
</html>
