module.exports = angular.module(
  'app.directives', [
    # require('./sampleDirective').name
  ])
  .directive('sampleDirective', ->
    restrict: 'E'
    replace: true
    template: '<blockquote>BOOM</blockquote>'
  )
