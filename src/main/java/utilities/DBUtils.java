package utilities;

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
     * username=root (alternatively "bf2statslogger")
     * password=*none* (alternatively "bf2")
     * URL=jdbc:mariadb://localhost:3306/bf2stats
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
                    "jdbc:mariadb://localhost:3306/bf2stats",
                    "root",
                    "");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("SQL Exception " + e);
        }
        return toReturn;
    }
}

