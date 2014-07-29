describe 'Currency model', ->
  beforeEach ->
    module 'app.services'

  beforeEach inject((CurrencyModel) ->
    this.CurrencyModel = CurrencyModel
  )

  it 'is declared', ->
    expect(this.CurrencyModel).toBeDefined()

  describe 'constructor', ->

    beforeEach ->
      this.iso = 'EUR'
      this.symbol = '$'
      this.iconClass = 'icon-usd'
      this.currency = new this.CurrencyModel(this.iso, this.symbol, this.iconClass)

    it 'saves the given iso', ->
      expect(this.currency.iso).toBe this.iso

    it 'saves the given symbol', ->
      expect(this.currency.symbol).toBe this.symbol

    it 'saves the given iconClass', ->
      expect(this.currency.iconClass).toBe this.iconClass

  describe 'instances', ->

    beforeEach ->
      this.instances = this.CurrencyModel.instances

    it 'is exposed', ->
      expect(this.instances).toBeDefined()

    it 'contains 3 currencies', ->
      expect(this.instances.length).toBe(3)

  describe 'getFromIso(iso)', ->
    it 'returns the USD currency', ->
      this.usd = this.CurrencyModel.getFromIso 'USD'
      expect(this.usd).toBeDefined()
      expect(this.usd.symbol).toBe '$'
    it 'returns the GBP currency', ->
      this.gbp = this.CurrencyModel.getFromIso 'GBP'
      expect(this.gbp).toBeDefined()
      expect(this.gbp.symbol).toBe '£'
    it 'returns the EUR currency', ->
      this.eur = this.CurrencyModel.getFromIso 'EUR'
      expect(this.eur).toBeDefined()
      expect(this.eur.symbol).toBe '€'
