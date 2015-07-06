package app;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * The Query Class provides methods to query a given database.
 *
 */
public class Query {

	private Connection connection;

	/**
	 * Constructor method for Query. Requires a Connection.
	 * 
	 * @param connection
	 *            The connection to the database.
	 */
	public Query(Connection connection) {
		this.connection = connection;
	}

	/**
	 * Query: Show 100 entries of the movie table.
	 * 
	 * @return SimpleTable The query result, mapped to a SimpleTable.
	 * @throws SQLException SQLException on Query errors.
	 */
	public SimpleTable showMovie100() throws SQLException {
		String query = "SELECT * FROM movie LIMIT 100;";
		return statementQuery(query);
	}

	/**
	 * Query: All movies produced in a specific year.
	 * 
	 * @param year
	 *            The production year.
	 * @param limit
	 *            Number of results which should be returned.
	 * @return SimpleTable The query result, mapped to a SimpleTable.
	 * @throws SQLException SQLException on Query errors.
	 */
	public SimpleTable allMoviesYear(String year, int limit)
			throws SQLException {
		String query = "SELECT pyear,mname FROM movie WHERE pyear = ? LIMIT ?";
		Object[] setStuff = { year, limit };
		return preparedStatementQuery(query, setStuff);
	}

	/**
	 * Query: The top n movies, depending only on their rating.
	 * 
	 * @param count
	 *            How many top movies.
	 * @return SimpleTable The query result, mapped to a SimpleTable.
	 * @throws SQLException SQLException on Query errors.
	 */
	public SimpleTable topMovies(int count) throws SQLException {
		String query = "SELECT mname AS \"Top " + count
				+ " Movies\", rating AS \"Rating\" "
				+ "FROM movie WHERE rating!='NA' ORDER BY rating DESC LIMIT ?";
		Object[] setStuff = { count };
		return preparedStatementQuery(query, setStuff);
	}

	/**
	 * Query: The longest entry in a column.
	 * 
	 * @param table
	 *            Which table.
	 * @param column
	 *            Which column.
	 * @param titleName
	 *            The title for the returned table.
	 * @return SimpleTable The query result, mapped to a SimpleTable.
	 * @throws SQLException SQLException on Query errors.
	 */
	public SimpleTable longestEntry(String table, String column,
			String titleName) throws SQLException {
		String query = "select " + column + " as \"" + titleName + "\" from "
				+ table + " where length(" + column + ") = (select max(length("
				+ column + ")) from " + table + ")";
		return statementQuery(query);
	}

	/**
	 * Query: The n longest entries in a column.
	 * 
	 * @param table
	 *            Which table.
	 * @param column
	 *            Which column.
	 * @param titleName
	 *            The title for the returned table.
	 * @param count How many will be returned.
	 * @return SimpleTable The query result, mapped to a SimpleTable.
	 * @throws SQLException SQLException on Query errors.
	 */
	public SimpleTable longestEntry(String table, String column,
			String titleName, int count) throws SQLException {
		String query = "SELECT " + column + " AS \"" + titleName + "\" FROM "
				+ table + " ORDER BY length(" + column + ") DESC LIMIT ?";
		Object[] setStuff = { count };
		return preparedStatementQuery(query, setStuff);
	}

	/**
	 * Query: The debut year of an actor
	 * 
	 * @param actor
	 *            the actor's name as a string.
	 * @return SimpleTable The query result, mapped to a SimpleTable.
	 * @throws SQLException SQLException on Query errors.
	 */
	public SimpleTable actorDebutYear(String actor) throws SQLException {
		String query = "select aname AS \"Actor Name\" ,mname as \"Movie Title\","
				+ "pyear AS \"Production Year\" from movie, acts_in, actor "
				+ "WHERE movie.imdbid=acts_in.imdbid "
				+ "and acts_in.actorid=actor.actorid "
				+ "and actor.aname=? "
				+ "ORDER BY pyear ASC LIMIT 1;";
		Object[] setStuff = { actor };
		return preparedStatementQuery(query, setStuff);
	}

	/**
	 * This method is used to execute Statement Queries.
	 * 
	 * @param query
	 *            The query string.
	 * @return SimpleTable The query result, mapped to a SimpleTable.
	 * @throws SQLException
	 */
	private SimpleTable statementQuery(String query) throws SQLException {
		Statement stmt = connection.createStatement();
		ResultSet rset = stmt.executeQuery(query);
		SimpleTable sTable = new SimpleTable(rset);
		if (stmt != null) {
			stmt.close();
		}
		return sTable;
	}

	/**
	 * This method is used to execute PreparedStatement Queries.
	 * 
	 * @param query
	 *            The query string.
	 * @param setStuff
	 *            Array of strings and/or ints as Arguments for the query.
	 * @return SimpleTable The query result, mapped to a SimpleTable.
	 * @throws SQLException
	 */
	private SimpleTable preparedStatementQuery(String query, Object[] setStuff)
			throws SQLException {
		PreparedStatement prepstmt = connection.prepareStatement(query);
		for (int i = 0; i < setStuff.length; i++) {
			Object object = setStuff[i];
			if (object instanceof String) {
				prepstmt.setString(i + 1, (String) object);
			}
			if (object instanceof Integer) {
				prepstmt.setInt(i + 1, (int) object);
			}
		}
		ResultSet rset = prepstmt.executeQuery();
		SimpleTable sTable = new SimpleTable(rset);
		if (prepstmt != null) {
			prepstmt.close();
		}
		return sTable;
	}

}
