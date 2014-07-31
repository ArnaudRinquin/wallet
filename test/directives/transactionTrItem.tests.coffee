describe "Transaction directive", ->
  controller = null
  compile = null
  $scope = null
  elm = null

  beforeEach ->
    module('directives.transactionTrItem')

  beforeEach inject(($rootScope, $compile) ->
    compile = $compile
    $scope = $rootScope.$new()
    $scope.currency =
      iso: 'FOO'
      symbol: '∆'
      iconClass: 'icon-foo'
    $scope.theTransaction =
      amount: 10
      isCredit: true

    elm = angular.element("<div transaction-tr-item transaction='theTransaction' currency='currency'></div>")
    $compile(elm)($scope)
    $scope.$digest()
  )
  it "shows transaction amount", ->
    amountContent = elm.find('.amount')
    expect(amountContent.length).toBe 1
    expect(amountContent.text()).toBe '10'

  it "shows transaction currency iso", ->
    currencyElement = elm.find('.currency')
    expect(currencyElement.length).toBe 1
    expect(currencyElement.text()).toBe $scope.currency.iso

  describe "transaction sign", ->

    it 'is "+" when transaction.isCredit', ->
      creditContent = elm.find('.isCredit')
      expect(creditContent.length).toBe 1
      expect(creditContent.text()).toBe '+'

    it 'is "-" when transaction.isCredit is false', ->
      $scope.theTransaction =
        amount: 10
        isCredit: false
      compile(elm)($scope)
      $scope.$digest()
      creditContent = elm.find('.isCredit')
      expect(creditContent.length).toBe 1
      expect(creditContent.text()).toBe '-'

