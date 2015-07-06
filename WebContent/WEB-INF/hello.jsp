<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Servlet Hello World</title>
<style>
.error {
	color: red;
}

.success {
	color: green;
}
</style>
</head>
<body>
	<form action="hello" method="post">
		<h1>Hello</h1>

		<p>
			<label for="name">What's your name?</label> <input id="name"
				name="name" value="${fn:escapeXml(param.name)}"> <span
				class="error">${messages.name}</span>
		</p>

		<p>
			<label for="age">What's your age?</label> <input id="age" name="age"
				value="${fn:escapeXml(param.age)}"> <span class="error">${messages.age}</span>
		</p>

		<p>
			<input type="submit"> <span class="success">${messages.success}</span>
		</p>
	</form>
</body>
</html>