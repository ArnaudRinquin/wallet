class AppController
  constructor: (@$rootScope, @$scope)->
    @$scope.reset = ()=>
      @$rootScope.$broadcast 'resetWallet'

module.exports = AppController
