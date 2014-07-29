


module.exports = angular.module(
  'app.services', [
  ])

  .factory('TransactionModel', ()->
    return require './models/transaction'
  )
