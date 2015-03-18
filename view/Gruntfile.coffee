"use strict"

module.exports = (grunt) ->
  grunt.initConfig
    clean:
      js:   ["htdocs/js/*.js", "!htdocs/js/extlib.js"]
      bower: ["bower_components", "htdocs/js/extlib.js"]

    coffee:
      app:
        files:
          "htdocs/js/app.js": [
            "coffee/**/*.coffee"
          ]
        options:
          sourceMap: true

    ngtemplates:
      options:
        htmlmin:
          collapseBooleanAttributes:      true
          collapseWhitespace:             true
          removeAttributeQuotes:          true
          removeComments:                 true
          removeEmptyAttributes:          true
          removeRedundantAttributes:      true
          removeScriptTypeAttributes:     true
          removeStyleLinkTypeAttributes:  true
      app:
        cwd: 'coffee/app/view'
        src: "**/*.html"
        dest: 'htdocs/view/app.js'

    shell:
      bower:
        options:
          stdout: true
        command: "bower install"

    concat:
      extlibjs:
        src: [
          'bower_components/angular/angular.min.js'
          'bower_components/angular-ui-router/release/angular-ui-router.min.js'
        ]
        dest: "htdocs/js/extlib.js"

  require('load-grunt-tasks')(grunt)

  grunt.registerTask "js", ["coffee:app"]
  grunt.registerTask "bower", ["clean:bower", "shell:bower", "concat:extlibjs"]
  grunt.registerTask "build", ["coffee:app", "ngtemplates"]

