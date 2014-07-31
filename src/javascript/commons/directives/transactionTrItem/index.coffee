class TransactionController
  constructor: (@$scope)->

module.exports = angular.module('directives.transactionTrItem',[])

  .directive 'transactionTrItem', ->
    restrict: 'A'
    replace: true
    scope:
      transaction: '='
      currency: '='
    controller: TransactionController
    template: require './template'
