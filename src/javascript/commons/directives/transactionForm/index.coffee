class TransactionFormController
  constructor: (@$scope)->

module.exports = angular.module('directives.transactionForm',[])

  .directive 'transactionForm', ->
    restrict: 'E'
    replace: true
    scope:
      transaction: '='
      onSubmit: '='
      currency: '='
    controller: TransactionFormController
    template: require './template'
