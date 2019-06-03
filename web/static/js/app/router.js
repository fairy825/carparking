'use strict'
myapp.run([
    '$rootScope','$state','$stateParams','$localStorage',
    function ($rootScope,$state,$stateParams,$localStorage,$scope) {
        $rootScope.$state = $state;
        $rootScope.$stateParams = $stateParams;
        console.log("app run...");
        $rootScope.$on("$routeChangeStart",function(){
            console.log(arguments);
            console.log("$routeChangeStart");

        });
        $rootScope.$on("$routeChangeSuccess",function(){
            console.log(arguments);
            console.log("$routeChangeSuccess");
        });
        $rootScope.$on("$routeChangeError",function(){
            console.log(arguments);
            console.log("$routeChangeError");
        });


       	// console.log($rootScope.appUserInfo);

        $rootScope.$on('$stateChangeStart', function (event, transition, toState, toParams) {
       		/*console.log(transition);
            console.log(event);*/
    	});

    }
])
.config(["$provide", "$compileProvider", "$controllerProvider", "$filterProvider", "$stateProvider", "$urlRouterProvider",
	function ($provide, $compileProvider, $controllerProvider, $filterProvider, $stateProvider, $urlRouterProvider) {
	 	myapp.controller = $controllerProvider.register;
	 	myapp.directive = $compileProvider.directive;
	 	myapp.filter = $filterProvider.register;
	 	myapp.factory = $provide.factory;
	 	myapp.service = $provide.service;
	 	myapp.constant = $provide.constant;

	 	//$urlRouterProvider.when("", "/app");
		$urlRouterProvider
	            .otherwise('/login');

	    $stateProvider
		    .state("app", {
		        url: "/app",
		        templateUrl: "views/app.html"
		    })
		    .state("app.index", {
		        url: "/index",
		        templateUrl: "views/blank.html",
		        resolve: {
	                deps: ['uiLoad',
	                  function( uiLoad ){
	                    return uiLoad.load([
                            
	                    ]);
	                }]
	            }
		    })
	        // app.layout
	        .state('app.car', {
	            url: '/car',
	            template: '<div ui-view></div>'
	        })
	        .state('app.car.userinfo', {
	            url: '/userinfo',
	            templateUrl: 'views/carsystem/userinfo.html',
	            resolve: {
	                deps: ['uiLoad',
	                  function( uiLoad ){
	                    return uiLoad.load([
                            'js/layui/laydate/laydate.js',
	                    	'js/app/controller/carsystem/userinfo.js'
	                    ]);
	                }]
	            }
	        })
	        .state('app.car.parkinfo', {
	            url: '/parkinfo',
	            templateUrl: 'views/carsystem/parkinfo.html',
	            resolve: {
	                deps: ['uiLoad',
	                  function( uiLoad ){
	                    return uiLoad.load([
                            'js/layui/laydate/laydate.js',
	                    	'js/app/controller/carsystem/parkinfo.js'
	                    ]);
	                }]
	            }
	        })
	        .state('app.car.carorder', {
	            url: '/carorder',
	            templateUrl: 'views/carsystem/carorder.html',
	            resolve: {
	                deps: ['uiLoad',
	                  function( uiLoad ){
	                    return uiLoad.load([
                            'js/layui/laydate/laydate.js',
	                    	'js/app/controller/carsystem/carorder.js'
	                    ]);
	                }]
	            }
	        })
	        .state('app.car.news', {
	            url: '/news',
	            templateUrl: 'views/carsystem/news.html',
	            resolve: {
	                deps: ['uiLoad',
	                  function( uiLoad ){
	                    return uiLoad.load([
                            'js/layui/laydate/laydate.js',
	                    	'js/app/controller/carsystem/news.js'
	                    ]);
	                }]
	            }
	        })
	        .state('app.car.words', {
	            url: '/words',
	            templateUrl: 'views/carsystem/words.html',
	            resolve: {
	                deps: ['uiLoad',
	                  function( uiLoad ){
	                    return uiLoad.load([
                            'js/layui/laydate/laydate.js',
	                    	'js/app/controller/carsystem/words.js'
	                    ]);
	                }]
	            }
	        })
	        .state('app.car.cars', {
	            url: '/cars',
	            templateUrl: 'views/carsystem/cars.html',
	            resolve: {
	                deps: ['uiLoad',
	                  function( uiLoad ){
	                    return uiLoad.load([
                            'js/layui/laydate/laydate.js',
	                    	'js/app/controller/carsystem/cars.js'
	                    ]);
	                }]
	            }
	        })
	        .state('login', {
	            url: '/login',
	            templateUrl: 'views/login.html',
	            resolve: {
	                deps: ['uiLoad',
	                  function( uiLoad ){
	                    return uiLoad.load([
                            
	                    ]);
	                }]
	            }
	        })
	        .state('register', {
	            url: '/register',
	            templateUrl: 'views/register.html',
	            resolve: {
	                deps: ['uiLoad',
	                  function( uiLoad ){
	                    return uiLoad.load([
                            
	                    ]);
	                }]
	            }
	        })
		;
}])
;
