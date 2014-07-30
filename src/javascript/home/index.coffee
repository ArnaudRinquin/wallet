module.exports = angular.module(
  'app.home', [
    'app.directives'
    'app.services'
  ])
  .controller('HomeController', require('./controller'))
  .config require('./config')
