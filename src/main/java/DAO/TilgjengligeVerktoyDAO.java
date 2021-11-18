package DAO;


import modell.loggInn.DBUtils;
import modell.loggInn.Verktoy;


import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;

public class TilgjengligeVerktoyDAO {

    public static ArrayList<Verktoy> getAllVerktoyTilgjenglige() throws SQLException {
        String sql = "SELECT VerktoyID, VerktoyBildet, VerktoyTypeNavn, Tilgjenglighet FROM Verktoy INNER JOIN VerktoyType ON Verktoy.VerktoyTypeID = VerktoyType.VerktoyTypeID WHERE Tilgjenglighet = TRUE;";
        ArrayList<Verktoy> toReturn = new ArrayList<>();


        try {
            Connection database = DBUtils.getINSTANCE().getConnection();
            ResultSet rs = null;
            PreparedStatement statement = database.prepareStatement(sql);
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
                        rs.getBoolean("Tilgjenglighet")
                );
                toReturn.add(verktoy);
            }
        } catch (ClassNotFoundException | IOException classNotFoundException) {
            classNotFoundException.printStackTrace();
        }
        return toReturn;
    }

}


