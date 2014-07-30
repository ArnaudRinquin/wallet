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
      currentTotal: '='
    controller: TransactionFormController
    template: require './template'
