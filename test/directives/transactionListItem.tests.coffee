describe "Transaction directive", ->
  controller = null
  $scope = null
  elm = null

  beforeEach ->
    module('directives.transactionListItem')

  beforeEach inject(($rootScope, $compile) ->
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

  it "shows transaction amount", ->
    creditContent = elm.find('.isCredit')
    expect(creditContent.length).toBe 1
    expect(creditContent.text()).toBe 'true'
