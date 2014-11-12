<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Your Products Detail!</title>
</head>
<body>
	<table>
		<tr>
			<td valign="top" colspan='3'>
				<div style="color: teal; font-size: 30px">Your Products
					Detail!</div>
			</td>
		</tr>
		<tr>

			<c:if test="${!empty sessionScope.productOrderList}">
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

			</c:if>
	</table>
</body>
</html>
