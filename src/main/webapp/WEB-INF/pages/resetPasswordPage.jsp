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

<title><spring:message code="resetPasswordPage.title" /></title>

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
<body data-ng-controller="PasswordResetFormController as pwdCtrl">


	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<div class="brand">
					<spring:message code="resetPasswordPage.brandName" />
				</div>
			</div>

		</div>
	</div>

	<div id="wrap1"
		data-ng-show="pwdCtrl.showPwdResetFormOption.showEmailForm">
		<div class="container">
			<div class="row">
				<div class="span6" id="form-login">
					<form class="form-horizontal well" name="emailVerificationForm"
						data-ng-submit="verifyEmailIDForResetPassword()">
						<fieldset style="border: 0 none">
							<legend>
								<spring:message code="resetPasswordPage.emailVerifyForm.title" />
							</legend>

							<div
								data-ng-show="!pwdCtrl.showPwdResetFormOption.isEmailVerified"
								class="alert alert-danger">
								<spring:message
									code="resetPasswordPage.emailVerifyForm.Messages.emailIDNotFound" />
							</div>
							<div class="control-group">
								<div class="control-label">
									<label><spring:message
											code="resetPasswordPage.emailVerifyForm.label.emailid" /></label>
								</div>
								<div class="controls">
									<input name="emailid" type="email" placeholder="Email Address"
										class="input-large" data-ng-model="emailid" style="height: 26px;"
										required="required"> <span
										data-ng-show="emailVerificationForm.emailid.$dirty && emailVerificationForm.emailid.$invalid">
										<span class="error" style="color: red"
										data-ng-show="emailVerificationForm.emailid.$error.email">
											<span class="glyphicon glyphicon-remove"></span>
									</span> <span class="error" style="color: red"
										data-ng-show="emailVerificationForm.emailid.$error.required">
											<span class="glyphicon glyphicon-remove"></span>
									</span>
									</span> <span
										data-ng-show="emailVerificationForm.emailid.$dirty && emailVerificationForm.emailid.$valid">
										<span class="error" style="color: green"
										data-ng-show="!emailVerificationForm.emailid.$error.email">
											<span class="glyphicon glyphicon-ok"></span>
									</span>
									</span>
								</div>
							</div>
							<div class="control-group">
								<div class="controls">
									<button type=submit class="btn btn-primary"
										data-ng-disabled="emailVerificationForm.$invalid">
										<spring:message
											code="resetPasswordPage.emailVerifyForm.button.verify" />
									</button>
								</div>
							</div>
						</fieldset>
					</form>

				</div>
			</div>
		</div>
	</div>

	<div id="wrap2"
		data-ng-show="pwdCtrl.showPwdResetFormOption.showPasswordForm">
		<div class="container">
			<div class="row">
				<div class="span6" id="form-login">
					<form class="form-horizontal well" name="resetPasswordForm"
						data-ng-submit="resetPassword()">
						<fieldset style="border: 0 none">
							<legend>
								<spring:message code="resetPasswordPage.resetPasswordForm.title" />
							</legend>

							<div
								data-ng-show="pwdCtrl.showPwdResetFormOption.showConfirmPasswordError"
								class="alert alert-danger">
								<spring:message
									code="resetPasswordPage.resetPasswordForm.Messages.passwordNotMatched" />
							</div>

							<div class="control-group">
								<div class="control-label">
									<label><spring:message
											code="resetPasswordPage.resetPasswordForm.label.password" /></label>
								</div>
								<div class="controls">
									<input style="height: 26px;" type="password" name="password"
										placeholder="type your password" data-ng-model="password"
										class="input-large" data-ng-minlength=5 data-ng-maxlength=20
										required="required"> <span
										data-ng-show="resetPasswordForm.password.$dirty && resetPasswordForm.password.$invalid">
										<span class="error" style="color: red"
										data-ng-show="resetPasswordForm.password.$error.minlength">
											<span class="glyphicon glyphicon-remove"></span>
									</span> <span class="error" style="color: red"
										data-ng-show="resetPasswordForm.password.$error.maxlength">
											<span class="glyphicon glyphicon-remove"></span>
									</span> <span class="error" style="color: red"
										data-ng-show="resetPasswordForm.password.$error.required">
											<span class="glyphicon glyphicon-remove"></span>
									</span>
									</span> <span
										data-ng-show="resetPasswordForm.password.$dirty && resetPasswordForm.password.$valid">
										<span class="error" style="color: green"
										data-ng-show="!resetPasswordForm.password.$error.required">
											<span class="glyphicon glyphicon-ok"></span>
									</span>
									</span>
								</div>

							</div>

							<div class="control-group">
								<div class="control-label">
									<label><spring:message
											code="resetPasswordPage.resetPasswordForm.label.confirmPassword" /></label>
								</div>
								<div class="controls">
									<input style="height: 26px;" type="password"
										name="confirmPassword" placeholder="type your password"
										data-ng-model="confirmPassword" class="input-large"
										data-ng-minlength=5 data-ng-maxlength=20 required="required">
									<span
										data-ng-show="resetPasswordForm.confirmPassword.$dirty && resetPasswordForm.confirmPassword.$invalid">
										<span class="error" style="color: red"
										data-ng-show="resetPasswordForm.confirmPassword.$error.minlength">
											<span class="glyphicon glyphicon-remove"></span>
									</span> <span class="error" style="color: red"
										data-ng-show="resetPasswordForm.confirmPassword.$error.maxlength">
											<span class="glyphicon glyphicon-remove"></span>
									</span> <span class="error" style="color: red"
										data-ng-show="resetPasswordForm.confirmPassword.$error.required">
											<span class="glyphicon glyphicon-remove"></span>
									</span>
									</span> <span
										data-ng-show="resetPasswordForm.confirmPassword.$dirty && resetPasswordForm.confirmPassword.$valid">
										<span class="error" style="color: green"
										data-ng-show="!resetPasswordForm.confirmPassword.$error.required">
											<span class="glyphicon glyphicon-ok"></span>
									</span>
									</span>
								</div>

							</div>

							<div class="control-group">
								<div class="controls">
									<button type="submit" id="submit"
										class="btn btn-primary" data-ng-disabled="resetPasswordForm.$invalid">
										<spring:message
											code="resetPasswordPage.resetPasswordForm.button.verify" />
									</button>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>


	<div id="wrap3"
		data-ng-show="pwdCtrl.showPwdResetFormOption.showSuccessPasswordResetScreen">
		<div class="container">
			<div class="row">
				<div class="span6" id="form-login">
					<div class="form-horizontal well">
						<fieldset style="border: 0 none">
							<legend>
								<spring:message
									code="resetPasswordPage.resetPasswordForm.success.title" />
							</legend>

							<div class="control-group">
								<spring:message
									code="resetPasswordPage.resetPasswordForm.successMsg" />
								<a href="/PizzaStore/"> <spring:message
										code="resetPasswordPage.resetPasswordForm.successMsgLink" />
								</a>
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