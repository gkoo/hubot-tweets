chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'tweets', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/tweets')(@robot)

  it 'responds to twitter commands', ->
    expect(@robot.respond).to.have.been.calledWith(/twitter (\S+)\s*(.+)?/i)

  it 'responds to tweet commands', ->
    expect(@robot.respond).to.have.been.calledWith(/tweet\s*(.+)?/i)
