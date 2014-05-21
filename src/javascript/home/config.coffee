module.exports = ($stateProvider, $urlRouterProvider)->

  $stateProvider.state 'home',
    url: "/",
    template: require('./template.html')
    controller: 'HomeController'
