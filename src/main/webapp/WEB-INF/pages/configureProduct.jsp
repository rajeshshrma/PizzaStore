<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Configure Your Order!</title>
</head>
<body>
	<form>
		<table>
			<tr>
				<td width=70% valign="top">
					<div style="color: teal; font-size: 30px">List of All
						Toppings</div>
				</td>
				<td width=30% valign="top">
					<div style="color: teal; font-size: 30px">Cart Detail</div>
				</td>
			</tr>
			<tr>
				<td width=70% valign="top"><c:if test="${!empty toppingsList}">
						<table width=100% border="1">
							<tr>
								<th width="20%" bgcolor="#EEEEEE">Your Product</th>
								<th width="40%" bgcolor="#EEEEEE">${product.name}</th>
							</tr>
							<tr>
								<th width="20%" bgcolor="#EEEEEE">Topping</th>
								<th width="40%" bgcolor="#EEEEEE">Options</th>
							</tr>
							<c:forEach items="${toppingsList}" var="topping">
								<tr
									style="background-color: white; color: black; text-align: left;"
									height="30px">

									<td valign="top"><c:out value="${topping.name}" /></td>
									<td valign="top"><c:forEach
											items="${topping.toppingOptions}" var="toppingOption">

											<input type="checkbox"> <c:out value="${toppingOption.name}" /> (Rs. <c:out
												value="${toppingOption.price}" />/-)<br>

										</c:forEach></td>
								</tr>
							</c:forEach>
						</table>
					</c:if>

					<p>All pizzas include our special mix of fresh cheeses. Extra
						ingredients cost as per ingredient.</p>
					<p>
						<a href="/PizzaStore/cart/product/toppings/list">Next......</a>
					</p></td>
				<td valign="top" width=30%><span id="cart"></span></td>
			</tr>
		</table>
	</form>
</body>
</html>
