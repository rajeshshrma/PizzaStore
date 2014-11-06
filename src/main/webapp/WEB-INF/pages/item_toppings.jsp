<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Configure Your Order!</title>
</head>
<body>

	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript">
 
function addToCart(itemid) { 

	$.ajax({
          type: "post",
          url: "/PizzaStore/cart/item/add/" + itemid, 
          contentType:"application/json",
          success: function(responseJson){      
        	  { var myCart = JSON.parse(responseJson);
        	  var totalprice=0;
        	  
        	  var cartTable="<table> <tr> <th width='20%' bgcolor='#FFCCFF'>Item</th> <th width='10%' bgcolor='#FFCCFF'>Quantity</th> <th width='20%' bgcolor='#FFCCFF'>Total Price</th></tr>";
 	  
        	  $.each(myCart, function(key,value)
        	  { 
        		  cartTable = cartTable + "<tr><td>" + value['name'] + " </td>";
        		  cartTable = cartTable + "<td>" + value['quantity'] + " </td>";
        		  cartTable = cartTable + "<td>" + value['price'] + " </td></tr>";
        		  totalprice = Math.abs(parseInt(totalprice,10) + parseInt(value['price'],10));
        	  });
    	  
        	  cartTable = cartTable + "<tr><td colspan='2' bgcolor='#FFFF99'>Total Price</td><td bgcolor='#FFFF99'>" + totalprice + "</td></tr>";
        	  cartTable = cartTable + "</table>" ;
        	  
        	  
        		  $("#cart").replaceWith("<span id=\"cart\">" + cartTable + "</span>");}
       
          }
      });
      
}
 
</script>

	<div style="color: blue; font-size: 30px">Session Detail :
		${sessionid} - (${createtime})</div>
	<div style="color: blue; font-size: 30px">Page hit counter:
		${cookie.hitCounter.value}</div>

	<table>
		<tr>
			<td width=70% valign="top">
				<div style="color: teal; font-size: 30px">List of All Items</div>
			</td>
			<td width=30% valign="top">
				<div style="color: teal; font-size: 30px">Cart Detail</div>
			</td>
		</tr>
		<tr>
			<td width=70% valign="top"><c:if test="${!empty items}">
					<table width=100%>
						<tr>
							<th width="20%" bgcolor="#EEEEEE">Item</th>
							<th width="40%" bgcolor="#EEEEEE">Description</th>
							<th width="20%" bgcolor="#EEEEEE">Price (per item)</th>
							<th width="20%" bgcolor="#EEEEEE">Add/Remove</th>
						</tr>
						<c:forEach items="${items}" var="item">
							<tr
								style="background-color: white; color: black; text-align: left;"
								height="30px">

								<td><c:out value="${item.name}" /></td>
								<td><c:out value="${item.description}" /></td>
								<td><c:out value="${item.price}" /></td>
								<td><a href="#" onclick="addToCart(${item.itemid})">Add
										to Cart</a></td>

							</tr>
						</c:forEach>
					</table>
				</c:if>

				<p>All pizzas include our special mix of fresh cheeses. Extra
					ingredients cost as per ingredient.</p>
				<p>
					<a href="/PizzaStore/cart/item/toppings/list">Next......</a>
				</p></td>
			<td valign="top" width=30%><span id="cart"></span>
			</td>
		</tr>
	</table>

</body>
</html>
