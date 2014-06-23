


module.exports = angular.module(
  'app.services', [
  ])
  
  .factory('sampleFactory', ->
    fac = {}
    fac.foo = ['John', 'James', 'Jake']
    return fac
  )
  
  