package kontroller.servlets;

import modell.loggInn.Booking;
import modell.loggInn.BrukerDB;
import modell.loggInn.DBUtils;
import org.apache.commons.codec.digest.DigestUtils;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/RegistrerBooking")
public class RegistrerBooking extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        PreparedStatement ps;
        Connection con;

        String BookingStart = req.getParameter("BookingStart");
        String BookingSlutt = req.getParameter("BookingSlutt");

        BrukerDB bdb = null;
        try {
            //Her initierer vi samme tomme tabell og setter den opp med en kobling til databasen
            con = DBUtils.getINSTANCE().getConnection(out);
            String query = "INSERT INTO Booking (BookingDatoStartID, BookingDatoSlutt) values (?,?)";
            ps = con.prepareStatement(query);
            ps.setString(1, fornavn);
            ps.setString(2, etternavn);
            ps.execute();
            out.println("Ny booking registrert!");


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }


    }
}
