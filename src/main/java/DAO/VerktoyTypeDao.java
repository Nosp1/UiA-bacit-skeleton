package DAO;

import modell.Connector;
import modell.loggInn.DBUtils;
import modell.loggInn.VerktoyType;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;
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

                Blob blob = rs.getBlob("VerktoyBilde");
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


                VerktoyType verktoyType = new VerktoyType(
                        rs.getInt("VerktoyTypeID"),
                        rs.getString("VerktoyTypeNavn"), image

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