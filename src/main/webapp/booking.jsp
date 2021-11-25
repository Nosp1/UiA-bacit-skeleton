<%--
  Created by IntelliJ IDEA.
  User: Adrian
  Date: 02.11.2021
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="modell.loggInn.Verktoy"%>
<%@page import="DAO.VerktoyDAO"%>
<%@page import="kontroller.servlets.VelgVerktoyServlet"%>
<%@page import="java.util.ArrayList"%>
<html>
<head>
    <title>BOOK ET VERKTØY</title>
    <link rel="stylesheet" href="view/css/bookingstyle.css">
</head>
<body>
<h2>Verktøy</h2>
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
        <td><%out.println("<img src=\"data:image/jpg;base64,"+ s.getBildePath() + " \" />"); %></td>
        <td><%=s.getNavn()%></td>
        <td><%=s.getKostnad()%></td>
        <td><%=s.getMaksDager()%></td>
        <td><%

            if (s.isGratis()==true){
                out.println("JA");
            }%></td> <%--if false remove? --%>
        <td><%=s.isTilgjengelig()%></td>
    </tr>

</table>

<form action="RegistrerBooking" method="post" align="center">

    <input type="hidden" name="id" value="<%=s.getID()%>">

    <input type="submit" value="Book verktøy">

    <input type="date" name="startDate">

    <input type="date" name="sluttDate">

        <%}%>

</form>
</body>
</html>
