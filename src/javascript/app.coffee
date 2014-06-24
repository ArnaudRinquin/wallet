angular = require 'angular'

app = angular.module 'app', [
  require('angular-ui-router')
  require('./commons/services').name
  require('./commons/directives').name
  require('./home').name
]
app.constant 'version', require('../../package.json').version
app.config require('./routes')
