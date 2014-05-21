angular = require 'angular'

app = angular.module 'app', [
  require('angular-ui-router')
  require('./home').name
]

app.constant 'version', require('../../package.json').version
app.config require('./routes')


