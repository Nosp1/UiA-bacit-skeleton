package bacit.web.bacit_web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.Properties;

public class DBUtils {
    private static final DBUtils INSTANCE = new DBUtils();
    static Connection connection;
    //path til config.properties på payara server
    static String payara = "/opt/payara/config.properties";

    /**
     * initiates the class as a singleton.
     *
     * @return DbTool
     */
    public static DBUtils getINSTANCE() {
        return INSTANCE;
    }

    /**
     * HashMap som leser over config.properties og lagrer
     * username, password og url til databasen for å lage en kobling.
     *
     * @return et hashmap med username, password og url til databasen.
     */
    private static Map<String, String> getProperties() {
        Map<String, String> result = new HashMap<>();

        try (InputStream input = new FileInputStream(payara)) {
            Properties prop = new Properties();

            prop.load(input);
            result.put("username", prop.getProperty("username"));
            result.put("password", prop.getProperty("password"));
            result.put("URL", prop.getProperty("URL"));
        } catch (IOException ex) {
            ex.printStackTrace();

        }
        return result;

    }

    /**
     * used to list all files in current working directory on payara
     * call this method inside getProperties() if needed.
     * useful for debugging paths on payara server.
     */
    private static void printFilesInFolder() {
        System.out.println("Working Directory = " + System.getProperty("user.dir"));
        File file = new File(System.getProperty("user.dir"));
        String[] contents = file.list();

        for (int i = 0; i < Objects.requireNonNull(contents).length; i++) {
            System.out.println(contents[i]);
        }
    }

    /**
     * Establishes a connection with a mariaDB or returns an existing one.
     * username=root
     * password=12345
     * URL=jdbc:mariadb://172.17.0.1:3308/MytestDB
     *
     * @param out for html printing in front-end e.g. (for errors or content)
     * @return connection to db
     * @throws SQLException if the connection fails
     */
    public Connection getConnection(PrintWriter out) throws SQLException, ClassNotFoundException {
        Connection toReturn = null;
        Class.forName("org.mariadb.jdbc.Driver");
        try {
            toReturn = (connection != null)
                ? connection
                : DriverManager.getConnection(
                    "jdbc:mariadb://172.17.0.1:3308/MytestDB",
                    "root",
                    "12345");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("SQL Exception " + e);
        }
        return toReturn;
    }

  /*  public static DriverManagerDataSource getDataSource() {
        Map<String, String> result = getProperties();
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("org.mariadb.jdbc.Driver");
        dataSource.setUrl(result.get("URL"));
        dataSource.setUsername(result.get("username"));
        dataSource.setPassword(result.get("password"));
        return dataSource;
    }
*/

}

