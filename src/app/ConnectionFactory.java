package app;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * The creator class for the database connection.
 *
 */
public class ConnectionFactory {

	// Database - Setup
	private static String dbServer;
	private static String dbPort;
	private static String dbName;
	private static String dbUser;
	private static String dbPass;

	public ConnectionFactory() {
		dbServer = "localhost";
		dbPort = "15432";
		dbName = "movies";
		dbUser = "myapp";
		dbPass = "dbpass";
	}

	/**
	 * A factory method for creating a connection to the database.
	 * 
	 * @return Connection The connection to the database.
	 */
	public Connection getConnection() {
		try {
			// loading the driver
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException cnfe) {
			System.out.println("The postgresql driver could not be loaded.");

			// print stacktrace
			cnfe.printStackTrace();
			System.exit(0);
		}

		Connection conn = null;

		try {
			// connect to the database
			conn = DriverManager.getConnection("jdbc:postgresql://" + dbServer + ":" + dbPort + "/" + dbName, dbUser,
					dbPass);
		} catch (SQLException sqle) {
			System.out.println("The connection could not be established.");

			// print stacktrace
			sqle.printStackTrace();
			System.exit(0);
		}

		System.out.println(
				"Connection to database " + dbName + "@" + dbServer + ":" + dbPort + " successfully established.");

		return conn;
	}
}
