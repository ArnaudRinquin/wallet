


module.exports = angular.module(
  'app.services', [
  ])

  .factory('TransactionModel', ()->
    return require './models/transaction'
  )

  .factory('CurrencyModel', ()->
    return require './models/currency'
  )
