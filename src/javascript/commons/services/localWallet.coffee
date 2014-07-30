class LocalWallet

  DEFAULT_CURRENCY_ISO: 'GBP'
  LOCAL_STORAGE_KEY: 'wallet'

  constructor: (@WalletModel, @TransactionModel, @CurrencyModel, @storage)->

  getLocalWallet: ()->
    serialized = @storage.get @LOCAL_STORAGE_KEY
    @wallet = @deserializeWallet serialized
    @reset() unless @wallet
    @wallet

  reset: ()->
    defaultCurrency = @CurrencyModel.getFromIso @DEFAULT_CURRENCY_ISO
    @wallet = new @WalletModel(defaultCurrency, [], this)
    @onUpdate(@wallet)
    return @wallet

  deserializeWallet: (serialized)->
    return null unless serialized
    currency = @CurrencyModel.deserialize serialized.currency
    transactions = serialized.transactions.map (transaction)=>
      @TransactionModel.deserialize transaction

    wallet = new @WalletModel(currency, transactions, this)

  serializeWallet: (wallet)->
    serialized =
      currency: wallet.currency.serialize()
      transactions: wallet.transactions.map (transaction)->
        transaction.serialize()
    serialized
  onUpdate: (wallet)=>
    serialized = @serializeWallet(wallet)
    @storage.set @LOCAL_STORAGE_KEY, serialized

module.exports = LocalWallet
