 module.exports = angular.module('directives.boom',[])

  .directive('boom', ->
    restrict: 'E'
    template: '<blockquote>BOOM</blockquote>'
  )