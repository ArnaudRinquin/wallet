describe "Transaction model", ->
  beforeEach ->
    module('app.services');

  beforeEach inject((TransactionModel) ->
    @TransactionModel = TransactionModel
  )

  it "is declared", ->
    expect(@TransactionModel).toBeDefined()

  describe "constructor()", ->

    beforeEach ->
      @amount = 10
      @isCredit = true
      @createdAt = new Date()
      @transaction = new @TransactionModel @amount, @isCredit, @createdAt

    it 'saves the given amount', ->
      expect(@transaction.amount).toBe @amount

    it 'saves the isCredit attribute', ->
      expect(@transaction.isCredit).toBe @isCredit

    it 'saves the createdAt attribute', ->
      expect(@transaction.createdAt).toBe @createdAt

    it 'accepts positive integer only', ->

      callWithZero = =>
        transaction = new @TransactionModel(0, true)
      callWithNegative = =>
        transaction = new @TransactionModel(-1, true)

      expect(callWithZero).toThrow()
      expect(callWithNegative).toThrow()

    it 'as a default createdAt date', ->
      transaction = new @TransactionModel 10, true
      expect(transaction.createdAt).toBeDefined()
      expect(transaction.createdAt.constructor).toBe Date

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
      @createdAt = new Date()
      @transaction = new @TransactionModel 10, true, @createdAt
      @serialized = @transaction.serialize()

    it "returns an object", ->
      expect(@serialized).toBeDefined()

    it "contains the transaction amount", ->
      expect(@serialized.amount).toBe 10

    it "contains the transaction amount", ->
      expect(@serialized.isCredit).toBe true

    it "contains the transaction createdAt", ->
      expect(@serialized.createdAt).toBe @createdAt.toISOString()

  describe "TransactionModel.deserialize()", ->

    beforeEach ->
      @createdAt = new Date()
      @serialized =
        amount: 25,
        isCredit: false
        createdAt: @createdAt.toISOString()

      @transaction = @TransactionModel.deserialize(@serialized)

    it "returns a Transaction object", ->
      expect(@transaction).toBeDefined()
      expect(@transaction.constructor).toBe @TransactionModel

    it "contains the transaction amount", ->
      expect(@transaction.amount).toBe @serialized.amount

    it "contains the transaction amount", ->
      expect(@transaction.isCredit).toBe @serialized.isCredit

    it "contains the transaction Creation date", ->
      expect(@transaction.createdAt).toEqual(new Date(@serialized.createdAt))

  describe "serialize > deserialize", ->
    beforeEach ->
      @data = {
        amount: 123,
        isCredit: true
        createdAt: new Date()
      }

      @originalTransaction = new @TransactionModel(@data.amount, @data.isCredit)

      @serialized = @originalTransaction.serialize()
      @deserializedTransaction = @TransactionModel.deserialize @serialized

    it 'saves amount', ->
      expect(@deserializedTransaction.amount).toBe @data.amount
    it 'saves isCredit', ->
      expect(@deserializedTransaction.isCredit).toBe @data.isCredit
    it 'saves createdAt', ->
      expect(@deserializedTransaction.createdAt).toEqual @data.createdAt


