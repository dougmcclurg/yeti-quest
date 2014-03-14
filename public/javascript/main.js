(function() {
  var app;

  app = angular.module('yeti', ['ngRoute']);

  app.config(function($routeProvider, $locationProvider) {
    $routeProvider.when('/', {
      templateUrl: 'app/views/partials/home.html',
      controller: function() {}
    }).when('/users', {
      templateUrl: 'app/views/partials/users.html',
      controller: function() {}
    }).when('/quests', {
      templateUrl: 'app/views/partials/quests.html',
      controller: function() {}
    });
    return $locationProvider.html5Mode(true);
  });

  app.controller('App', function() {});

}).call(this);
