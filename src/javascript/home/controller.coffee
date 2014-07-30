class HomeController
  constructor: (@$scope, @LocalWallet, @TransactionModel)->
    @init()

  init: ()=>
    @$scope.wallet = @LocalWallet.getLocalWallet()

    @$scope.addTransaction = @addTransaction
    @$scope.reset = @reset
    @_resetNewTransaction()

  addTransaction: ()=>
    @$scope.wallet.addTransaction @$scope.newTransaction
    @_resetNewTransaction()

  _resetNewTransaction: ()=>
    @$scope.newTransaction = new @TransactionModel(10, true)

  reset: ()=>
    @$scope.wallet = @LocalWallet.reset()

module.exports = HomeController
