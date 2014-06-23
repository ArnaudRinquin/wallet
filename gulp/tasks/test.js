var gulp = require('gulp');
var mocha = require('gulp-mocha');
var karma = require('gulp-karma');

var fs = require('fs');
require('coffee-script/register');


gulp.task('test', ['build'], function () {

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
      action: 'run'
    }))
    .on('error', function(err) {
      // Make sure failed tests cause gulp to exit non-zero
      throw err;
    });
    
//Mocha tests
/*
  var mocha_opts = {};

  try {
    var opts = fs.readFileSync('test/mocha.opts', 'utf8')
      .trim()
      .split(/\s+/);

    opts.forEach(function(val, indx, arry) {
      if (/^-.+?/.test(val)) {
        val = val.replace(/^-+(.+?)/, "$1");
        mocha_opts[val] = arry[indx + 1];
      }
    });

  } catch (err) {
    // ignore
    console.log("error getting mocha options", err);
  }
*/
//  return gulp.src(['test/**/*.js', 'test/**/*.coffee']).pipe(mocha(mocha_opts)); 
});
