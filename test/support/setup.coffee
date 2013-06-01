


chai = require 'chai'

require 'angular-browserify'
require 'angular-browserify/mocks'

require '../../app/app.coffee'

module.exports = 
  expect: chai.expect
  module: angular.mock.module
  inject: angular.mock.inject
  



