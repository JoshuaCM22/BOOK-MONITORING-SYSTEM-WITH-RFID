package Connection;

import static JFrames.Objects.con;
import java.sql.*;
import java.sql.DriverManager;

/**
 *
 * @author Joshua C. Magoliman
 */
public class DatabaseConnection {

    private static DatabaseConnection dbc;
    private String username = "root";
    private String password = "562622";
    private String connection = "jdbc:mysql://localhost:3306/book_monitoring_system_with_rfid?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

    private DatabaseConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("INITIALIZATION");
            con = DriverManager.getConnection(connection, username, password);
            System.out.println("SUCCESSFULLY CONNECTED");
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    public static DatabaseConnection getDatabaseConnection() {

        if (dbc == null) {
            dbc = new DatabaseConnection();
        }
        return dbc;
    }

    public Connection getConnection() {
        return con;
    }
}
