package main.kontroller.servlets;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

//Denne servletten har ansvar for å logg ut dataen

@WebServlet("/loggUT")
public class LoggUt extends HttpServlet {
    // serialVersioUID brukes for å identifisere klassen, om ikke funnet, kastes hele "funksjonen?"
    private static final long serialVersionUID = 1L;
    //Bruker get istedenfor post, fordi vi ikke adder/poster noe men heller ønsker en tilbakemelding/jobb fra applikasjonen
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        HttpsSession session = req.getSession();
        session.removeAttribute("logUser");
        res.sendRedirect("index.jsp");
    }
}