var gulp = require('gulp');

gulp.task('copy', function() {
	return gulp.src([
    'bower_components/bootstrap/dist/css/bootstrap.min.css',
    'bower_components/bootstrap/dist/css/bootstrap-theme.min.css',
    'src/htdocs/**'
    ])
		.pipe(gulp.dest('build'));
});
