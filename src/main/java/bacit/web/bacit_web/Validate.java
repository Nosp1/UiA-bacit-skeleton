package bacit.web.bacit_web;

import java.io.PrintWriter;
import java.sql.*;

public class Validate {
    public static boolean checkUser(String Telefonnummer, String Passord, PrintWriter out) {

        {
            boolean st = false;
            try {


                Connection con = DBUtils.getINSTANCE().getConnection(out);

                PreparedStatement ps = con.prepareStatement("select * from Brukere where Telefonnummer=? || E_post and Passord=?");
                ps.setString(1, Telefonnummer);
                ps.setString(2, Passord);
                ResultSet rs = ps.executeQuery();
                st = rs.next();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return st;
        }
    }
}