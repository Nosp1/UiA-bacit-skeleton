package DAO;

import modell.loggInn.DBUtils;
import modell.loggInn.Verktoy;
import modell.loggInn.VerktoyType;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;

public class VerktoyDAO {

    public static ArrayList<Verktoy> getAllVerktoyTypeID(int ID)  {
        String sql = "SELECT VerktoyID, Tilgjenglighet, MaksDager, Gratis, Kostnad, VerktoyType.VerktoyTypeNavn, VerktoyType.VerktoyBildet from Verktoy INNER JOIN VerktoyType ON VerktoyType.VerktoyTypeID = Verktoy.VerktoyTypeID where Verktoy.VerktoyID = ?";
        ArrayList<Verktoy> toReturn = new ArrayList<>();

        try {
            Connection database = DBUtils.getINSTANCE().getConnection();
            ResultSet rs = null;
            PreparedStatement statement = database.prepareStatement(sql);
            statement.setInt(1, ID);
            rs = statement.executeQuery();

            while (rs.next()) {

                Blob blob = rs.getBlob("VerktoyBildet");
                InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                byte[] imageBytes = outputStream.toByteArray();
                String image = Base64.getEncoder().encodeToString(imageBytes);
                inputStream.close();
                outputStream.close();

                Verktoy verktoy = new Verktoy(
                        rs.getInt("VerktoyID"),
                        image,
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

