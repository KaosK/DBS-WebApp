<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// database - setup
	String dbServer = "localhost";
	String dbPort = "15432";
	String dbName = "movies";
	String dbUser = "myapp";
	String password = "dbpass";

	java.sql.Connection conn = null;
	java.sql.Statement stmt = null;
	java.sql.ResultSet rset = null;

	Connection connection = null;
	Statement statement = null;
	ResultSet result = null;

	String q = "SELECT * FROM movie LIMIT 10";

	Class.forName("org.postgresql.Driver");
	connection = java.sql.DriverManager
			.getConnection("jdbc:postgresql://" + dbServer + ":" + dbPort + "/" + dbName, dbUser, password);
	statement = connection.createStatement();
	result = statement.executeQuery(q);
%>

<html>
<head>

<title>TEST</title>
</head>

<!-- Table -->
<table class="table">
	<thead>
		<tr>
			<th>IMDB ID</th>
			<th>Title</th>
			<th>prod. Year</th>
			<th>Rating</th>
		</tr>
	</thead>
	<tbody>
		<%
			while (result.next()) {
		%>
		<tr>
			<td><%=result.getString(1)%></td>
			<td><%=result.getString(2)%></td>
			<td><%=result.getString(3)%></td>
			<td><%=result.getString(4)%></td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>
</body>
</html>