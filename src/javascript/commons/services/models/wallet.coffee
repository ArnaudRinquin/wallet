class Wallet
  constructor: (@currency, @transactions = [], @repository)->
    throw "No currency given" unless @currency
    @_updateTotal()

  addTransaction: (transaction)->
    throw "Balance would be negative" unless @_isBalancePositiveWhenApplied(transaction)
    @transactions.push transaction
    @_updateTotal()
    @_notifyUpdate()

  removeTransaction: (transaction)->
    throw "Balance would be negative" unless @_isBalancePositiveWhenReverted(transaction)
    index = @transactions.indexOf transaction
    if index
      @transactions.splice index, 1
      @_updateTotal()
      @_notifyUpdate()

  setCurrency: (currency)->
    @currency = currency
    @_notifyUpdate()

  _isBalancePositiveWhenApplied: (transaction)->
    return transaction.applyToNumber(@total) >= 0

  _isBalancePositiveWhenReverted: (transaction)->
    return transaction.revertFromNumber(@total) >= 0

  _updateTotal: ()->
    @total = @transactions.reduce (subtotal, transaction)->
      transaction.applyToNumber subtotal
    , 0

  _notifyUpdate: ()->
    @repository.onUpdate(this)

module.exports = Wallet
