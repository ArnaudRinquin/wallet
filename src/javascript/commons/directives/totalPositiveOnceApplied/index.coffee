module.exports = angular.module('directives.totalPositiveOnceApplied',[])

  .directive 'totalPositiveOnceApplied', (TransactionModel)->
    require: 'ngModel'
    restrict: 'A',
    link:  (scope, element, attrs, ngModelController)->

      currentValue = null

      totalIsPositiveOnceApplied = (valueAsInt)->
        isCredit = attrs.toBeAdded == "true"
        currentTotal = parseInt(attrs.total)

        tmpTransaction = new TransactionModel(valueAsInt, isCredit)

        afterApplyTotal = tmpTransaction.applyToNumber(currentTotal)

        return afterApplyTotal >= 0


      checkValidity = ()->
        valueAsInt = parseInt(currentValue)

        return if isNaN(valueAsInt) || valueAsInt <= 0
        valid = totalIsPositiveOnceApplied(valueAsInt)
        ngModelController.$setValidity 'totalPositive', valid

      attrs.$observe 'toBeAdded', checkValidity
      attrs.$observe 'total', checkValidity
      scope.$watch attrs.ngModel, (value)->
        currentValue = value
        checkValidity()
