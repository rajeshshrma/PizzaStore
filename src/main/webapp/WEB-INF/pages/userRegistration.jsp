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

<title><spring:message code="userRegistrationPage.title" /></title>

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
<body data-ng-controller="EmailFormController as emailCtrl">


	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<div class="brand">
					<spring:message code="userRegistrationPage.brandName" />
				</div>
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
						<fieldset style="border:0 none">
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
									<input style="height: 26px;" name="emailid" type="email" placeholder="Email Address"
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
						<fieldset style="border:0 none">
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
									<input style="height: 26px;" type="password" name="password"
										placeholder="type your password" data-ng-model="password"
										class="input-large" data-ng-minlength=5 data-ng-maxlength=20
										required="required">
								</div>
								<div class="controls"
									data-ng-show="savePasswordForm.password.$dirty && savePasswordForm.password.$invalid">
									<small class="error" style="color: red"
										data-ng-show="savePasswordForm.password.$error.minlength">
										Password should be of at least 5 characters </small> <small
										class="error" style="color: red"
										data-ng-show="savePasswordForm.password.$error.maxlength">
										Password cannot be longer than 20 characters </small> <small
										class="error" style="color: red"
										data-ng-show="savePasswordForm.password.$error.required">
										Password is required </small>
								</div>
							</div>

							<div class="control-group">
								<div class="control-label">
									<label>Confirm Password</label>
								</div>
								<div class="controls">
									<input style="height: 26px;" type="password" name="confirmPassword"
										placeholder="type your password"
										data-ng-model="confirmPassword" class="input-large"
										data-ng-minlength=5 data-ng-maxlength=20 required="required">
								</div>
								<div class="controls"
									data-ng-show="savePasswordForm.confirmPassword.$dirty && savePasswordForm.confirmPassword.$invalid">
									<small class="error" style="color: red"
										data-ng-show="savePasswordForm.confirmPassword.$error.minlength">
										Password should be of at least 5 characters </small> <small
										class="error" style="color: red"
										data-ng-show="savePasswordForm.confirmPassword.$error.maxlength">
										Password cannot be longer than 20 characters </small> <small
										class="error" style="color: red"
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


	<div id="wrap3"
		data-ng-show="emailCtrl.showRegFormOption.showAddressForm">
		<div class="container">
			<div class="row">
				<div class="span6" id="form-login">
					<form class="form-horizontal well" name="saveAddressForm"
						data-ng-submit="saveAddress()">
						<fieldset style="border:0 none">
							<legend>
								<spring:message
									code="userRegistrationPage.AddressForm.profileTitle" />
							</legend>

							<div class="control-group">
								<div class="control-label">
									<label><spring:message
											code="userRegistrationPage.AddressForm.labelFirstName" /></label>
								</div>
								<div class="controls">
									<input style="height: 26px;" type="text" name="firstname"
										placeholder="your first name" data-ng-model="firstname"
										class="input-large" required="required">
								</div>
								<div class="controls"
									data-ng-show="saveAddressForm.firstname.$dirty && saveAddressForm.firstname.$invalid">
									<small class="error" style="color: red"
										data-ng-show="saveAddressForm.firstname.$error.required">
										<spring:message
											code="userRegistrationPage.AddressForm.firstNameErrorMsg" />
									</small>
								</div>
							</div>


							<div class="control-group">
								<div class="control-label">
									<label><spring:message
											code="userRegistrationPage.AddressForm.labelLastName" /></label>
								</div>
								<div class="controls">
									<input style="height: 26px;" type="text" name="lastname" placeholder="your last name"
										data-ng-model="lastname" class="input-large"
										required="required">
								</div>
								<div class="controls"
									data-ng-show="saveAddressForm.lastname.$dirty && saveAddressForm.lastname.$invalid">
									<small class="error" style="color: red"
										data-ng-show="saveAddressForm.lastname.$error.required">
										<spring:message
											code="userRegistrationPage.AddressForm.lastNameErrorMsg" />
									</small>
								</div>
							</div>
						</fieldset>
						<fieldset style="border:0 none">
							<legend>
								<spring:message
									code="userRegistrationPage.AddressForm.addressTitle" />
							</legend>

							<div class="control-group">
								<div class="control-label">
									<label><spring:message
											code="userRegistrationPage.AddressForm.labelAddress1" /></label>
								</div>
								<div class="controls">
									<input style="height: 26px;" type="text" name="address1" placeholder="your address"
										data-ng-model="address1" class="input-large"
										required="required">
								</div>
								<div class="controls"
									data-ng-show="saveAddressForm.address1.$dirty && saveAddressForm.address1.$invalid">
									<small class="error" style="color: red"
										data-ng-show="saveAddressForm.address1.$error.required">
										<spring:message
											code="userRegistrationPage.AddressForm.address1ErrorMsg" />
									</small>
								</div>
							</div>

							<div class="control-group">
								<div class="control-label">
									<label><spring:message
											code="userRegistrationPage.AddressForm.labelAddress2" /></label>
								</div>
								<div class="controls">
									<input style="height: 26px;" type="text" name="address2" placeholder="your address"
										data-ng-model="address2" class="input-large"
										required="required">
								</div>
							</div>

							<div class="control-group">
								<div class="control-label">
									<label><spring:message
											code="userRegistrationPage.AddressForm.labelAddress3" /></label>
								</div>
								<div class="controls">
									<input style="height: 26px;" type="text" name="address3" placeholder="your address"
										data-ng-model="address3" class="input-large"
										required="required">
								</div>
							</div>


							<div class="control-group">
								<div class="control-label">
									<label><spring:message
											code="userRegistrationPage.AddressForm.labelPhone" /></label>
								</div>
								<div class="controls">
									<input style="height: 26px;" type="number" name="phone" placeholder="your phone"
										data-ng-model="phone" class="input-large" required="required">
								</div>
								<div class="controls"
									data-ng-show="saveAddressForm.phone.$dirty && saveAddressForm.phone.$invalid">
									<small class="error" style="color: red"
										data-ng-show="saveAddressForm.phone.$error.required">
										<spring:message
											code="userRegistrationPage.AddressForm.phoneRequiredErrorMsg" />
									</small> <small class="error" style="color: red"
										data-ng-show="saveAddressForm.phone.$error.number"> <spring:message
											code="userRegistrationPage.AddressForm.phoneInvalidErrorMsg" />
									</small>

								</div>
							</div>


							<div class="control-group">
								<div class="control-label">
									<label><spring:message
											code="userRegistrationPage.AddressForm.labelCity" /></label>
								</div>
								<div class="controls">
									<input style="height: 26px;" type="text" name="city" placeholder="your city"
										data-ng-model="city" class="input-large" required="required">
								</div>
								<div class="controls"
									data-ng-show="saveAddressForm.city.$dirty && saveAddressForm.city.$invalid">
									<small class="error" style="color: red"
										data-ng-show="saveAddressForm.city.$error.required"> <spring:message
											code="userRegistrationPage.AddressForm.cityErrorMsg" />
									</small>
								</div>
							</div>


							<div class="control-group">
								<div class="control-label">
									<label><spring:message
											code="userRegistrationPage.AddressForm.labelState" /></label>
								</div>
								<div class="controls">
									<input style="height: 26px;" type="text" name="state" placeholder="your state"
										data-ng-model="state" class="input-large" required="required">
								</div>
								<div class="controls"
									data-ng-show="saveAddressForm.state.$dirty && saveAddressForm.state.$invalid">
									<small class="error" style="color: red"
										data-ng-show="saveAddressForm.state.$error.required">
										<spring:message
											code="userRegistrationPage.AddressForm.stateErrorMsg" />
									</small>
								</div>
							</div>


							<div class="control-group">
								<div class="control-label">
									<label><spring:message
											code="userRegistrationPage.AddressForm.labelCountry" /></label>
								</div>
								<div class="controls">
									<input style="height: 26px;" type="text" name="country" placeholder="your country"
										data-ng-model="country" class="input-large"
										required="required">
								</div>
								<div class="controls"
									data-ng-show="saveAddressForm.country.$dirty && saveAddressForm.country.$invalid">
									<small class="error" style="color: red"
										data-ng-show="saveAddressForm.country.$error.required">
										<spring:message
											code="userRegistrationPage.AddressForm.countryErrorMsg" />
									</small>
								</div>
							</div>


							<div class="control-group">
								<div class="controls">
									<button type="submit" id="submit"
										class="btn btn-primary button-loading"
										data-loading-text="Loading...">Save Profile</button>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>


	<div id="wrap4"
		data-ng-show="emailCtrl.showRegFormOption.showSuccessRegistrationScreen">
		<div class="container">
			<div class="row">
				<div class="span6" id="form-login">
					<div class="form-horizontal well">
						<fieldset style="border:0 none">
							<legend>Success</legend>

							<div class="control-group">
								<spring:message
									code="userRegistrationPage.AddressForm.successMsg" />
								<a href="/PizzaStore/"> <spring:message
										code="userRegistrationPage.AddressForm.successMsgLink" />
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