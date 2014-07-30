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

  describe "serialize()", ->

    beforeEach ->
      @data =
        iso: 'FOO'
        symobol: '∆'
        iconClass: 'icon-foo'

      @currency = new @CurrencyModel @data.iso, @data.symbol, @data.iconClass
      @serialized = @currency.serialize()

    it "returns an object", ->
      expect(@serialized).toBeDefined()
      expect(@serialized.constructor).toBe Object

    it "contains the currency iso", ->
      expect(@serialized.iso).toBe @data.iso

    it "contains the currency symbol", ->
      expect(@serialized.symbol).toBe @data.symbol

    it "contains the currency iconClass", ->
      expect(@serialized.iconClass).toBe @data.iconClass

  describe "Currency.deserialize()", ->

    beforeEach ->
      @serialized =
        iso: 'FOO'
        symbol: '∆'
        isoClass: 'icon-foo'
      @currency = @CurrencyModel.deserialize(@serialized)

    it "returns a currency object", ->
      expect(@currency).toBeDefined()
      expect(@currency.constructor).toBe @CurrencyModel

    it "contains the currency iso", ->
      expect(@currency.iso).toBe @serialized.iso

    it "contains the currency symbol", ->
      expect(@currency.symbol).toBe @serialized.symbol

    it "contains the currency iconClass", ->
      expect(@currency.iconClass).toBe @serialized.iconClass

  describe "serialize > deserialize", ->
    beforeEach ->
      @data =
        iso: 'FOO'
        symbol: '∆'
        isoClass: 'icon-foo'

      @originalcurrency = new @CurrencyModel(@data.iso, @data.symbol)

      @serialized = @originalcurrency.serialize()
      @deserializedcurrency = @CurrencyModel.deserialize @serialized

    it 'saves iso', ->
      expect(@deserializedcurrency.iso).toBe @data.iso
    it 'saves symbol', ->
      expect(@deserializedcurrency.symbol).toBe @data.symbol
    it 'saves iconClass', ->
      expect(@deserializedcurrency.iconClass).toBe @data.iconClass
