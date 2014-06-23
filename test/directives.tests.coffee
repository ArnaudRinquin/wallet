describe "directives", ->
  controller = null
  $scope = null
  elm = null
    
  beforeEach ->
    module('directives.boom')

  beforeEach inject(($rootScope, $compile) ->
    $scope = $rootScope.$new()
    elm = angular.element("<boom></boom>")
    $compile(elm) $scope
  )
  it "(Boom) should be defined", ->
    expect(elm).toBeDefined 
  it "should display big Boom", ->
    expect(elm.text()).toBe('BOOM')
