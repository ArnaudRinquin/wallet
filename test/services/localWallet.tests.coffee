describe 'LocalWallet', ->
  beforeEach ->
    module 'app.services'

  beforeEach inject((LocalWallet) ->
    @LocalWallet = LocalWallet
  )

  it 'is declared', ->
    expect(@LocalWallet).toBeDefined()

  describe 'getLocalWallet()', ->
    beforeEach ->
      @wallet = @LocalWallet.getLocalWallet()

    it 'returns a wallet', ->
      expect(@wallet).toBeDefined()
      # Just check for wallet currency
      expect(@wallet.currency).toBeDefined()

    describe 'returned wallet', ->
      it 'has a GBP currency', ->
        expect(@wallet.currency.iso).toBe 'GBP'

      it 'has a no transaction', ->
        expect(@wallet.transactions.length).toBe 0
        expect(@wallet.total).toBe 0
