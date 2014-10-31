<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Home Page - Online Pizza Store</title>
</head>
<body>
	<h3 align="center">Online Pizza Store</h3>

	<div style="color: teal; font-size: 30px">Home Page</div>

	<div style="margin: 0 auto; width: 75%; text-align: center;">

		<form:form modelAttribute="login" method="POST"
			action="authenticate">
			<table>
				<tr>
					<td><form:label path="emailid">Email ID</form:label></td>
					<td><form:input path="emailid" /></td>
				</tr>
				<tr>
					<td><form:label path="password">Password</form:label></td>
					<td><form:input path="password" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="Login" /></td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>
