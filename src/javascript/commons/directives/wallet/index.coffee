class WalletDirectiveController
  constructor: (@$scope)->

module.exports = angular.module('directives.wallet',[])

  .directive 'wallet', ->
    restrict: 'E'
    replace: true
    scope:
      wallet: '='
    controller: WalletDirectiveController
    template: require './template'
