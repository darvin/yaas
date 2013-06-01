'use strict'

{expect, module, inject} = require '../../support/setup.coffee'


describe 'service:version', ->
  beforeEach ->
    module 'app.services'

  it 'should replace VERSION', ->
    inject (version) ->
      expect(version).to.be.equal '0.1'
    
