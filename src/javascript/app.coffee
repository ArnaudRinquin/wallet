angular = require 'angular'

require('angular-local-storage')
require('angular-bootstrap-switch')
require('bootstrap')

app = angular.module 'app', [
  require('angular-ui-router')
  require('./commons/services').name
  require('./commons/directives').name
  require('./home').name
  'angularLocalStorage'
  'frapontillo.bootstrap-switch'
]
app.constant 'version', require('../../package.json').version
app.config require('./routes')
app.controller 'AppController', require('./controller')
