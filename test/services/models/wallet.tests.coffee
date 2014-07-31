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

  describe 'constructor()', ->
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

  describe 'setCurrency(currency)', ->

    beforeEach ->
      @initialTransactions = [
        @createTransaction 10
        @createTransaction 15
      ]

      @repository =
        onUpdate: (wallet)->

      spyOn @repository, 'onUpdate'

      @newCurrency = new @CurrencyModel 'NEW', '√', 'icon-new'

      @wallet = new @WalletModel @currency, @initialTransactions, @repository
      @wallet.setCurrency(@newCurrency)

    it 'saves the currency', ->
      expect(@wallet.currency).toBe @newCurrency

    it 'calls the repository onUpdate function with itself', ->
      expect(@repository.onUpdate).toHaveBeenCalledWith @wallet

  describe 'addTransaction', ->

    beforeEach ->

      @initialTransactions = [
        @createTransaction 10
        @createTransaction 15
      ]

      @repository =
        onUpdate: (wallet)->

      spyOn @repository, 'onUpdate'

      @wallet = new @WalletModel(@currency, @initialTransactions, @repository)

    it 'saves the new transaction', ->
      transaction = @createTransaction 25
      @wallet.addTransaction transaction

      expect(@wallet.transactions).toContain transaction

    it 'calls the repository onUpdate function with itself', ->
      transaction = @createTransaction 25
      @wallet.addTransaction transaction

      expect(@repository.onUpdate).toHaveBeenCalledWith(@wallet)

    it 'update its total', ->
      transaction = @createTransaction 25
      @wallet.addTransaction transaction

      expect(@wallet.total).toBe 50

    it 'forbid adding a transaction if balance becomes negative', ->
      negativeTransaction = @createTransaction 35, false

      addNegative = =>
        @wallet.addTransaction positiveTransaction

      expect(addNegative).toThrow()

  describe 'removeTransaction', ->
    beforeEach ->

      @initialTransactions = [
        @createTransaction 10
        @createTransaction 15
      ]

      @repository =
        onUpdate: (wallet)->

      spyOn @repository, 'onUpdate'

      @wallet = new @WalletModel(@currency, @initialTransactions, @repository)

      @removedTransaction = @initialTransactions[1]
      @wallet.removeTransaction @removedTransaction

    it 'forbid removing transaction if balance becomes negative', ->
      positiveTransaction = @createTransaction 35
      negativeTransaction = @createTransaction 35, false

      removePositive = =>
        @wallet.removeTransaction positiveTransaction

      expect(removePositive).toThrow()


    it 'removes the given transaction', ->
      expect(@wallet.transactions).not.toContain @removedTransaction

    it 'calls the repository onUpdate function with itself', ->
      expect(@repository.onUpdate).toHaveBeenCalledWith(@wallet)

    it 'update its total', ->
      expect(@wallet.total).toBe 10
