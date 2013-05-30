'use strict'



# mocha specs for the app controller goes here

# load chai assert
{expect} = require '/Users/darvin/Projects/yaas/test/support/setup.coffee'


describe 'controller:app', ->
  # initialize variables
  AppController = scope = null
  
  beforeEach ->
    angular.mock.module('app.controllers')
    angular.mock.inject ($rootScope, $controller) ->
      scope = $rootScope.$new()
      AppController = $controller('AppController', $scope: scope)
      
  it 'should be constructable', ->
    expect(!!AppController).to.be.true


  it 'should have the correct name', ->
    expect(scope.name).to.be.equal 'app controller'