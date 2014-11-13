<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>

<title>Login Form</title>


<script src="assets/js/jquery-1.9.1.min.js"> </script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"> </script>
<script type="text/javascript" src="assets/js/bootstrap-button.js"> </script>
<script type="text/javascript" src="assets/js/application.js"> </script>

<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/css/bootstrap-responsive.min.css">
<link rel="stylesheet" href="assets/css/bootstrap-custom.css">



</head>
<body>


	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">

				<!-- .btn-navbar is used as the toggle for collapsed navbar content -->
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a>

				<div class="brand">PIZZA STORE</div>

			</div>
		</div>
	</div>

	<div id="wrap">
		<div class="container">
			<div class="row">
				<div class="span6" id="form-login">
					<form class="form-horizontal well">
						<fieldset>
							<legend>Login Form</legend>
							<div class="control-group">
								<div class="control-label">
									<label>Username</label>
								</div>
								<div class="controls">
									<input type="text" placeholder="emailid@domain.com"
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
							<div class="control-group" align=center>
								<label>Or</label> <label>If you are not registered, Sign
									Up here</label>
							</div>
							<div class="control-group">
								<div class="control-label">
									<label>Email ID</label>
								</div>
								<div class="controls">
									<input type="text" placeholder="emailid@domain.com"
										class="input-large">
								</div>
							</div>

							<div class="control-group">
								<div class="controls">

									<button type="submit" id="submit"
										class="btn btn-primary button-loading"
										data-loading-text="Loading...">Sign up</button>
								</div>
							</div>

						</fieldset>
					</form>

				</div>
			</div>
		</div>
		<div id="push"></div>
	</div>

</body>
</html>