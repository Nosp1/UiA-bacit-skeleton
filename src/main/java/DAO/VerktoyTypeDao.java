package DAO;

import modell.loggInn.DBUtils;
import modell.loggInn.VerktoyType;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VerktoyTypeDao {

    public static ArrayList<VerktoyType> getAllVerktoyType()  {
        String sql = "SELECT * from VerktoyType;";
        ArrayList<VerktoyType> toReturn = new ArrayList<>();

        try {
            Connection database = DBUtils.getINSTANCE().getConnection();
            ResultSet rs = null;
            PreparedStatement statement = database.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                VerktoyType verktoyType = new VerktoyType(
                        rs.getInt("VerktoyTypeID"),
                        rs.getString("VerktoyTypeNavn"),
                        rs.getString("VerktoyBilde")
                );
                toReturn.add(verktoyType);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return toReturn;
    }
}
