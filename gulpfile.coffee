gulp = require 'gulp'
sequence = require 'run-sequence'
slim = require 'gulp-slim'
parcel = require 'gulp-parcel'
plumber = require 'gulp-plumber'
mocha = require 'gulp-mocha'

gulp.task 'build:slim', () ->
  gulp.src './index.slim'
    .pipe plumber()
    .pipe slim({
      pretty: true
    })
    .pipe gulp.dest('.')

gulp.task 'build:parcel', () ->
  gulp.src './index.html', { read: false }
    .pipe parcel()
    .pipe gulp.dest('./dest')

gulp.task 'build', () ->
  sequence 'build:slim', 'build:parcel'

gulp.task 'test', () ->
  gulp.src './test.coffee'
    .pipe mocha {reporter: 'spec'}

gulp.task 'default', () ->
  sequence 'build:slim', 'build:parcel', 'test'
