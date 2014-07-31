class TransactionController
  constructor: (@$scope)->
    @$scope.remove = ()=>
      try
        @$scope.onRemove(@$scope.transaction)
      catch error
        @$scope.removeError = error

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
