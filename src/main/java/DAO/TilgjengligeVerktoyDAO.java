package DAO;

import jdk.internal.icu.impl.CharacterIteratorWrapper;
import modell.loggInn.DBUtils;
import modell.loggInn.Verktoy;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TilgjengligeVerktoyDAO {

    public static ArrayList<Verktoy> getAllVerktoyTilgjenglige() throws SQLException {
        String sql = "SELECT VerktoyID, VerktoyBilde, VerktoyTypeNavn, Tilgjenglighet FROM Verktoy INNER JOIN VerktoyType ON Verktoy.VerktoyTypeID = VerktoyType.VerktoyTypeID WHERE Tilgjenglighet = TRUE;";
        ArrayList<Verktoy> toReturn = new ArrayList<>();


        try {
            Connection database = DBUtils.getINSTANCE().getConnection();
            ResultSet rs = null;
            PreparedStatement statement = database.prepareStatement(sql);
            rs = statement.executeQuery();


            while (rs.next()) {
                Verktoy verktoy = new Verktoy(
                        rs.getInt("VerktoyID"),
                        rs.getString("VerktoyBilde"),
                        rs.getString("VerktoyTypeNavn"),
                        rs.getBoolean("Tilgjenglighet")
                );
                toReturn.add(verktoy);
            }
        } catch (ClassNotFoundException classNotFoundException) {
            classNotFoundException.printStackTrace();
        }
        return toReturn;
    }

}


