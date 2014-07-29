module.exports = angular.module(
  'app.home', [
    'directives.transactionListItem'
    'directives.wallet'
    'app.services'
  ])
  .controller('HomeController', require('./controller'))
  .config require('./config')
