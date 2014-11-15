(function() {
	var app = angular.module('pizzastore', []);

	app.controller("PageController", function($scope, $http) {
		this.emailStatus = emailStatus;
		this.showOption = showOption;
		$scope.checkEmailID = function() {

			if ($scope.signupForm.$invalid) {
				return;
			}

			$http({
				method : 'POST',
				url : '/PizzaStore/user/emailid/' + $scope.emailid + '/check'
			}).success(function(data, status, headers, config) {
				emailStatus.isExist = data;

				if (data=='false') {
					showOption.showLogin=false;
					showOption.showSignupMsg=true;
				}

			}).error(function(data, status, headers, config) {
				// called asynchronously if an error
				// occurs
				// or server returns response with an
				// error status.
			});

		}

	});

	var showOption = {
		showLogin : true,
		showSignupMsg:false,
		showMsg : 'Your account is successfully crated. Please check your email for login instructions'
	}

	var emailStatus = {
		isExist : false,
		statusMsg : 'This email id is already registered. Please try Sign In or use Forget password option to reset your password.'
	}
})();
