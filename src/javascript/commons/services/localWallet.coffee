class LocalWallet
  constructor: (@WalletModel, @CurrencyModel, @storage)->
    @storage.set('foo', 'bar')

  getLocalWallet: ()->
    @reset() unless @wallet
    @wallet

  reset: ()->
    defaultCurrency = @CurrencyModel.getFromIso 'GBP'
    @wallet = new @WalletModel(defaultCurrency)
    return @wallet

module.exports = LocalWallet
