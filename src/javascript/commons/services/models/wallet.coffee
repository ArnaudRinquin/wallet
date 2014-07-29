class Wallet
  constructor: (@currency, @transactions = [])->
    throw "No currency given" unless @currency
    @_updateTotal()

  addTransaction: (transaction)->
    @transactions.push transaction
    @_updateTotal()

  _updateTotal: ()->
    @total = @transactions.reduce (subtotal, transaction)->
      transaction.applyToNumber subtotal
    , 0

module.exports = Wallet
