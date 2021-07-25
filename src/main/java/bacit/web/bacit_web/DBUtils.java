package bacit.web.bacit_web;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtils {
    private static final DBUtils INSTANCE = new DBUtils();
    static Connection connection;

    /**
     * initiates the class as a singleton.
     *
     * @return DbTool
     */
    public static DBUtils getINSTANCE() {
        return INSTANCE;
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
}

