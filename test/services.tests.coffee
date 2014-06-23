describe "services", ->
  sampleFac = null
  $scope = null
  beforeEach ->
    module('app.services');
  
  beforeEach inject((sampleFactory) ->
    sampleFac = sampleFactory
  )
    
  it "has a working sampleFactory", ->
    expect(sampleFac.foo).toBeDefined()
