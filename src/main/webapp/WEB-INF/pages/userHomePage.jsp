<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>

<html lang="en" data-ng-app="pizzastore">
<head>

<title><spring:message code="userHomePage.title" /></title>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/angular.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/bootstrap-button.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/application.js"></script>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap-responsive.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap-custom.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap-glyphicons.css">


</head>
<body>


	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<div class="brand">
					<spring:message code="userHomePage.brandName" />
				</div>
				<div align=right>
					<div class="brand">
						<a href="/PizzaStore/user/signout"><span style="color: red"
							class="glyphicon glyphicon-off"></span> <spring:message
								code="userHomePage.link.label.signout" /> </a>
					</div>
				</div>
			</div>

		</div>
	</div>

	<div id="wrap1">
		<div class="container">
			<div class="row">
				<div class="span6" id="form-login">
					<div class="form-horizontal well">
						<fieldset style="border:0 none">
							<legend>
								<spring:message code="userHomePage.heading" />
							</legend>

							<div class="control-group">
								<spring:message code="userHomePage.welcomeMessage" />
							</div>

						</fieldset>
					</div>

				</div>
			</div>
		</div>
	</div>



	<footer class="footer">
		<div class="container">
			<p class="text-muted">................................................</p>
		</div>
	</footer>
</body>
</html>