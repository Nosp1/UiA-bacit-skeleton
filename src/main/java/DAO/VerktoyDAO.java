package DAO;

import modell.loggInn.DBUtils;
import modell.loggInn.Verktoy;
import modell.loggInn.VerktoyType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class VerktoyDAO {

    public static ArrayList<Verktoy> getAllVerktoyTypeID(int ID)  {
        String sql = "SELECT v.VerktoyID, v.Tilgjenglighet, v.MaksDager, v.Gratis, v.Kostnad, vt.VerktoyTypeNavn, vt.VerktoyBilde" +
                " from Verktoy v" +
                "INNER JOIN VerktoyType vt ON vt.VerktoyTypeID = v.VerktoyTypeID";
        ArrayList<Verktoy> toReturn = new ArrayList<>();

        try {
            Connection database = DBUtils.getINSTANCE().getConnection();
            ResultSet rs = null;
            PreparedStatement statement = database.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                Verktoy verktoy = new Verktoy(
                        rs.getInt("v.VerktoyID"),
                        rs.getString("vt.VerktoyBilde"),
                        rs.getString("vt.VerktoyTypeNavn"),
                        rs.getInt("v.Kostnad"),
                        rs.getInt("v.MaksDager"),
                        rs.getBoolean("v.Gratis"),
                        rs.getBoolean("v.Tilgjenglighet")
                );
                toReturn.add(verktoy);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return toReturn;
    }
}

