<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Configure Your Product!</title>
</head>
<body>
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript">
		function addToCart(productPosition,toppingId,optionId) {
			///cart/product/add/toppings/{toppingId}/{optionId}
			$
					.ajax({
						type : "post",
						url : "/PizzaStore/cart/product/" + productPosition + "/add/toppings/" + toppingId + "/" + optionId,
						contentType : "application/json",
						success : function(responseJson) {
							{
								var myCart = JSON.parse(responseJson);
								var totalprice = 0;

								var cartTable = "<table> ";

								$.each(myCart, function(key, value) {
									cartTable = cartTable + "<tr> <td width='30%' bgcolor='#FFCCFF'><b>Product</b></td><td width='60%' bgcolor='#FFCCFF'><b>" + value['productName'] + "</b></td> <td width='10%' bgcolor='#FFCCFF'><b>" + value['productPrice'] + "</b></td></tr>";
									totalprice = Math.abs(parseInt(totalprice,10)+ parseInt(value['productPrice'], 10));
									$.each(value['topping'], function(index, val){
									cartTable = cartTable + "<tr><td>"
											+ val['toppingName'] + " </td>";
									cartTable = cartTable + "<td>"
											+ val['toppingOptionName'] + " </td>";
									cartTable = cartTable + "<td>"
											+ val['toppingOptionPrice'] + " </td></tr>";
									totalprice = Math.abs(parseInt(totalprice,
											10)
											+ parseInt(val['toppingOptionPrice'], 10));
									});
								});

								cartTable = cartTable
										+ "<tr><td colspan='2' bgcolor='#FFFF99'>Total Price</td><td bgcolor='#FFFF99'>"
										+ totalprice + "</td></tr>";
								cartTable = cartTable + "</table>";

								$("#cart").replaceWith(
										"<span id=\"cart\">" + cartTable
												+ "</span>");
							}

						}
					});

		}
	</script>

	<table>
		<tr>
			<td width=70% valign="top">
				<div style="color: teal; font-size: 30px">Choose Your Toppings</div>
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
								<td valign="top"> 
										<c:forEach
										items="${topping.toppingOptions}" var="toppingOption">
										<input type="radio" name="options[${fn:trim(topping.name)}]" value="${toppingOption.name}" onchange="addToCart(${productPosition},${topping.toppingId},${toppingOption.optionId})" />
										
										<c:out value="${toppingOption.name}" /> (Rs. <c:out value="${toppingOption.price}" />/-)
			
										<br>
										
									</c:forEach></td>
							</tr>
						</c:forEach>
					</table>
				</c:if>

				<p>All pizzas include our special mix of fresh cheeses. Extra
					ingredients cost as per ingredient.</p>
				<p>
					<a href="/PizzaStore/cart/product/add/more">Continue......</a>
				</p></td>
			<td valign="top" width=30%><span id="cart"> <c:if
						test="${!empty sessionScope.productOrderList}">
						<table>
							<fmt:parseNumber var="totPrice" type="number" value="0" />
							<c:forEach items="${sessionScope.productOrderList}" var="product">
								<tr>

									<td width='30%' bgcolor='#FFCCFF'><b>Product</b></td>
									<td width='60%' bgcolor='#FFCCFF'><b><c:out
												value="${product.productName}" /></b></td>
									<td width='10%' bgcolor='#FFCCFF'><b><c:out
												value="${product.productPrice}" /></b></td>
									<fmt:parseNumber var="totPrice" type="number"
										value="${totPrice + product.productPrice}" />
								</tr>

								<c:if test="${!empty product.topping}">
									<c:forEach items="${product.topping}" var="topping">
										<tr>

											<td><c:out value="${topping.toppingName}" /></td>
											<td><c:out value="${topping.toppingOptionName}" /></td>
											<td><c:out value="${topping.toppingOptionPrice}" /></td>
											<fmt:parseNumber var="totPrice" type="number"
												value="${totPrice + topping.toppingOptionPrice}" />
										</tr>
									</c:forEach>
								</c:if>

							</c:forEach>
							<tr>
								<td colspan='2' bgcolor='#FFFF99'>Total Price</td>
								<td bgcolor='#FFFF99'><c:out value="${totPrice}" /></td>
							</tr>
						</table>
					</c:if>
			</span></td>
		</tr>
	</table>
</body>
</html>
