# Configuration for e2e-tests on testacular

# base path, that will be used to resolve files and exclude
basePath = '../../'

# list of files / patterns to load in the browser
files = [
  MOCHA
  MOCHA_ADAPTER
  'build/test/test.js'
]

# enable / disable watching file and executing tests whenever any file changes
autoWatch = false

# Start these browsers, currently available:
# - Chrome
# - ChromeCanary
# - Firefox
# - Opera
# - Safari
# - PhantomJS
browsers = ['PhantomJS']

# Auto run tests on start (when browsers are captured) and exit

# cli runner port
runnerPort = 9201


# use dots reporter, as travis terminal does not support escaping sequences
# possible values: 'dots' || 'progress'
reporter = 'progress'

proxies = {
  '/': 'http://localhost:8002/'
}



preprocessors = 
  '**/*.coffee': 'coffee'

logLevel = LOG_DEBUG