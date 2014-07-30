class Wallet
  constructor: (@currency, @transactions = [], @repository)->
    throw "No currency given" unless @currency
    @_updateTotal()

  addTransaction: (transaction)->
    @transactions.push transaction
    @_updateTotal()
    @_notifyUpdate()

  _updateTotal: ()->
    @total = @transactions.reduce (subtotal, transaction)->
      transaction.applyToNumber subtotal
    , 0

  _notifyUpdate: ()->
    @repository.onUpdate(this)

module.exports = Wallet
