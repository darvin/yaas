# Browserify requires
coffeeify = require 'coffeeify'

module.exports = (grunt) ->

  # Constants
  BUILD_PATH = 'build'
  APP_PATH   = 'app'
  DEV_PATH   = "#{BUILD_PATH}/development"
  TEST_PATH   = "#{BUILD_PATH}/test"
  JS_DEV_PATH = "#{DEV_PATH}/js"
  DEV_PORT = 7001
  TEST_PORT = 7002

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
        entry: './test/support/test.coffee'
        compile: './build/test/test.js'
        debug: yes
        beforeHook: (bundle)->
          bundle.transform coffeeify

          
    coffee: {}

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
      development:
        options:
          port: DEV_PORT
          base: "./#{DEV_PATH}"
      test:
        options:
          port: TEST_PORT
          base: "./#{TEST_PATH}"
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
          {expand: true, cwd: 'node_modules/mocha-js-reporter/', src: [ 'mocha-js-reporter.js' ], dest:'build/test/' }
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
      tests:
        files: ['test/**']
        tasks: 'build:test'

    karma:
      options:
        singleRun: true,
      unit:
        runnerPort: 9201
        configFile: 'config/karma/unit.coffee'
      ###
      e2e:
        runnerPort: 9202
        configFile: 'config/karma/e2e.coffee'

      ###

    'saucelabs-mocha': 
      all: 

        options: 
          urls: ["http://localhost:#{TEST_PORT}/test.html"]
          tunnelTimeout: 5,
          build: process.env.TRAVIS_JOB_ID,
          concurrency: 3,
          browsers: [
                        {
                          "browserName": "Opera",
                          "os": "Windows 2003",
                          "version": "11.64."
                        },
                        {
                          "browserName": "Opera",
                          "os": "Windows 2003",
                          "version": "12.12."
                        },
                        {
                          "browserName": "Internet Explorer",
                          "os": "Windows 2003",
                          "version": "6.0.3790.3959."
                        },
                        {
                          "browserName": "Internet Explorer",
                          "os": "Windows 2003",
                          "version": "8.0.6001.18702."
                        },
                        {
                          "browserName": "Internet Explorer",
                          "os": "Windows 2003",
                          "version": "7.0.5730.13."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2003",
                          "version": "3.0.19."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2003",
                          "version": "3.5.19."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2003",
                          "version": "3.6.28."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2003",
                          "version": "4.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2003",
                          "version": "5.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2003",
                          "version": "6.0.2."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2003",
                          "version": "7.0."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2003",
                          "version": "8.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2003",
                          "version": "9.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2003",
                          "version": "10.0.2."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2003",
                          "version": "11.0."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2003",
                          "version": "12.0."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2003",
                          "version": "13.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2003",
                          "version": "14.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2003",
                          "version": "15.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2003",
                          "version": "16.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2003",
                          "version": "17.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2003",
                          "version": "18.0.2."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2003",
                          "version": "19.0."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2003",
                          "version": "20.0."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2003",
                          "version": "21.0b1."
                        },
                        {
                          "browserName": "Google Chrome",
                          "os": "Windows 2003",
                          "version": "26.0.1410.64."
                        },
                        {
                          "browserName": "iPad",
                          "os": "Mac",
                          "version": "4.3."
                        },
                        {
                          "browserName": "iPad",
                          "os": "Mac",
                          "version": "5.0."
                        },
                        {
                          "browserName": "iPad",
                          "os": "Mac",
                          "version": "5.0."
                        },
                        {
                          "browserName": "iPad",
                          "os": "Mac",
                          "version": "5.1."
                        },
                        {
                          "browserName": "iPad",
                          "os": "Mac",
                          "version": "6.0."
                        },
                        {
                          "browserName": "Google Chrome",
                          "os": "Mac",
                          "version": "26.0.1410.65."
                        },
                        {
                          "browserName": "Google Chrome",
                          "os": "Mac",
                          "version": "26.0.1410.65."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Mac",
                          "version": "4.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Mac",
                          "version": "5.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Mac",
                          "version": "6.0.2."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Mac",
                          "version": "7.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Mac",
                          "version": "8.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Mac",
                          "version": "9.0."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Mac",
                          "version": "10.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Mac",
                          "version": "11.0."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Mac",
                          "version": "12.0."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Mac",
                          "version": "13.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Mac",
                          "version": "14.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Mac",
                          "version": "15.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Mac",
                          "version": "16.0.2."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Mac",
                          "version": "17.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Mac",
                          "version": "18.0.2."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Mac",
                          "version": "19.0."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Mac",
                          "version": "20.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Mac",
                          "version": "21.0b6."
                        },
                        {
                          "browserName": "iPhone",
                          "os": "Mac",
                          "version": "4.3."
                        },
                        {
                          "browserName": "iPhone",
                          "os": "Mac",
                          "version": "5.0."
                        },
                        {
                          "browserName": "iPhone",
                          "os": "Mac",
                          "version": "5.0."
                        },
                        {
                          "browserName": "iPhone",
                          "os": "Mac",
                          "version": "5.1."
                        },
                        {
                          "browserName": "iPhone",
                          "os": "Mac",
                          "version": "6.0."
                        },
                        {
                          "browserName": "Safari",
                          "os": "Mac",
                          "version": "5.1.7."
                        },
                        {
                          "browserName": "Safari",
                          "os": "Mac",
                          "version": "6.0.4."
                        },
                        {
                          "browserName": "Opera",
                          "os": "Windows 2008",
                          "version": "11.64."
                        },
                        {
                          "browserName": "Opera",
                          "os": "Windows 2008",
                          "version": "12.12."
                        },
                        {
                          "browserName": "Internet Explorer",
                          "os": "Windows 2008",
                          "version": "9.0.8112.16421."
                        },
                        {
                          "browserName": "Internet Explorer",
                          "os": "Windows 2008",
                          "version": "8.0.7601.17514."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2008",
                          "version": "3.0.19."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2008",
                          "version": "3.5.19."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2008",
                          "version": "3.6.28."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2008",
                          "version": "4.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2008",
                          "version": "5.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2008",
                          "version": "6.0.2."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2008",
                          "version": "7.0."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2008",
                          "version": "8.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2008",
                          "version": "9.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2008",
                          "version": "10.0.2."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2008",
                          "version": "11.0."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2008",
                          "version": "12.0."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2008",
                          "version": "13.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2008",
                          "version": "14.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2008",
                          "version": "15.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2008",
                          "version": "16.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2008",
                          "version": "17.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2008",
                          "version": "18.0.2."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2008",
                          "version": "19.0."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2008",
                          "version": "20.0."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2008",
                          "version": "21.0b1."
                        },
                        {
                          "browserName": "Safari",
                          "os": "Windows 2008",
                          "version": "5.1.7."
                        },
                        {
                          "browserName": "Google Chrome",
                          "os": "Windows 2008",
                          "version": "26.0.1410.64."
                        },
                        {
                          "browserName": "Internet Explorer",
                          "os": "Windows 2012",
                          "version": "10.0.9200.16519."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2012",
                          "version": "3.0.19."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2012",
                          "version": "3.5.19."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2012",
                          "version": "3.6.28."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2012",
                          "version": "4.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2012",
                          "version": "5.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2012",
                          "version": "6.0.2."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2012",
                          "version": "7.0."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2012",
                          "version": "8.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2012",
                          "version": "9.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2012",
                          "version": "10.0.2."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2012",
                          "version": "11.0."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2012",
                          "version": "12.0."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2012",
                          "version": "13.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2012",
                          "version": "14.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2012",
                          "version": "15.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2012",
                          "version": "16.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2012",
                          "version": "17.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2012",
                          "version": "18.0.2."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2012",
                          "version": "19.0."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2012",
                          "version": "20.0."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Windows 2012",
                          "version": "21.0b1."
                        },
                        {
                          "browserName": "Opera",
                          "os": "Linux",
                          "version": "12.15."
                        },
                        {
                          "browserName": "Google Chrome",
                          "os": "Linux",
                          "version": "26.0.1410.63."
                        },
                        {
                          "browserName": "Android",
                          "os": "Linux",
                          "version": "4.0.4."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Linux",
                          "version": "3.6.28."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Linux",
                          "version": "4.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Linux",
                          "version": "5.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Linux",
                          "version": "6.0.2."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Linux",
                          "version": "7.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Linux",
                          "version": "8.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Linux",
                          "version": "9.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Linux",
                          "version": "10.0."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Linux",
                          "version": "11.0."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Linux",
                          "version": "12.0."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Linux",
                          "version": "13.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Linux",
                          "version": "14.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Linux",
                          "version": "15.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Linux",
                          "version": "16.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Linux",
                          "version": "17.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Linux",
                          "version": "18.0.2."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Linux",
                          "version": "19.0."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Linux",
                          "version": "20.0.1."
                        },
                        {
                          "browserName": "Firefox",
                          "os": "Linux",
                          "version": "21.0."
                        },
                        {
                          "browserName": "Lynx",
                          "os": "Linux",
                          "version": "2.8.7."
                        }
                      ]

          testname: "mocha tests"
     



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
  grunt.loadNpmTasks 'grunt-saucelabs' 

  # Aliases
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


  grunt.registerTask 'test', ['build:test', 'karma']
  grunt.registerTask 'test-cloud', ['build:test', 'connect:test', 'saucelabs-mocha']

  grunt.registerTask 'default', [
    'development'
#    'test'
    'connect:development'
    'watch'
  ]

