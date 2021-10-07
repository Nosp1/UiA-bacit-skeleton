package modell;

import java.sql.Connection;
import java.sql.DriverManager;
import jaca.sql.SQLException;

//her har vi en klasse som brukes til å starte opp tilkoblingen til databasen

Public class Connector {
    private static Connection con;

    public static Connection initializaDatabase()
        throws SQLException, ClassNotFoundException
    {

        //Finner frem data om databasetilkoblingen.
        String dbDriver = "org.mariadb.jdbc.Driver";
        String dbURL = "jdbc:mariadb:/127.0.0.1:3308/amwDB";
        //Navn på databasen for å få tilgang
        String dbName = "@DockerDB";
        String dbUsername = "root";
        String dfPassword = "Gruppe4123";

        try {
            Class.forName(dbDriver);
            con = DriverManager.getConnection("jdbc:mariadb://localhost3308/amwDB?user=root&password=Gruppe4123");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return con;
        }
    }