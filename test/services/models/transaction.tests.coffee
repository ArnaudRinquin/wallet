describe "Transaction model", ->
  beforeEach ->
    module('app.services');

  beforeEach inject((TransactionModel) ->
    this.TransactionModel = TransactionModel
  )

  it "is declared", ->
    expect(this.TransactionModel).toBeDefined()

  describe "constructor", ->

    beforeEach ->
      this.amount = 10
      this.isCredit = true
      this.transaction = new this.TransactionModel(this.amount, this.isCredit)

    it 'saves the given amount', ->
      expect(this.transaction.amount).toBe this.amount

    it 'saves the isCredit attribute', ->
      expect(this.transaction.isCredit).toBe(this.isCredit);

    it 'accepts positive integer only', ->

      callWithZero = =>
        transaction = new this.TransactionModel(0, true)
      callWithNegative = =>
        transaction = new this.TransactionModel(-1, true)

      expect(callWithZero).toThrow()
      expect(callWithNegative).toThrow()

  describe "applyToNumber(number)", ->

    describe "when isCredit is true", ->

      beforeEach ->
        this.transaction = new this.TransactionModel 10, true
        this.result = this.transaction.applyToNumber 20

      it "adds its amount to the given number", ->
        expect(this.result).toBe 30

    describe "when isCredit is false", ->

      beforeEach ->
        this.transaction = new this.TransactionModel 10, false
        this.result = this.transaction.applyToNumber 25

      it "removes its amount from the given number", ->
        expect(this.result).toBe 15
