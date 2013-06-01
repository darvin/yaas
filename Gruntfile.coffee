# Browserify requires
coffeeify = require 'coffeeify'

module.exports = (grunt) ->

  # Constants
  BUILD_PATH = 'build'
  APP_PATH   = 'app'
  DEV_PATH   = "#{BUILD_PATH}/development"
  JS_DEV_PATH = "#{DEV_PATH}/js"

  # Project configuration
  grunt.initConfig
    clean:
      development: [DEV_PATH]

    browserify2:
      development:
        entry: './app/app.coffee'
        compile: './build/development/js/app.js'
        debug: yes
        beforeHook: (bundle)->
          bundle.transform coffeeify
      test:
        entry: './test/support/test.js'
        compile: './build/test/test.js'
        debug: yes
        beforeHook: (bundle)->
          bundle.transform coffeeify

          
    coffee:
      config:
        options:
          bare: true
        files: [
          expand: true
          cwd: 'config'
          src: ['**/*.coffee']
          dest: 'config'
          ext: '.js'
        ]

    less:
      development:
        options:
          paths: [
            'app/assets/style'
            'components'
          ]
        files:
          'build/development/css/app.css': [
            'app/assets/style/app.less'
          ]
    jade:
      development:
        options:
          pretty: true
          data:
            debug: true
        files: [
          expand: true
          cwd: APP_PATH
          src: ['**/*.jade']
          dest: 'build/development'
          ext: '.html'
        ]
    connect:
      server:
        options:
          port: 8002
          base: "./#{DEV_PATH}"
    copy:
      development:
        cwd: 'components/font-awesome/'
        src: 'font/*'
        dest: 'build/development'
        expand: true
      test:
        files: [
          {expand: true, cwd: 'test/support/',  src: 'test.html', dest:'build/test/' }
          {expand: true, cwd: 'node_modules/mocha/', src: [ 'mocha.css', 'mocha.js' ], dest:'build/test/' }
        ]
    watch:
      coffee:
        files: ['app/*.coffee', 'app/**/*.coffee']
        tasks: 'browserify2:development'
      jade:
        files: ['app/index.jade', 'app/partials/*.jade']
        tasks: 'jade:development'
      less:
        files: ['app/assets/style/*.less']
        tasks: 'jade:development'
      config:
        files: ['config/karma/*.coffee']
        tasks: 'coffee:config'

    karma:
      options:
        keepalive: false
      unit:
        runnerPort: 9201
        configFile: 'config/karma/unit.js'
      e2e:
        runnerPort: 9202
        configFile: 'config/karma/e2e.js'



  # Dependencies
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'

  grunt.loadNpmTasks 'grunt-karma'
  grunt.loadNpmTasks 'grunt-browserify2'

  # Aliases
  grunt.registerTask 'config', 'coffee:config'
  grunt.registerTask 'development', [
    'clean:development'
    'copy:development'
    'browserify2:development'
    'jade:development'
    'less:development'
  ]

  # grunt.registerTask 'test', 'karma'

  grunt.registerTask 'build:test', [
    'browserify2:test'
    'copy:test'
  ]

  grunt.registerTask 'default', [
    'config'
    'development'
#    'test'
    'connect:server'
    'watch'
  ]

