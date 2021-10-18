package bacit.web.bacit_web;

import java.sql.*;

public class Validate {
    public static boolean checkUser(String Telefonnummer, String Passord) {

        {
            boolean st = false;
            try {

                Class.forName("org.mariadb.jdbc.Driver");

                Connection con = DriverManager.getConnection(
                        "jdbc:mariadb://172.17.0.1:3308/Gruppe9",
                        "root",
                        "TestTest123");
                PreparedStatement ps = con.prepareStatement("select * from Brukere where Telefonnummer=? and Passord=?");
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