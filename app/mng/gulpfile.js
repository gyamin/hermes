'use strict';

var gulp = require('gulp');
var sass = require('gulp-sass');
var coffee = require('gulp-coffee');
var rev = require('gulp-rev');
var sourceMaps = require('gulp-sourceMaps');
var notify = require("gulp-notify");
var del = require('del');

// configuration gulp
var config = {
    coffee: {
        src: 'app/assets/javascripts/**/*.coffee',
        dest: 'public/javascripts'
    },
    sass: {
        src: 'app/assets/stylesheets/**/*.scss',
        dest: 'public/stylesheets'
    }
}

// clean task
gulp.task('clean-sass', function() {
    return del([config.sass.dest]);
});
gulp.task('clean-coffee', function() {
    return del([config.coffee.dest]);
});

// sass task
gulp.task('sass', ['clean-sass'], function () {
    return gulp.src(config.sass.src)
        .pipe(sourceMaps.init())
        .pipe(sass())
        .pipe(sourceMaps.write("."))
        //.pipe(rev())
        .pipe(gulp.dest(config.sass.dest))
        .pipe(notify("sass"))
});

// coffee task
gulp.task('coffee', ['clean-coffee'], function () {
    return gulp.src(config.coffee.src)
        .pipe(sourceMaps.init())
        .pipe(coffee())
        .pipe(sourceMaps.write("."))
        //.pipe(rev())
        .pipe(gulp.dest(config.coffee.dest))
        .pipe(notify("coffee"))
});

// watch
gulp.task('watch', function () {
    gulp.watch(config.sass.src, ['sass']);
    gulp.watch(config.coffee.src, ['coffee']);
});

// The default task (called when you run `gulp` from cli)
gulp.task('default', ['coffee', 'sass']);