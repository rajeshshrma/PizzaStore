<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html lang="en" data-ng-app="pizzastore">
<head>

<title>User Registration</title>

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
<body data-ng-controller="EmailFormController as emailCtrl">


	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<div class="brand">PIZZA STORE</div>
			</div>

		</div>
	</div>

	<div id="wrap1"
		data-ng-show="emailCtrl.showRegFormOption.showEmailForm">
		<div class="container">
			<div class="row">
				<div class="span6" id="form-login">
					<form class="form-horizontal well" name="verificationForm"
						data-ng-submit="verifyEmailID()">
						<fieldset>
							<legend>Email ID - Verification</legend>
							<div data-ng-show="emailCtrl.showRegFormOption.isEmailValid"
								class="alert alert-danger">{{emailCtrl.showRegFormOption.showMsg}}
							</div>
							<div data-ng-show="!emailCtrl.showRegFormOption.isEmailVerified"
								class="alert alert-danger">{{emailCtrl.showRegFormOption.showMsg}}
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
										data-loading-text="Loading...">Verify</button>
								</div>
							</div>
						</fieldset>
					</form>

				</div>
			</div>
		</div>
	</div>

	<div id="wrap2"
		data-ng-show="emailCtrl.showRegFormOption.showPasswordForm">
		<div class="container">
			<div class="row">
				<div class="span6" id="form-login">
					<form class="form-horizontal well" name="savePasswordForm"
						data-ng-submit="savePassword()">
						<fieldset>
							<legend>Set Your Password</legend>

							<div
								data-ng-show="emailCtrl.showRegFormOption.showConfirmPasswordError"
								class="alert alert-danger">{{emailCtrl.showRegFormOption.showMsg}}
							</div>

							<div class="control-group">
								<div class="control-label">
									<label>Enter Password</label>
								</div>
								<div class="controls">
									<input type="password" name="password"
										placeholder="type your password" data-ng-model="password"
										class="input-large" data-ng-minlength=5 data-ng-maxlength=20
										required="required">
								</div>
								<div class="controls"
									data-ng-show="savePasswordForm.password.$dirty && savePasswordForm.password.$invalid">
									<small class="error" style="color:red"
										data-ng-show="savePasswordForm.password.$error.minlength">
										Password should be of at least 5 characters </small> <small
										class="error" style="color:red"
										data-ng-show="savePasswordForm.password.$error.maxlength">
										Password cannot be longer than 20 characters </small> <small
										class="error" style="color:red"
										data-ng-show="savePasswordForm.password.$error.required">
										Password is required </small>
								</div>
							</div>

							<div class="control-group">
								<div class="control-label">
									<label>Confirm Password</label>
								</div>
								<div class="controls">
									<input type="password" name="confirmPassword"
										placeholder="type your password"
										data-ng-model="confirmPassword" class="input-large"
										data-ng-minlength=5 data-ng-maxlength=20 required="required">
								</div>
								<div class="controls"
									data-ng-show="savePasswordForm.confirmPassword.$dirty && savePasswordForm.confirmPassword.$invalid">
									<small class="error" style="color:red"
										data-ng-show="savePasswordForm.confirmPassword.$error.minlength">
										Password should be of at least 5 characters </small> <small
										class="error" style="color:red"
										data-ng-show="savePasswordForm.confirmPassword.$error.maxlength">
										Password cannot be longer than 20 characters </small> <small
										class="error" style="color:red"
										data-ng-show="savePasswordForm.confirmPassword.$error.required">
										Confirm password is required </small>
								</div>
							</div>

							<div class="control-group">
								<div class="controls">
									<button type="submit" id="submit"
										class="btn btn-primary button-loading"
										data-loading-text="Loading...">Save Password</button>
								</div>
							</div>
						</fieldset>
					</form>
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