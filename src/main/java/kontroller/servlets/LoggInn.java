package kontroller.servlets;

import modell.loggInn.Bruker;
;
import modell.loggInn.BrukerDB;
import modell.Connector;


import java.io.*;
import java.sql.SQLException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loggInn")
//I og med at man extender HttpServlet lager vi en servlet
public class LoggInn extends HttpServlet {
    private static final long serialVersionUID = 1L;
    // Dette blir en Post ettersom vi vil sjekke noe vi skriver inn imot noe som ligger inne i DB
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        //Her henter vi dataene fra rutene til logg inn siden
        String logepost = req.getParameter("epost");
        String logpassord = req.getParameter("passord");
        //Her lager vi en tom modell.loggInn.Bruker.BrukerDB modell, som håndterer data til/fra databasen
        BrukerDB bdb = null;
        try {
            //Her initierer vi samme tomme tabell og setter den opp med en kobling til databasen
            bdb = new BrukerDB(Connector.initializeDatabase());
            //Her kombinerer vi Bruker modellen med modell.loggInn.Bruker.BrukerDB modellen, slik at vi fyller en bruker med data fra DB
            Bruker bruker = bdb.logBruker(logepost, logpassord);
            //Her oppretter vi en session, slik at vi kan ta med oss dataene, og sender oss til hjem siden med disse
            if (bruker != null) {
                HttpSession session = req.getSession();
                session.setAttribute("logUser", bruker);
                res.sendRedirect("view/hjem.jsp");
            } else {
                //String som printes ut slik at man skjønner feilen
                out.println("Fant ikke bruker");
            }
            //Fanger eventuelle exeptions
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}