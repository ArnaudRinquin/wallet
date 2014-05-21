module.exports = ($scope)->
  $scope.foo = 'bar'

  $scope.countdown =
    start: 25 * 60

  $scope.timerRunning = false;

  $scope.startTimer = ->
    $scope.$broadcast 'timer-start'
    $scope.timerRunning = true

  $scope.stopTimer = ->
    $scope.$broadcast 'timer-stop'
    $scope.timerRunning = false

  $scope.$on 'timer-stopped', (event, data)->
    console.log "Timer Stopped - data = #{data}"
