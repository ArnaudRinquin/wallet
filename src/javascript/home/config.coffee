module.exports = ($stateProvider, $urlRouterProvider)->

  $stateProvider.state 'home',
    url: "/",
    template: require('./tpl')
    controller: 'HomeController'
