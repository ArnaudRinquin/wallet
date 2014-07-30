class Transaction
  constructor: (@amount, @isCredit)->
    throw "Amount must be positive" unless @amount > 0

  applyToNumber: (total)->
    return if @isCredit
      total + @amount
    else
      total - @amount

  serialize: ()->
    {
      amount: @amount
      isCredit: @isCredit
    }

module.exports = Transaction
