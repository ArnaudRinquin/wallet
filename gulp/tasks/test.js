var gulp = require('gulp');
var karma = require('gulp-karma');

var fs = require('fs');
require('coffee-script/register');


gulp.task('test', ['build', 'testrun']);
gulp.task('testrun', [], function () {

var karmaTestFiles = [
      'src/javascript/app.coffee',
      'bower_components/angular-mocks/angular-mocks.js',
      './**/*.tests.js',
      './**/*.tests.coffee',
];

//Karma tests
return gulp.src(karmaTestFiles)
    .pipe(karma({
      configFile: 'test/karma.config.js',
      action: 'watch'
    }))
    .on('error', function(err) {
      // Make sure failed tests cause gulp to exit non-zero
      throw err;
    });
});
