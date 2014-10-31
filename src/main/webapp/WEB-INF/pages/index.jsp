<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Configure Your Order!</title>
</head>
<body>

		<div style="color: teal; font-size: 30px">List of All Items</div>

		<c:if test="${!empty items}">
			<table width=100%>
				<tr>
					<th width="20%" bgcolor="#EEEEEE">Item</th>
					<th width="40%" bgcolor="#EEEEEE">Description</th>
					<th width="20%" bgcolor="#EEEEEE">Price</th>
					<th width="20%" bgcolor="#EEEEEE">Add/Remove</th>
				</tr>
				<c:forEach items="${items}" var="item">
					<tr
						style="background-color: white; color: black; text-align: left;"
						height="30px">

						<td><c:out value="${item.name}" /></td>
						<td><c:out value="${item.description}" /></td>
						<td><c:out value="${item.price}" /></td>
						<td><a href="addtocart?itemid=${item.itemid}">Add to Cart</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>


		<p>All pizzas include our special mix of fresh cheeses. Extra
			ingredients cost as per ingredient.</p>
		<p>
			<a href="form">Next......</a>
		</p>
</body>
</html>
