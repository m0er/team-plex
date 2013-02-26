console.log(angular);

angular.module('directive', []).
	directive('contenteditable', function() {
        return {
	        require: 'ngModel',
	        link: function(scope, elm, attrs, ctrl) {
		        // view -> model
		        elm.bind('blur', function() {
			        scope.$apply(function() {
			        	ctrl.$setViewValue(elm.html());
			        });
		        });
	        
		        // model -> view
		        ctrl.$render = function(value) {
		        	elm.html(value);
		        };
	         
		        // load init value from DOM
		        ctrl.$setViewValue(elm.html());
	        }
        };
	});
	

function GreetingController($scope) {
	$scope.name = 'World';
}

function ListController($scope) {
	$scope.names = ["Igor", "Misko", "Vozta"];
}

function ButtonController($scope) {
	$scope.action = function() {
		$scope.name2 = "OK";
	};
	
	$scope.name2 = "World2";
}