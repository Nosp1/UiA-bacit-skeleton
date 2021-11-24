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


@WebServlet("/RegistrerVerktoy3")
public class RegistrerVerktoy3 extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.sendRedirect("registrerVerktoy3.jsp");
    }


    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        PreparedStatement ps;
        Connection con;

        //Her henter vi dataene fra rutene til logg inn siden
        String Tilgjengelighet = req.getParameter("Tilgjengelighet");
        String Maksdager = req.getParameter("Maksdager");
        String Gratis = (req.getParameter("Gratis")).toLowerCase();
        String Kostnad = req.getParameter("Kostnad");
        String VtID = req.getParameter("VtID");


        BrukerDB bdb = null;
        try {


            con = DBUtils.getINSTANCE().getConnection(out);
            String query = "INSERT INTO Verktoy (VerktoyTypeID, Tilgjengelighet, Maksdager, Gratis, Kostnad) values (?,?,?,?,?)";
            ps = con.prepareStatement(query);

            ps.setInt(1, Integer.parseInt(VtID));
            ps.setBoolean(2, true);
            ps.setString(3, Maksdager);
            ps.setBoolean(4, Boolean.parseBoolean(Gratis));
            ps.setString(5, Kostnad);

            ps.execute();
            out.println("Ny bruker registrert!");


        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }


}
