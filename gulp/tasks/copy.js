var gulp = require('gulp');

gulp.task('copy', ['copyFonts'], function() {
	return gulp.src([
    'bower_components/bootstrap/dist/css/bootstrap.min.css',
    'bower_components/bootstrap/dist/css/bootstrap-theme.min.css',
    'bower_components/bootstrap-switch/dist/css/bootstrap3/bootstrap-switch.min.css',
    'bower_components/font-awesome/css/font-awesome.min.css',
    'src/htdocs/**'
    ])
		.pipe(gulp.dest('build'));
});

gulp.task('copyFonts', function(){
  return gulp.src([
    'bower_components/font-awesome/fonts/**',
    ])
    .pipe(gulp.dest('build/fonts'));
})
