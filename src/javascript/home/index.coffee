module.exports = angular.module(
  'app.home', [
    require('angular-timer').name
  ])
  .controller('HomeController', require('./controller'))
  .config require('./config')


