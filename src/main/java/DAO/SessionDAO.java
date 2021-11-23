package DAO;

import modell.loggInn.Bruker;
import modell.loggInn.BrukerDB;
import modell.loggInn.DBUtils;
import modell.loggInn.VerktoyType;

import javax.servlet.http.HttpSession;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;

public class SessionDAO {


    public static int getSessionID(HttpSession session)  {


        Bruker sessionbruker = (Bruker) session.getAttribute("logUser");
        String sessionepost = sessionbruker.getAnsattEmail();
        String sql = "SELECT AnsattID from Ansatt where AnsattEmail = ?;";

        try {
            Connection database = DBUtils.getINSTANCE().getConnection();
            ResultSet rs = null;
            PreparedStatement statement = database.prepareStatement(sql);
            statement.setString(1, sessionepost);
            rs = statement.executeQuery();

            while (rs.next()) {
                return rs.getInt("AnsattID");
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return 0;
    }
}

