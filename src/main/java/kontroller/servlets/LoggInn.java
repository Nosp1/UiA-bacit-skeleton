package kontroller.servlets;

import modell.loggInn.Bruker;

import modell.loggInn.BrukerDB;
import modell.Connector;
import modell.loggInn.DBUtils;


import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
            bdb = new BrukerDB(Connector.getINSTANCE().getConnection(out));
            //Her kombinerer vi Bruker modellen med modell.loggInn.Bruker.BrukerDB modellen, slik at vi fyller en bruker med data fra DB
            Bruker bruker = bdb.logBruker(logepost, logpassord);
            //Her oppretter vi en session, slik at vi kan ta med oss dataene, og sender oss til hjem siden med disse
            if (bruker != null) {
                HttpSession session = req.getSession();
                session.setAttribute("logUser", bruker);
                res.sendRedirect("hjem.jsp");
            } else {
                //String som printes ut slik at man skjønner feilen
                out.println("Fant ikke bruker");
            }
            //Fanger eventuelle exeptions
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static boolean validateAdmin(HttpSession session) {
        Connection db;
        PreparedStatement ps;
        Bruker sessionbruker = (Bruker) session.getAttribute("logUser");
        try {
            db = DBUtils.getINSTANCE().getConnection();
            String query = "SELECT Admin FROM Ansatt WHERE AnsattEmail = ?";
            ResultSet rs;
            ps = db.prepareStatement(query);
            ps.setString(1, sessionbruker.getAnsattEmail());
            rs = ps.executeQuery();

            rs.next();
            String dbAdmin = rs.getString("Admin");
            if (dbAdmin.equals("1")) {
                return true;
            } else {
                return false;
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }
}


/*if(checkIfUserExists(email,password) == true) {
    out.println("Congrats");
    HttpSession session = request.getSession();
    session.setAttribute("sessionEmail", email)
        } else {
    out.println("Feil passord eller bruker");
        }

public boolean checkIfUserAdmin(HttpSession session) {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    String sessionEmail = (String) session.getAttribute("sessionEmail", email)


    con = DBUtils.getINSTANCE().getConnection();
    String query = "SELECT Admin from amv where Email = ?");
    ps = con.prepareStatement(query);
    rs = ps.executeQuery();

    String adminFromDB = rs.getString("Admin");


    if (adminFromDB.equals("1")){
        return true;
    }
    else {
        return false;
    }

}

Login l = new login();
if(checkIfUserAdmin(HttpSession session) == true){
    requestgetRequestDispatcher("deleteUser.jsp").forward(request, response);
        } else {
    printWriter out = repsonse.getWriter();
    out.println("Ikke tilgang");
        }

*/

