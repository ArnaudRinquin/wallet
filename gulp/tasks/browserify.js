var browserify   = require('browserify');
var gulp         = require('gulp');
var handleErrors = require('../util/handleErrors');
var source       = require('vinyl-source-stream');

gulp.task('browserify', function(){
	return browserify({
			entries: ['./src/javascript/app.coffee'],
			extensions: ['.coffee', '.html']
		})
		.bundle({debug: true})
		.on('error', handleErrors)
		.pipe(source('app.js'))
		.pipe(gulp.dest('./build/'));
});
