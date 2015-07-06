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

	String q = "SELECT * FROM movie LIMIT 100";

	Class.forName("org.postgresql.Driver");
	connection = java.sql.DriverManager
			.getConnection("jdbc:postgresql://" + dbServer + ":" + dbPort + "/" + dbName, dbUser, password);
	statement = connection.createStatement();
	result = statement.executeQuery(q);
%>

<html>
<head>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="starter-template.css" rel="stylesheet">

<title>TEST</title>
</head>

<body>
	<div class="container">

		<div class="starter-template">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">Output:</div>
				<div class="panel-body">
					<p>Description here</p>
				</div>
				<!-- Table -->
				<table class="table table-hover table-condensed table-striped">
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
			</div>
		</div>

	</div>
	<!-- /.container -->

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>