var gulp = require('gulp'),
    sass = require('gulp-sass'),
    concat = require('gulp-concat'),
    minifyCSS = require('gulp-csso'),
    sourcemaps = require('gulp-sourcemaps');

gulp.task('sass', function(){
    return gulp.src([
        'catalog/view/theme/default/css/*.+(scss|sass)'
    ])
        .pipe(sourcemaps.init())
        .pipe(sass())
        .pipe(sourcemaps.write('./maps'))
        .pipe(gulp.dest('catalog/view/theme/default/css'))
});

gulp.task('main-mini', function(){
    return gulp.src(['htdocs/themes/default-adaptive/css/style.css'])
        .pipe(concat('main.min.css'))
        .pipe(minifyCSS())
        .pipe(gulp.dest('htdocs/themes/default-adaptive/css'))
});
gulp.task('clients-mini', function(){
    return gulp.src(['htdocs/themes/default-adaptive/css/clients.css'])
        .pipe(concat('clients-min.min.css'))
        .pipe(minifyCSS())
        .pipe(gulp.dest('htdocs/themes/default-adaptive/css'))
});

gulp.task('watch', function(){
    gulp.watch(
        'catalog/view/theme/default/css/*.+(scss|sass)',
        ['sass']
    );
});