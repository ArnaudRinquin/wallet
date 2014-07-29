


module.exports = angular.module(
  'app.services', [
  ])

  .factory('WalletModel', ()->
    return require './models/wallet'
  )

  .factory('TransactionModel', ()->
    return require './models/transaction'
  )

  .factory('CurrencyModel', ()->
    return require './models/currency'
  )

  .service('LocalWallet', require './localWallet')
