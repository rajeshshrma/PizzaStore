(function() {
	var app = angular.module('pizzastore', []);

	app
			.controller(
					"PageController",
					function($scope, $http) {
						this.emailStatus = emailStatus;
						this.showOption = showOption;
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
												showRegFormOption.showConfirmPasswordError = false;

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

					});

	var showOption = {
		showLogin : true,
		showSignupMsg : false,
		showMsg : '...',
	}

	var emailStatus = {
		isExist : false,
		isInvalid : false,
		statusMsg : '...'
	}

	var showRegFormOption = {
		showMsg : '....',
		showEmailForm : true,
		isEmailValid : false,
		isEmailVerified : true,
		showPasswordForm : false,
		showConfirmPasswordError : false
	}

})();
