class TransactionController
  constructor: (@$scope)->

module.exports = angular.module('directives.transactionListItem',[])

  .directive 'transactionListItem', ->
    restrict: 'E'
    replace: true
    scope:
      transaction: '='
      currency: '='
    controller: TransactionController
    template: require './template'
