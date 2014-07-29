describe "controllers", ->
  controller = null
  $scope = null
  beforeEach ->
    module('app')

  beforeEach inject(($controller, $rootScope) ->
    $scope = $rootScope.$new()
    controller = $controller("HomeController",
      $scope: $scope
    )
  )

  it "has a sample var", ->
    expect($scope.foo).toBe('bar')
