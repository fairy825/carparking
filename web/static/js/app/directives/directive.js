'use strict'

angular.module('app.directive', [])
	.directive('hello', function($scope, $log){
		return {
	      	restrict: 'A',
	      	compile: function (el, attrs) {
		        
	      	},
	      	link: function(scope, el, attr) {
	      		
    		}
    	}
	})
	.directive('myEle', function($compile, $parse) {
	    return {
	      restrict: 'AE',
	      link: function(scope, element, attr) {
	        scope.$watch(attr.content, function() {
	          element.html($parse(attr.content)(scope));
	          $compile(element.contents())(scope);
	        }, true);
	      }
	    }
	})
