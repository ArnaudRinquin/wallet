class Transaction
  constructor: (@amount, @isCredit, @createdAt = new Date())->
    throw "Amount must be positive" unless @amount > 0

  applyToNumber: (total)->
    return if @isCredit
      total + @amount
    else
      total - @amount

  revertFromNumber: (total)->
    return if @isCredit
      total - @amount
    else
      total + @amount

  serialize: ()->
    {
      amount: @amount
      isCredit: @isCredit
      createdAt: @createdAt.toISOString()
    }

  @deserialize: (serialized)->
    new Transaction(serialized.amount, serialized.isCredit, new Date(serialized.createdAt))

module.exports = Transaction
