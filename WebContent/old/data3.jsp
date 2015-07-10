<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="app.SimpleTable"%>
<%@page import="app.Query"%>
<%@page import="java.sql.Connection"%>
<%@page import="app.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	ConnectionFactory connFactory = new ConnectionFactory();
	Connection conn = connFactory.getConnection();
	Query query = new Query(conn);
	SimpleTable sTable1 = query.actorDebutYear("Johnny Depp");
	sTable1.printToConsole2();

	pageContext.setAttribute("table", sTable1);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>c:forEach Tag Example</title>
</head>
<body>
	<table>
	</table>
</body>
</html>