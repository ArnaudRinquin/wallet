var gulp = require('gulp');

gulp.task('copy', function() {
	return gulp.src([
    'bower_components/bootstrap/dist/css/bootstrap.min.css',
    'bower_components/bootstrap/dist/css/bootstrap-theme.min.css',
    'bower_components/bootstrap-switch/dist/css/bootstrap3/bootstrap-switch.min.css',
    'src/htdocs/**'
    ])
		.pipe(gulp.dest('build'));
});
