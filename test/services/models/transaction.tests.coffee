describe "Transaction model", ->
  beforeEach ->
    module('app.services');

  beforeEach inject((TransactionModel) ->
    @TransactionModel = TransactionModel
  )

  it "is declared", ->
    expect(@TransactionModel).toBeDefined()

  describe "constructor", ->

    beforeEach ->
      @amount = 10
      @isCredit = true
      @transaction = new @TransactionModel @amount, @isCredit

    it 'saves the given amount', ->
      expect(@transaction.amount).toBe @amount

    it 'saves the isCredit attribute', ->
      expect(@transaction.isCredit).toBe @isCredit

    it 'accepts positive integer only', ->

      callWithZero = =>
        transaction = new @TransactionModel(0, true)
      callWithNegative = =>
        transaction = new @TransactionModel(-1, true)

      expect(callWithZero).toThrow()
      expect(callWithNegative).toThrow()

  describe "applyToNumber(number)", ->

    describe "when isCredit is true", ->

      beforeEach ->
        @transaction = new @TransactionModel 10, true
        @result = @transaction.applyToNumber 20

      it "adds its amount to the given number", ->
        expect(@result).toBe 30

    describe "when isCredit is false", ->

      beforeEach ->
        @transaction = new @TransactionModel 10, false
        @result = @transaction.applyToNumber 25

      it "removes its amount from the given number", ->
        expect(@result).toBe 15

  describe "serialize()", ->

    beforeEach ->
      @transaction = new @TransactionModel 10, true
      @serialized = @transaction.serialize()

    it "returns an object", ->
      expect(@serialized).toBeDefined()

    it "contains the transaction amount", ->
      expect(@serialized.amount).toBe 10

    it "contains the transaction amount", ->
      expect(@serialized.isCredit).toBe true

