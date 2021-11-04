package kontroller.servlets;

import modell.Connector;
import modell.loggInn.Bruker;
import modell.loggInn.BrukerDB;
import modell.loggInn.DBUtils;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Locale;


@WebServlet("/RegistrerBruker")
public class RegistrerBruker extends HttpServlet {

    // Dette blir en Post ettersom vi vil sjekke noe vi skriver inn imot noe som ligger inne i DB
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        PreparedStatement ps;
        Connection con;

        //Her henter vi dataene fra rutene til logg inn siden
        String fornavn = req.getParameter("AnsattFornavn");
        String etternavn = req.getParameter("AnsattEtternavn");
        String email = (req.getParameter("AnsattEmail")).toLowerCase();
        String telefon = req.getParameter("AnsattTlf");
        String passord = req.getParameter("passord");
        //Her lager vi en tom modell.loggInn.Bruker.BrukerDB modell, som håndterer data til/fra databasen
        BrukerDB bdb = null;
        try {
            //Her initierer vi samme tomme tabell og setter den opp med en kobling til databasen
            con = DBUtils.getINSTANCE().getConnection(out);
            String query = "INSERT INTO Ansatt (AnsattFornavn, AnsattEtternavn, AnsattEmail, AnsattTlf, Passord) values (?,?,?,?,?)";
            ps = con.prepareStatement(query);
            ps.setString(1, fornavn);
            ps.setString(2, etternavn);
            ps.setString(3, email);
            ps.setString(4, telefon);
            ps.setString(5, passord);
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
