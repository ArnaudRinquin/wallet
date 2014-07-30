describe "Wallet model", ->


  beforeEach ->
    module('app.services');

  beforeEach inject((WalletModel, TransactionModel, CurrencyModel) ->
    @WalletModel = WalletModel
    @TransactionModel = TransactionModel
    @CurrencyModel = CurrencyModel
    @currency = @CurrencyModel.instances[0]
    @createTransaction = (amount = 10)=>
      return new @TransactionModel amount, true
  )

  it "is declared", ->
    expect(@WalletModel).toBeDefined()

  describe 'constructor', ->
    it 'throws an error if no currency is given', ->

      callWithoutCurrency = =>
        wallet = new @WalletModel(null)

      expect(callWithoutCurrency).toThrow()

    it 'saves the given transactions', ->
      transactions = [
        @createTransaction()
        @createTransaction()
      ]

      wallet = new @WalletModel(@currency, transactions)

      expect(wallet.transactions.length).toBe 2
      expect(wallet.transactions).toContain(transactions[0])
      expect(wallet.transactions).toContain(transactions[1])

    it 'updates its total based on given transactions', ->
      transactions = [
        @createTransaction 10
        @createTransaction 15
      ]

      wallet = new @WalletModel(@currency, transactions)

      expect(wallet.total).toBe(25)


  describe 'addTransaction', ->

    beforeEach ->

      @initialTransactions = [
        @createTransaction 10
        @createTransaction 15
      ]

      @

      @wallet = new @WalletModel(@currency, @initialTransactions)

    it 'saves the new transaction in last position', ->
      transaction = @createTransaction 25
      @wallet.addTransaction transaction

      expect(@wallet.transactions).toContain transaction

    it 'saves the new transaction in last position', ->
      transaction = @createTransaction 25
      @wallet.addTransaction transaction

      expect(@wallet.total).toBe 50
