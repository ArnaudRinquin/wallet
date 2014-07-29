describe "Wallet model", ->


  beforeEach ->
    module('app.services');

  beforeEach inject((WalletModel, TransactionModel, CurrencyModel) ->
    this.WalletModel = WalletModel
    this.TransactionModel = TransactionModel
    this.CurrencyModel = CurrencyModel
    this.currency = this.CurrencyModel.instances[0]
    this.createTransaction = (amount = 10)=>
      return new this.TransactionModel amount, true
  )

  it "is declared", ->
    expect(this.WalletModel).toBeDefined()

  describe 'constructor', ->
    it 'throws an error if no currency is given', ->

      callWithoutCurrency = =>
        wallet = new this.WalletModel(null)

      expect(callWithoutCurrency).toThrow()

    it 'saves the given transactions', ->
      transactions = [
        this.createTransaction()
        this.createTransaction()
      ]

      wallet = new this.WalletModel(this.currency, transactions)

      expect(wallet.transactions.length).toBe 2
      expect(wallet.transactions).toContain(transactions[0])
      expect(wallet.transactions).toContain(transactions[1])

    it 'updates its total based on given transactions', ->
      transactions = [
        this.createTransaction 10
        this.createTransaction 15
      ]

      wallet = new this.WalletModel(this.currency, transactions)

      expect(wallet.total).toBe(25)


  describe 'addTransaction', ->

    beforeEach ->

      this.initialTransactions = [
        this.createTransaction 10
        this.createTransaction 15
      ]

      this.wallet = new this.WalletModel(this.currency, this.initialTransactions)

    it 'saves the new transaction in last position', ->
      transaction = this.createTransaction 25
      this.wallet.addTransaction transaction

      expect(this.wallet.transactions).toContain transaction

    it 'saves the new transaction in last position', ->
      transaction = this.createTransaction 25
      this.wallet.addTransaction transaction

      expect(this.wallet.total).toBe 50
