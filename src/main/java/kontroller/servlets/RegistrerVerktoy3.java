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
        String Gratis = (req.getParameter("Gratis")).toLowerCase();
        System.out.println(Gratis);
        String Kostnad = req.getParameter("Kostnad");
        System.out.println(Kostnad);
        String VerktoyID = req.getParameter("VtID");
        System.out.println(VerktoyID);

        int Maksdager = 4;


        try {


            con = DBUtils.getINSTANCE().getConnection(out);
            String query = "INSERT INTO Verktoy (VerktoyTypeID, Tilgjenglighet, Maksdager, Gratis, Kostnad) values (?,?,?,?,?)";
            ps = con.prepareStatement(query);

            ps.setString(1, VerktoyID);
            ps.setBoolean(2, true);
            ps.setInt(3, Maksdager);
            ps.setBoolean(4, Boolean.parseBoolean(Gratis));
            ps.setString(5, Kostnad);

            ps.execute();
            res.sendRedirect("hjem.jsp");


        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }


}
