// Karma configuration
// Generated on Fri Jun 20 2014 16:52:38 GMT+0200 (CEST)

module.exports = function(config) {
  config.set({

    // base path that will be used to resolve all patterns (eg. files, exclude)
    basePath: '',


    // frameworks to use
    // available frameworks: https://npmjs.org/browse/keyword/karma-adapter
    frameworks: ['jasmine', 'browserify'],


    // list of files / patterns to load in the browser
    files: [
      '../src/javascript/app.coffee',
      '../bower_components/angular-mocks/angular-mocks.js',
      './**/*.tests.js',
      './**/*.tests.coffee',
      {
       // watch application files, but do not serve them from Karma since they are served by browserify
        pattern: 'src/javascript/*.+(coffee|js)',
        watched: true,
        included: false,
        served: false
      }
    ],

    browserify: {
      extensions: ['.coffee', '.html', '.jade'],
/*       transform: ['coffeeify'], */
      watch: true,   // Watches dependencies only (Karma watches the tests)
      debug: true,   // Adds source maps to bundle
    },


    // list of files to exclude
    exclude: [

    ],


    // preprocess matching files before serving them to the browser
    // available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
    preprocessors: {
      '**/*.coffee': ['coffee'],
      '../src/javascript/app.coffee': ['browserify']
    },


    // test results reporter to use
    // possible values: 'dots', 'progress'
    // available reporters: https://npmjs.org/browse/keyword/karma-reporter
    reporters: ['mocha', 'osx'],


    // web server port
    port: 9876,


    // enable / disable colors in the output (reporters and logs)
    colors: true,


    // level of logging
    // possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
    logLevel: config.LOG_INFO,


    // enable / disable watching file and executing tests whenever any file changes
    autoWatch: true,


    // start these browsers
    // available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
    browsers: ['PhantomJS'],


    // Continuous Integration mode
    // if true, Karma captures browsers, runs the tests and exits
    singleRun: false
  });
};
