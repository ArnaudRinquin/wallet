describe "Transaction directive", ->
  controller = null
  $scope = null
  $dirScope = null
  elm = null
  formElm = null
  form = null
  transaction = null

  beforeEach ->
    module('app.directives')
    module('app.services')

  beforeEach inject(($rootScope, $compile, TransactionModel) ->
    $scope = $rootScope.$new()

    $scope.theTransaction = new TransactionModel(15, true)
    $scope.total = 100

    elm = angular.element('<div><transaction-form transaction="theTransaction" current-total="total"></transaction-form></div>')
    $compile(elm)($scope)
    $scope.$digest()
    formElm = elm.find('.transactionForm')
    $dirScope = formElm.isolateScope()
    form = $dirScope.transactionForm
  )

  describe "scope", ->
    it "contains a the given transaction", ->
      expect($dirScope.transaction).toBeDefined()
      expect($dirScope.transaction).toBe $scope.theTransaction

  it "creates a form with 'transactionForm' class name", ->
    expect(formElm.length).toBe 1
    expect(formElm.hasClass('transactionForm')).toBe true

  it "creates an input field with 'amount' class name", ->
    amountElm = formElm.find('input[type="number"].amount')
    expect(amountElm.length).toBe 1

  it "the amount input value is the transaction amount", ->
    amountElm = formElm.find('input[type="number"].amount')
    expect(amountElm.val()).toBe $scope.theTransaction.amount.toString()

  it "creates an checkbox field with 'isCredit' class name", ->
    isCreditCbElm = formElm.find('input[type="checkbox"].isCredit')
    expect(isCreditCbElm.length).toBe 1

  it "the isCredit checkbox is checked by default", ->
    isCreditCbElm = formElm.find('input[type="checkbox"].isCredit')
    expect(isCreditCbElm.val()).toBe 'on'

  describe "validation", ->
    it "allows positive float amounts", ->
      $dirScope.transaction.amount = 10.5
      $scope.$digest()
      expect(form.amount.$valid).toBe true

    it "disallows null amounts", ->
      $dirScope.transaction.amount = null
      $scope.$digest()
      expect(form.amount.$valid).toBe false

    it "disallows negative amounts", ->
      $dirScope.transaction.amount = -10
      $scope.$digest()
      expect(form.amount.$valid).toBe false

    it "disalows non-number amounts", ->
      $dirScope.transaction.amount = "whatever"
      $scope.$digest()
      expect(form.amount.$valid).toBe false
    it "disalows empty amounts", ->
      $dirScope.transaction.amount = null
      $scope.$digest()
      expect(form.amount.$valid).toBe false

    it "disalows total to be below 0", ->
      $dirScope.transaction.amount = 1000
      $dirScope.transaction.isCredit = false
      $scope.$digest()
      expect(form.amount.$valid).toBe false

    it "disable submit button on invalid amount", ->
      $dirScope.transaction.amount = 'invalid'
      $scope.$digest()
      submitElm = formElm.find('button.submit')
      expect(submitElm.attr('disabled')).toBeDefined()

  it "create a submit button with 'submit' className", ->
    submitBtn = formElm.find('button[type="submit"].submit')
    expect(submitBtn.length).toBe 1

