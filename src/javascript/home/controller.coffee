class HomeController
  constructor: (@$scope, @LocalWallet, @TransactionModel)->
    @init()

  init: ()=>
    @wallet = @LocalWallet.getLocalWallet()

    @$scope.wallet = @wallet
    @$scope.addTransaction = @addTransaction
    @$scope.reset = @reset
    @_resetNewTransaction()

  addTransaction: ()=>
    @wallet.addTransaction @$scope.newTransaction
    @_resetNewTransaction()

  _resetNewTransaction: ()=>
    @$scope.newTransaction = new @TransactionModel(10, true)

  reset: ()=>

module.exports = HomeController
