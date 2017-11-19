app.controller('sectionsCtrl',function($scope, $http){
	"user strict";
	$scope.developer = "Mr. Jean Luc";

	$http.get("/api/v1/sections_apis.json").then(function(response){
		$scope.sections = response.data;
	})

	$scope.showSection = function(section){
		$http.get("/api/v1/sections_apis/"+ section.id +".json")
			.then(function(response){
				$scope.content = response.data;
			});	
	};
})