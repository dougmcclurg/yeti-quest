app = angular.module 'yeti', ['ngRoute']

app.config ($routeProvider, $locationProvider) ->

  $routeProvider.
    when(
      '/',
      templateUrl : 'app/views/partials/home.html'
      controller : ->
    ).
    when(
      '/users',
      templateUrl : 'app/views/partials/users.html'
      controller : ->
    ).
    when(
      '/quests',
      templateUrl : 'app/views/partials/quests.html'
      controller : ->
    )

  $locationProvider.html5Mode true
