module.exports = ($scope, CurrencyModel, TransactionModel, WalletModel)->
  currency = CurrencyModel.getFromIso 'GBP'
  transactions = [
    new TransactionModel(10, true)
    new TransactionModel(3, false)
  ]

  $scope.wallet = new WalletModel(currency, transactions)
