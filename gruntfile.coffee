modRewrite = require 'connect-modrewrite'

module.exports = (grunt) ->

  grunt.initConfig

    pkg : grunt.file.readJSON 'package.json'

    bower :
      install :
        options :
          cleanBowerDir : true
          install : true
          targetDir : 'public/vendor'
          layout : 'byType'

    coffee :
      compile :
        files :
          'public/javascript/main.js' : ['app/app.coffee', 'app/**/*.coffee']
        options :
          join : true

    autoprefixer :
      options :
        browsers : ['last 2 version', 'ie 8', 'ie 9']

      single_file :
        src : 'public/stylesheets/main.css'
        dest : 'public/stylesheets/main.css'

    connect :
      server :
        options :
          port : 8000
          base : 'public'
          middleware : (connect, options, middlewares) ->
            # rewrite for html5 history browsing
            middlewares.push modRewrite(['!\\.html|\\.js|\\.svg|\\.css|\\.png$ /index.html [L]'])
            # serve base dir
            options.base.forEach (base) ->
              middlewares.push connect.static(base)
            middlewares

    coffeelint :
      app : ['app/**/*.coffee']
      options : grunt.file.readJSON 'config/coffeelint.json'

    ngtemplates :
      app :
        src : 'app/views/**/*.html'
        dest : 'public/javascript/templates.js'
        options :
          module : '<%= pkg.name %>'

    sass :
      dist :
        files :
          'public/stylesheets/main.css' : 'app/stylesheets/main.sass'

    watch :
      options :
        livereload : true

      coffee :
        files : ['app/**/*.coffee']
        tasks : ['coffeelint', 'coffee']

      style :
        files : 'app/stylesheets/**/*.sass'
        tasks : ['style']

      ngtemplates :
        files : ['app/views/**/*.html']
        tasks : ['ngtemplates']

    grunt.registerTask 'compile', ['coffeelint', 'coffee', 'bower', 'ngtemplates', 'style']

    grunt.registerTask 'dev', ['compile', 'connect', 'watch']

    grunt.registerTask 'default', ['dev']

    grunt.registerTask 'serve', ['connect:server:keepalive']

    grunt.registerTask 'style', ['sass', 'autoprefixer']

  grunt.loadNpmTasks 'grunt-autoprefixer'
  grunt.loadNpmTasks 'grunt-angular-templates'
  grunt.loadNpmTasks 'grunt-bower-task'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-watch'
