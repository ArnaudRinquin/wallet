describe 'LocalWallet', ->
  beforeEach ->
    module 'app.services'

  beforeEach ->
    @storageMock = {
      get: ()-> @storedWallet
      set: ()->
      reset: ()->
      bind: ()->
      unbind: ()->
      clearAll: ()->
    }

    module ($provide)=>
      $provide.value 'storage', @storageMock
      return null # necessarry

    inject ($injector, CurrencyModel, WalletModel, TransactionModel)=>
      @WalletModel = WalletModel
      @TransactionModel = TransactionModel
      @CurrencyModel = CurrencyModel
      @LocalWallet = $injector.get('LocalWallet')


  it 'is declared', ->
    expect(@LocalWallet).toBeDefined()

  describe 'getLocalWallet()', ->
    beforeEach ->
      @wallet = @LocalWallet.getLocalWallet()

    it 'returns a wallet', ->
      expect(@wallet).toBeDefined()
      expect(@wallet.constructor).toBe @WalletModel

    describe 'with clear localStorage', ->
      it 'has a GBP currency', ->
        expect(@wallet.currency.iso).toBe 'GBP'

      it 'has a no transaction', ->
        expect(@wallet.transactions.length).toBe 0
        expect(@wallet.total).toBe 0

    describe 'serializeWallet()', ()->
      beforeEach ()->
        @wallet.transactions.push new @TransactionModel 10, true
        @wallet.transactions.push new @TransactionModel 5, false
        @serialized = @LocalWallet.serializeWallet(@wallet)

      it 'returns an object', ->
        expect(@serialized.constructor).toBe Object

      it 'serializes currency', ->
        serializedCurrency = @wallet.currency.serialize()
        expect(@serialized.currency).toEqual serializedCurrency

      it 'serializes transactions', ->
        serializedTransactions = @wallet.transactions.map (t)-> t.serialize()
        expect(@serialized.transactions).toEqual serializedTransactions

    describe 'deserializeWallet(wallet)', ()->
      beforeEach ()->
        @wallet.transactions.push new @TransactionModel 10, true
        @wallet.transactions.push new @TransactionModel 5, false

        @serialized = {
          currency: @wallet.currency.serialize()
          transactions: @wallet.transactions.map (t)-> t.serialize()
        }

        @restoredWallet = @LocalWallet.deserializeWallet(@wallet)

      it 'returns a Wallet', ->
        expect(@restoredWallet.constructor).toBe @WalletModel

      it 'wallet has the right transactions', ->
        expect(@restoredWallet.transactions).toEqual @wallet.transactions

      it 'wallet has the right currency', ->
        delete @wallet.currency.$$hashKey # Don't know where this comes from
        expect(@restoredWallet.currency).toEqual @wallet.currency

    describe 'onUpdate', ->
      beforeEach ->
        @serialization = @LocalWallet.serializeWallet(@wallet)

        spyOn(@storageMock, "set")

        spyOn(@LocalWallet, "serializeWallet").and.returnValue(@serialization)

        @LocalWallet.onUpdate(@wallet)

      it 'calls the local storage with wallet serialization', ->
        expect(@storageMock.set).toHaveBeenCalledWith @LocalWallet.LOCAL_STORAGE_KEY, @serialization

    describe 'with clear localStorage', ->
      beforeEach ->

        @currency = new @CurrencyModel 'FOO', '∆', 'icon-foo'
        @transactions = [
          new @TransactionModel 125, true
          new @TransactionModel 25, true
          new @TransactionModel 50, false
        ]
        @wallet = new @WalletModel @currency, @transactions
        @serializedWallet = @LocalWallet.serializeWallet(@wallet)

        spyOn(@storageMock, "get").and.returnValue(@serializedWallet)

        @restoredWallet = @LocalWallet.getLocalWallet()

      it 'returns a Wallet', ->
        expect(@restoredWallet).toBeDefined()
        expect(@restoredWallet.constructor).toBe @WalletModel

      describe 'returned Wallet', ->

        it 'has the right currency', ->
          expect(@restoredWallet.currency).toEqual @currency

        it 'has the right transactions', ->
          expect(@restoredWallet.transactions).toEqual @transactions

        it 'has the correct total', ->
          expect(@restoredWallet.total).toEqual 100
