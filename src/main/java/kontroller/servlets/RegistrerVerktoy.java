package kontroller.servlets;

import modell.loggInn.BrukerDB;
import modell.loggInn.DBUtils;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet("/RegistrerVerktoy")
public class RegistrerVerktoy extends HttpServlet {
}
    // Dette blir en Post ettersom vi vil sjekke noe vi skriver inn imot noe som ligger inne i DB
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        PreparedStatement ps;
        Connection con;

        //Her henter vi dataene fra rutene til logg inn siden
        String MaksDager = req.getParameter("MaksDager");
        Boolean Gratis = req.getParameter("");
        String Kostnad = req.getParameter("Kostnad");
        //Her lager vi en tom modell.loggInn.Bruker.BrukerDB modell, som håndterer data til/fra databasen
        BrukerDB bdb = null;
        try {
            //Her initierer vi samme tomme tabell og setter den opp med en kobling til databasen
            con = DBUtils.getINSTANCE().getConnection(out);
            String query = "INSERT INTO Verktoy (MaksDager, Gratis, Kostnad) values (?,?,?)";
            ps = con.prepareStatement(query);
            ps.setString(1, MaksDager);
            ps.setBoolean(2, true);
            ps.setString(3, Kostnad);
            ps.execute();
            out.println("Ny bruker registrert!");

            //Her kombinerer vi Bruker modellen med modell.loggInn.Bruker.BrukerDB modellen, slik at vi fyller en bruker med data fra DB

            //Fanger eventuelle exeptions
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.sendRedirect("registrerBruker.jsp");
    }
}