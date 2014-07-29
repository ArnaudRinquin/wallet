class TransactionController
  constructor: (@$scope)->

module.exports = angular.module('directives.transactionListItem',[])

  .directive 'transactionListItem', ->
    restrict: 'E'
    replace: true
    scope:
      transaction: '='
    controller: TransactionController
    template: require './template'
