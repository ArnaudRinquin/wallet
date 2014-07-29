class Currency
  @instances = [
    new Currency('GBP', '£', 'fa-gbp')
    new Currency('USD', '$', 'fa-dollar')
    new Currency('EUR', '€', 'fa-euro')
  ]

  @getFromIso: (iso)->
    @matchingIso = @instances.filter (currency)->
      currency.iso == iso
    @matchingIso[0]


  constructor: (@iso, @symbol, @iconClass)->



  module.exports = Currency
