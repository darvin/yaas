'use strict'

{expect, module, inject} = require '../../support/setup.coffee'


describe 'filter:interpolate', ->
  beforeEach ->
    module 'app.filters'
    module ($provide) ->
      $provide.value "version", "TEST_VER"
      return

  it 'should replace VERSION', ->
    inject (interpolateFilter) ->
      expect(interpolateFilter("before %VERSION% after")).to.be.equal "before TEST_VER after"
    
