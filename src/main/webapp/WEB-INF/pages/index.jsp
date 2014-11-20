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


</head>
<body data-ng-controller="PageController as pageCtrl">


	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<div class="brand"><spring:message code="indexPage.brandName" /></div>
			</div>

		</div>
	</div>

	<div id="wrap1" data-ng-show="pageCtrl.showOption.showLogin">
		<div class="container">
			<div class="row">
				<div class="span6" id="form-login">
					<form class="form-horizontal well" name="loginForm"
						data-ng-submit="loginUser()">
						<fieldset>
							<legend><spring:message code="indexPage.loginForm.heading" /></legend>
							<div data-ng-show="pageCtrl.loginStatus.isUnauthorised"
								class="alert alert-danger"><spring:message code="indexPage.loginForm.invalidLoginErrorMsg" />
							</div>

							<div class="control-group">
								<div class="control-label">
									<label>Email ID</label>
								</div>
								<div class="controls">
									<input name="emailid" type="email"
										placeholder="type your email id" class="input-large"
										data-ng-model="emailid" required="required">
								</div>
								<div class="controls"
									data-ng-show="loginForm.emailid.$dirty && loginForm.emailid.$invalid">
									<small class="error" style="color: red"
										data-ng-show="loginForm.emailid.$error.email"> Invalid
										email </small> <small class="error" style="color: red"
										data-ng-show="loginForm.emailid.$error.required">
										Email ID is required </small>
								</div>
							</div>

							<div class="control-group">
								<div class="control-label">
									<label>Password</label>
								</div>
								<div class="controls">
									<input type="password" name="password"
										placeholder="type your password" data-ng-model="password"
										class="input-large" data-ng-minlength=5 data-ng-maxlength=20
										required="required">
								</div>
								<div class="controls"
									data-ng-show="loginForm.password.$dirty && loginForm.password.$invalid">
									<small class="error" style="color: red"
										data-ng-show="loginForm.password.$error.minlength">
										Password should be of at least 5 characters </small> <small
										class="error" style="color: red"
										data-ng-show="loginForm.password.$error.maxlength">
										Password cannot be longer than 20 characters </small> <small
										class="error" style="color: red"
										data-ng-show="loginForm.password.$error.required">
										Password is required </small>
								</div>
							</div>

							<div class="control-group">
								<div class="controls">

									<button type="submit" id="submit"
										class="btn btn-primary button-loading"
										data-loading-text="Loading...">Sign in</button>

									<button type="button" class="btn btn-secondary button-loading"
										data-loading-text="Loading...">Forgot Password</button>

								</div>
							</div>
						</fieldset>
					</form>

					<form class="form-horizontal well" name="signupForm"
						data-ng-submit="checkEmailID()">
						<fieldset>
							<legend><spring:message code="indexPage.signupForm.heading" /></legend>
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
									<input name="emailid" type="email" placeholder="Email Address"
										class="input-large" data-ng-model="emailid"
										required="required">
								</div>

							</div>

							<div class="control-group">
								<div class="controls">
									<button type=submit class="btn btn-primary button-loading"
										data-loading-text="Loading...">Sign up</button>
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
						<fieldset>
							<legend>Success</legend>

							<div class="control-group">{{pageCtrl.showOption.showMsg}}
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