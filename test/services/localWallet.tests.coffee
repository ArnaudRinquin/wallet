describe 'LocalWallet', ->
  beforeEach ->
    module 'app.services'

  beforeEach ->
    storageMock = jasmine.createSpyObj 'storage', [
      'get'
      'set'
      'remove'
      'bind'
      'unbind'
      'clearAll'
    ]

    module ($provide)->
      $provide.value 'storage', storageMock
      return null # necessarry

    inject ($injector) ->
      @LocalWallet = $injector.get('LocalWallet')


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
