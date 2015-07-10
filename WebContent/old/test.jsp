<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		java.util.ArrayList<ArrayList<String>> table = new java.util.ArrayList<>();
		java.util.ArrayList<String> row = new java.util.ArrayList<>();
		row.add("1st");
		row.add("2nd");
		row.add("3rd");
		row.add("4th");
		table.add(row);
		table.add(row);
		table.add(row);
		table.add(row);

		pageContext.setAttribute("table", table, PageContext.PAGE_SCOPE);
	%>
	<table>
		<c:forEach var="row" items="${table}">
			<tr>
				<c:forEach var="entry" items="${row}">
					<td>${entry}</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
</body>
</html>