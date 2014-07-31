class TransactionController
  constructor: (@$scope, @$timeout)->
    @$scope.remove = ()=>
      try
        @$scope.onRemove(@$scope.transaction)
      catch error
        @$scope.removeError = error
        @$timeout =>
          @$scope.removeError =null
        , 2500

module.exports = angular.module('directives.transactionTrItem',[])

  .directive 'transactionTrItem', ->
    restrict: 'A'
    replace: true
    scope:
      transaction: '='
      currency: '='
      onRemove: '='
    controller: TransactionController
    template: require './template'
