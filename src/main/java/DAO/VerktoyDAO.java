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
        String sql = "SELECT VerktoyID, Tilgjenglighet, MaksDager, Gratis, Kostnad, VerktoyType.VerktoyTypeNavn, VerktoyType.VerktoyBilde from Verktoy INNER JOIN VerktoyType ON VerktoyType.VerktoyTypeID = Verktoy.VerktoyTypeID where Verktoy.VerktoyID = ?";
        ArrayList<Verktoy> toReturn = new ArrayList<>();

        try {
            Connection database = DBUtils.getINSTANCE().getConnection();
            ResultSet rs = null;
            PreparedStatement statement = database.prepareStatement(sql);
            statement.setInt(1, ID);
            rs = statement.executeQuery();

            while (rs.next()) {
                Verktoy verktoy = new Verktoy(
                        rs.getInt("VerktoyID"),
                        rs.getString("VerktoyBilde"),
                        rs.getString("VerktoyTypeNavn"),
                        rs.getInt("Kostnad"),
                        rs.getInt("MaksDager"),
                        rs.getBoolean("Gratis"),
                        rs.getBoolean("Tilgjenglighet")
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

