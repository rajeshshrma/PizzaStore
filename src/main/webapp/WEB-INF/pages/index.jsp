<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html lang="en" data-ng-app="pizzastore">
<head>

<title>Login Form</title>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/angular.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap-button.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/application.js"></script>


<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-responsive.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-custom.css">


</head>
<body data-ng-controller="PageController as pageCtrl">


	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<div class="brand">PIZZA STORE</div>
			</div>

		</div>
	</div>

	<div id="wrap1" data-ng-show="pageCtrl.showOption.showLogin">
		<div class="container">
			<div class="row">
				<div class="span6" id="form-login">
					<form class="form-horizontal well" name="loginForm">
						<fieldset>
							<legend>Login Form</legend>
							<div class="control-group">
								<div class="control-label">
									<label>Username</label>
								</div>
								<div class="controls">
									<input type="text" placeholder="type your username"
										class="input-large">
								</div>
							</div>

							<div class="control-group">
								<div class="control-label">
									<label>Password</label>
								</div>
								<div class="controls">
									<input type="password" placeholder="type your password"
										class="input-large">
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
							<legend>New User - Signup</legend>
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