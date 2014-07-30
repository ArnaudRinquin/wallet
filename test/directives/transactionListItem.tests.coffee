describe "Transaction directive", ->
  controller = null
  compile = null
  $scope = null
  elm = null

  beforeEach ->
    module('directives.transactionListItem')

  beforeEach inject(($rootScope, $compile) ->
    compile = $compile
    $scope = $rootScope.$new()
    $scope.theTransaction =
      amount: 10
      isCredit: true

    elm = angular.element("<transaction-list-item transaction='theTransaction'></transaction>")
    $compile(elm)($scope)
    $scope.$digest()
  )
  it "shows transaction amount", ->
    amountContent = elm.find('.amount')
    expect(amountContent.length).toBe 1
    expect(amountContent.text()).toBe '10'

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

