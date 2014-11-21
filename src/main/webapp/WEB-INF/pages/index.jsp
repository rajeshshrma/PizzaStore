<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>

<html lang="en" data-ng-app="pizzastore">
<head>

<title><spring:message code="indexPage.title" /></title>

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
<body data-ng-controller="PageController as pageCtrl">


	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<div class="brand">
					<spring:message code="indexPage.brandName" />
				</div>
			</div>

		</div>
	</div>

	<div id="wrap1" data-ng-show="pageCtrl.showOption.showLogin">
		<div class="container">
			<div class="row">
				<div class="span6" id="form-login">
					<form class="form-horizontal well" name="loginForm"
						data-ng-submit="loginUser()">
						<fieldset style="border: 0 none">
							<legend>
								<spring:message code="indexPage.loginForm.heading" />
							</legend>
							<div data-ng-show="pageCtrl.loginStatus.isUnauthorised"
								class="alert alert-danger">
								<spring:message code="indexPage.loginForm.invalidLoginErrorMsg" />
							</div>

							<div class="control-group">
								<div class="control-label">
									<label>Email ID </label>
								</div>
								<div class="controls">
									<input name="emailid" type="email"
										placeholder="type your email id" class="input-large"
										style="height: 26px;" data-ng-model="emailid"
										required="required"> <span
										data-ng-show="loginForm.emailid.$dirty && loginForm.emailid.$invalid">
										<span class="error" style="color: red"
										data-ng-show="loginForm.emailid.$error.email"> <span
											class="glyphicon glyphicon-remove"></span>
									</span> <span class="error" style="color: red"
										data-ng-show="loginForm.emailid.$error.required"> <span
											class="glyphicon glyphicon-remove"></span>
									</span>
									</span> <span
										data-ng-show="loginForm.emailid.$dirty && loginForm.emailid.$valid">
										<span class="error" style="color: green"
										data-ng-show="!loginForm.emailid.$error.email"> <span
											class="glyphicon glyphicon-ok"></span>
									</span>
									</span>
								</div>

							</div>

							<div class="control-group">
								<div class="control-label">
									<label>Password</label>
								</div>
								<div class="controls">
									<input style="height: 26px;" type="password" name="password"
										placeholder="type your password" data-ng-model="password"
										class="input-large" data-ng-minlength=5 data-ng-maxlength=20
										required="required"> <span
										data-ng-show="loginForm.password.$dirty && loginForm.password.$invalid">
										<span class="error" style="color: red"
										data-ng-show="loginForm.password.$error.minlength"> <span
											class="glyphicon glyphicon-remove"></span>
									</span> <span class="error" style="color: red"
										data-ng-show="loginForm.password.$error.maxlength"> <span
											class="glyphicon glyphicon-remove"></span>
									</span> <span class="error" style="color: red"
										data-ng-show="loginForm.password.$error.required"> <span
											class="glyphicon glyphicon-remove"></span>
									</span>
									</span> <span
										data-ng-show="loginForm.password.$dirty && loginForm.password.$valid">
										<span class="error" style="color: green"
										data-ng-show="!loginForm.password.$error.required"> <span
											class="glyphicon glyphicon-ok"></span>
									</span>
									</span>
								</div>

							</div>

							<div class="control-group">
								<div class="controls">

									<button type="submit" id="submit"
										class="btn btn-primary button-loading"
										data-loading-text="Loading..."
										data-ng-disabled="loginForm.$invalid">
										<span class="glyphicon glyphicon-user"></span> Sign in
									</button>

									<button type="button" data-ng-click="showForgetFormWindows()"
										class="btn btn-secondary">Forgot Password</button>

								</div>
							</div>
						</fieldset>
					</form>

					<form class="form-horizontal well" name="signupForm"
						data-ng-submit="checkEmailID()">
						<fieldset style="border: 0 none">
							<legend>
								<spring:message code="indexPage.signupForm.heading" />
							</legend>
							<div data-ng-show="pageCtrl.emailStatus.isExist"
								class="alert alert-danger">{{pageCtrl.emailStatus.statusMsg}}
							</div>

							<div data-ng-show="pageCtrl.emailStatus.isInvalid"
								class="alert alert-danger">{{pageCtrl.emailStatus.statusMsg}}
							</div>

							<div class="control-group">
								<div class="control-label">
									<label>Email ID</label>
								</div>
								<div class="controls">
									<input name="emailid" style="height: 26px;" type="email"
										placeholder="Email Address" class="input-large"
										data-ng-model="emailid" required="required"> <span
										data-ng-show="signupForm.emailid.$dirty && signupForm.emailid.$invalid">
										<span class="error" style="color: red"
										data-ng-show="signupForm.emailid.$error.email"> <span
											class="glyphicon glyphicon-remove"></span>
									</span> <span class="error" style="color: red"
										data-ng-show="signupForm.emailid.$error.required"> <span
											class="glyphicon glyphicon-remove"></span>
									</span>
									</span> <span
										data-ng-show="signupForm.emailid.$dirty && signupForm.emailid.$valid">
										<span class="error" style="color: green"
										data-ng-show="!signupForm.emailid.$error.email"> <span
											class="glyphicon glyphicon-ok"></span>
									</span>
									</span>
								</div>



							</div>

							<div class="control-group">
								<div class="controls">
									<button type=submit data-ng-disabled="signupForm.$invalid"
										class="btn btn-primary button-loading"
										data-loading-text="Loading...">
										<span class="glyphicon glyphicon-user"></span> Sign up
									</button>
								</div>
							</div>

						</fieldset>
					</form>

				</div>
			</div>
		</div>
	</div>


	<div id="wrap2" data-ng-show="pageCtrl.showOption.showSignupMsg">
		<div class="container">
			<div class="row">
				<div class="span6" id="form-login">

					<div class="form-horizontal well">
						<fieldset style="border: 0 none">
							<legend>Success</legend>

							<div class="control-group">
								{{pageCtrl.showOption.showMsg}} Go to <a href="/PizzaStore/">Home
									Page</a>
							</div>

						</fieldset>
					</div>

				</div>
			</div>
		</div>
	</div>


	<div id="wrap3"
		data-ng-show="pageCtrl.showOption.showForgetPasswordForm">
		<div class="container">
			<div class="row">
				<div class="span6" id="form-login">
					<form class="form-horizontal well" name="forgetPasswordForm"
						data-ng-submit="checkRegisteredEmailID()">
						<fieldset style="border: 0 none">
							<legend>
								<spring:message code="indexPage.forgetPasswordForm.heading" />
							</legend>
							<div data-ng-show="pageCtrl.emailStatus.isNotRegistered"
								class="alert alert-danger">
								<spring:message
									code="indexPage.forgetPasswordForm.Messages.emailIDNotFound" />
								<a href="/PizzaStore/"><spring:message
										code="indexPage.forgetPasswordForm.linkLabel.homePage" /></a>
							</div>

							<div class="control-group">
								<div class="control-label">
									<label><spring:message
											code="indexPage.forgetPasswordForm.label.emailid" /></label>
								</div>
								<div class="controls">
									<input name="emailid" style="height: 26px;" type="email"
										placeholder="Email Address" class="input-large"
										data-ng-model="emailid" required="required"> <span
										data-ng-show="forgetPasswordForm.emailid.$dirty && forgetPasswordForm.emailid.$invalid">
										<span class="error" style="color: red"
										data-ng-show="forgetPasswordForm.emailid.$error.email">
											<span class="glyphicon glyphicon-remove"></span>
									</span> <span class="error" style="color: red"
										data-ng-show="forgetPasswordForm.emailid.$error.required">
											<span class="glyphicon glyphicon-remove"></span>
									</span>
									</span> <span
										data-ng-show="forgetPasswordForm.emailid.$dirty && forgetPasswordForm.emailid.$valid">
										<span class="error" style="color: green"
										data-ng-show="!forgetPasswordForm.emailid.$error.email">
											<span class="glyphicon glyphicon-ok"></span>
									</span>
									</span>
								</div>



							</div>

							<div class="control-group">
								<div class="controls">
									<button type=submit
										data-ng-disabled="forgetPasswordForm.$invalid"
										class="btn btn-primary button-loading"
										data-loading-text="Loading...">
										<span class="glyphicon glyphicon-user"></span> Reset Password
									</button>
								</div>
							</div>

						</fieldset>
					</form>

				</div>
			</div>
		</div>
	</div>


	<div id="wrap4" data-ng-show="pageCtrl.showOption.showForgetPasswordSuccessForm">
		<div class="container">
			<div class="row">
				<div class="span6" id="form-login">

					<div class="form-horizontal well">
						<fieldset style="border: 0 none">
							<legend>Success</legend>

							<div class="control-group">
								<spring:message
										code="indexPage.forgetPasswordForm.Messages.emailIDFound" /> <a href="/PizzaStore/"><spring:message
										code="indexPage.forgetPasswordSuccessForm.linkLabel.homePage" /></a>
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