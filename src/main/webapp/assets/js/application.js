(function() {
	var app = angular.module('pizzastore', []);

	app
			.controller(
					"PageController",
					function($scope, $http) {
						this.emailStatus = emailStatus;
						this.showOption = showOption;
						this.loginStatus = loginStatus;

						$scope.checkEmailID = function() {

							if ($scope.signupForm.$invalid) {
								emailStatus.isInvalid = true;
								emailStatus.statusMsg = 'Inavlid Email Id. Please try again!';
								return;
							}

							$http(
									{
										method : 'POST',
										url : '/PizzaStore/user/emailid/'
												+ $scope.emailid + '/check'
									})
									.success(
											function(data, status, headers,
													config) {
												emailStatus.isExist = data;
												emailStatus.isInvalid = false;

												if (data == 'false') {
													showOption.showLogin = false;
													showOption.showMsg = 'Your account is successfully crated. Please check your email for login instructions';
													showOption.showSignupMsg = true;

												} else {
													emailStatus.statusMsg = 'This email id is already registered. Please try Sign In or use Forget password option to reset your password.';
												}

											}).error(
											function(data, status, headers,
													config) {

											});

						}

						$scope.showForgetFormWindows = function() {

							showOption.showLogin = false;
							showOption.showSignupMsg = false;
							showOption.showForgetPasswordForm = true;
						}

						$scope.checkRegisteredEmailID = function() {

							if ($scope.forgetPasswordForm.$invalid) {
								return;
							}

							$http(
									{
										method : 'POST',
										url : '/PizzaStore/user/forgetpassword/emailid/'
												+ $scope.emailid + '/check'
									})
									.success(
											function(data, status, headers,
													config) {
												if (data == 'false') {
													emailStatus.isNotRegistered = true;
												} else {
													showOption.showForgetPasswordForm = false;
													showOption.showForgetPasswordSuccessForm = true;
												}

											}).error(
											function(data, status, headers,
													config) {

											});

						}

						$scope.loginUser = function() {

							if ($scope.loginForm.$invalid) {
								return;
							}

							$http(
									{
										method : 'POST',
										url : '/PizzaStore/user/check/login/'
												+ $scope.emailid + '/'
												+ $scope.password
									})
									.success(
											function(data, status, headers,
													config) {

												if (data == 'true') {
													window.location = "/PizzaStore/user/homepage";
												} else {
													loginStatus.isUnauthorised = true;
												}

											}).error(
											function(data, status, headers,
													config) {

											});

						}

					});

	app
			.controller(
					"EmailFormController",
					function($scope, $http) {
						this.showRegFormOption = showRegFormOption;

						$scope.verifyEmailID = function() {

							if ($scope.verificationForm.$invalid) {
								showRegFormOption.isEmailValid = true;
								showRegFormOption.showMsg = 'Inavlid Email Id. Please try again!';
								return;
							}

							$http(
									{
										method : 'POST',
										url : '/PizzaStore/user/emailid/'
												+ $scope.emailid + '/verify'
									})
									.success(
											function(data, status, headers,
													config) {
												showRegFormOption.isEmailValid = false;

												if (data == 'false') {
													showRegFormOption.isEmailVerified = false;
													showRegFormOption.showEmailForm = true;
													showRegFormOption.showPasswordForm = false;
													showRegFormOption.showMsg = 'Your have provided wrong email id as you have been provided during signup. Try again.....';
												} else {
													showRegFormOption.isEmailVerified = true;
													showRegFormOption.showEmailForm = false;
													showRegFormOption.showPasswordForm = true;
												}

											}).error(
											function(data, status, headers,
													config) {
											});
						}

						$scope.savePassword = function() {

							if ($scope.savePasswordForm.$invalid) {
								showRegFormOption.showConfirmPasswordError = false;
								return;
							}

							if ($scope.password != $scope.confirmPassword) {
								showRegFormOption.showConfirmPasswordError = true;
								showRegFormOption.showMsg = 'Passwords not matched. try again.....';
								return;
							}

							$http(
									{
										method : 'POST',
										url : '/PizzaStore/user/save/password/'
												+ $scope.password
									})
									.success(
											function(data, status, headers,
													config) {

												if (data == 'false') {
													showRegFormOption.showEmailForm = false;
													showRegFormOption.showPasswordForm = true;
													showRegFormOption.showAddressForm = false;
												} else {
													showRegFormOption.showEmailForm = false;
													showRegFormOption.showPasswordForm = false;
													showRegFormOption.showAddressForm = true;
												}

											}).error(
											function(data, status, headers,
													config) {
											});
						}

						$scope.saveAddress = function() {

							if ($scope.saveAddressForm.$invalid) {
								return;
							}

							$http(
									{
										method : 'POST',
										url : '/PizzaStore/user/save/address/'
												+ $scope.firstname + '/'
												+ $scope.lastname + '/'
												+ $scope.address1 + '/'
												+ $scope.address2 + '/'
												+ $scope.address3 + '/'
												+ $scope.phone + '/'
												+ $scope.city + '/'
												+ $scope.state + '/'
												+ $scope.country
									})
									.success(
											function(data, status, headers,
													config) {

												if (data == 'false') {
													showRegFormOption.showEmailForm = false;
													showRegFormOption.showPasswordForm = false;
													showRegFormOption.showAddressForm = true;
													showRegFormOption.showSuccessRegistrationScreen = false;
												} else {
													showRegFormOption.showEmailForm = false;
													showRegFormOption.showPasswordForm = false;
													showRegFormOption.showAddressForm = false;
													showRegFormOption.showSuccessRegistrationScreen = true;
												}

											}).error(
											function(data, status, headers,
													config) {
											});
						}

					});

	app
			.controller(
					"PasswordResetFormController",
					function($scope, $http) {

						this.showPwdResetFormOption = showPwdResetFormOption;

						$scope.verifyEmailIDForResetPassword = function() {

							if ($scope.emailVerificationForm.$invalid) {
								return;
							}

							$http(
									{
										method : 'POST',
										url : '/PizzaStore/user/reset/password/emailid/'
												+ $scope.emailid + '/verify/'
									})
									.success(
											function(data, status, headers,
													config) {

												if (data == 'false') {
													showPwdResetFormOption.isEmailVerified = false;
													showPwdResetFormOption.showEmailForm = true;
													showPwdResetFormOption.showPasswordForm = false;
												} else {
													showPwdResetFormOption.isEmailVerified = true;
													showPwdResetFormOption.showEmailForm = false;
													showPwdResetFormOption.showPasswordForm = true;
												}

											}).error(
											function(data, status, headers,
													config) {
											});
						}

						$scope.resetPassword = function() {

							if ($scope.resetPasswordForm.$invalid) {
								return;
							}

							if ($scope.password != $scope.confirmPassword) {
								showPwdResetFormOption.showConfirmPasswordError = true;
								return;
							}

							$http(
									{
										method : 'POST',
										url : '/PizzaStore/user/reset/password/'
												+ $scope.password
									})
									.success(
											function(data, status, headers,
													config) {

												if (data == 'false') {
													showPwdResetFormOption.showEmailForm = false;
													showPwdResetFormOption.showPasswordForm = true;
												} else {
													showPwdResetFormOption.showEmailForm = false;
													showPwdResetFormOption.showPasswordForm = false;
													showPwdResetFormOption.showSuccessPasswordResetScreen = true;
												}

											}).error(
											function(data, status, headers,
													config) {
											});
						}

					});

	var showOption = {
		showLogin : true,
		showSignupMsg : false,
		showMsg : '...',
		showForgetPasswordForm : false,
		showForgetPasswordSuccessForm : false
	}

	var emailStatus = {
		isExist : false,
		isInvalid : false,
		statusMsg : '...',
		isNotRegistered : false

	}

	var loginStatus = {
		isUnauthorised : false
	}

	var showRegFormOption = {
		showMsg : '....',
		showEmailForm : true,
		isEmailValid : false,
		isEmailVerified : true,
		showPasswordForm : false,
		showConfirmPasswordError : false,
		showAddressForm : false,
		showSuccessRegistrationScreen : false
	}

	var showPwdResetFormOption = {
		showEmailForm : true,
		isEmailVerified : true,
		showPasswordForm : false,
		showConfirmPasswordError : false,
		showSuccessPasswordResetScreen : false
	}

})();
