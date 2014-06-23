describe "directives", ->
  controller = null
  $scope = null
  elm = null
    
  beforeEach ->
    module('app.directives')

  beforeEach inject(($rootScope, $compile) ->
    $scope = $rootScope.$new()
    elm = angular.element("<sample-directive></sample-directive>")
    $compile(elm) $scope
  )
  it "should display big Boom", ->
    expect(elm.text()).toBe('BOOM')
