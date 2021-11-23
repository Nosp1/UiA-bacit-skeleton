package kontroller.servlets;

import modell.loggInn.Booking;
import modell.loggInn.BrukerDB;
import modell.loggInn.DBUtils;
import org.apache.commons.codec.digest.DigestUtils;

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

import static DAO.SessionDAO.getSessionID;

@WebServlet("/RegistrerBooking")
public class RegistrerBooking extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        PreparedStatement ps;
        Connection con;

        String BookingStart = req.getParameter("startDate");
        String BookingSlutt = req.getParameter("sluttDate");

        BrukerDB bdb = null;

        HttpSession session = req.getSession();
        int sessionID = getSessionID(session);

        String VerktoyID = req.getParameter("id");

        try {
            //Her initierer vi samme tomme tabell og setter den opp med en kobling til databasen
            con = DBUtils.getINSTANCE().getConnection(out);
            String query = "INSERT INTO Booking (VerktoyID, AnsattID, BookingDatoStartID, BookingDatoSlutt) values (?,?,?,?)";
            ps = con.prepareStatement(query);
            ps.setString(1, VerktoyID);
            ps.setInt(2, sessionID);
            ps.setString(3, BookingStart);
            ps.setString(4, BookingSlutt);


            ps.execute();
            out.println("Ny booking registrert!");


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }


    }
}
