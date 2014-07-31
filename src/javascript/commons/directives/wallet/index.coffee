class WalletDirectiveController
  constructor: (@$scope, @CurrencyModel)->
    @$scope.currencies = @CurrencyModel.instances

    @$scope.newCurrency = @$scope.wallet.currency.iso

    @$scope.onCurrencySwitch = ($event, newCurrency)=>
      $event.preventDefault()
      $event.stopPropagation()
      $scope.dropdownOpen = false

      # newCurrency = @$scope.newCurrency
      wallet = @$scope.wallet

      if newCurrency # Ensure it's not the default value
        wallet.setCurrency newCurrency


module.exports = angular.module('directives.wallet',[])

  .directive 'wallet', ->
    restrict: 'E'
    replace: true
    scope:
      wallet: '='
    controller: WalletDirectiveController
    template: require './template'
