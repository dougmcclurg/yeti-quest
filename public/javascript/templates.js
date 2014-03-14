angular.module('yeti').run(['$templateCache', function($templateCache) {
  'use strict';

  $templateCache.put('app/views/header.html',
    "<header>\n" +
    "  <a href=\"/\" class=\"logo\">Yeti</a>\n" +
    "  <a href=\"/users\">Users</a>\n" +
    "  <a href=\"/quests\">Quests</a>\n" +
    "</header>"
  );


  $templateCache.put('app/views/partials/home.html',
    "<h1>HOME!</h1>"
  );


  $templateCache.put('app/views/partials/quests.html',
    "<h1>QUESTS!</h1>"
  );


  $templateCache.put('app/views/partials/users.html',
    "<h1>USERS!</h1>"
  );

}]);
