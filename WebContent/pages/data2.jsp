<%@page import="app.Query"%>
<%@page import="app.SimpleTable"%>
<%@page import="app.util.Helper"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="app.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	ConnectionFactory connFactory = new ConnectionFactory();
	Connection conn = connFactory.getConnection();
	Query query = new Query(conn);

	SimpleTable outputTable = null;

	String parameter = request.getParameter("param1");
	String parameter2 = request.getParameter("param2");
	String queryType = request.getParameter("queryType");
	if (parameter != null && !parameter.isEmpty()) {
		switch (queryType) {
		case "topMovies":
			outputTable = query.topMovies(Helper.tryConvertString2Integer(parameter));
			break;
		case "actorsDebut":
			outputTable = query.actorsDebut(parameter);
			break;
		case "mostMovies":
			outputTable = query.mostMovies(parameter, parameter2);
			break;
		case "directorsFav":
			outputTable = query.directorsFav(parameter);
			break;
		case "bestOfYear":
			outputTable = query.bestOfYear(parameter, parameter2);
			break;
		case "worstOfYear":
			outputTable = query.worstOfYear(parameter, parameter2);
			break;
		case "longestMovieName":
			outputTable = query.longestEntry("movie", "mname", "Longest Movie Title");
			break;
		case "longestActorName":
			outputTable = query.longestEntry("actor", "aname", "Longest Actor Name");
			break;
		case "longestDirectorName":
			outputTable = query.longestEntry("director", "dname", "Longest Director Name");
			break;
		case "searchMovies":
			outputTable = query.searchMovie(parameter);
			break;
		case "searchActors":
			outputTable = query.searchActor(parameter);
			break;
		case "searchDirectors":
			outputTable = query.searchDirector(parameter);
			break;

		default:
			break;
		}

	}

	pageContext.setAttribute("table", outputTable, PageContext.PAGE_SCOPE);
%>
<c:if test="${ not empty table}">
	<!-- 	<div class="table-responsive"> -->
	<!-- 		<table class="table table-striped table-bordered table-hover"> -->

	<div class="dataTable_wrapper">
		<table class="table table-striped table-bordered table-hover"
			id="dataTables-example">

			<thead>
				<tr>
					<c:forEach var="head" items="${table.columnNames}">
						<th>${head}</th>
					</c:forEach>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${table.tableData}">
					<tr>
						<c:forEach var="entry" items="${row}">
							<td>${entry}</td>
						</c:forEach>
					</tr>
				</c:forEach>
		</table>
	</div>
	<!-- /.table-responsive -->
</c:if>

