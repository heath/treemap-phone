gulp = require "gulp"
rs   = require "run-sequence"

clean  = require "gulp-clean"
coffee = require "gulp-coffee"
concat = require "gulp-concat"
jade   = require "gulp-jade"
serve  = require "gulp-serve"
stylus = require "gulp-stylus"

gulp.task "clean", ->
  gulp.src "www", read: false
      .pipe clean()

gulp.task "stylus", ->
  gulp.src "app/styles/app.styl"
      .pipe stylus
        compress: true
      .pipe gulp.dest "www/styles"

gulp.task "jade", ->
  gulp.src "app/index.jade"
      .pipe jade()
      .pipe gulp.dest "www/"

  gulp.src "app/views/*.jade"
      .pipe jade()
      .pipe gulp.dest "www/views"

gulp.task "coffee", ->
  gulp.src [
    "app/scripts/app.coffee"
    "app/scripts/controllers/main.coffee"
  ]
  .pipe coffee()
  .pipe concat "app.js"
  .pipe gulp.dest "www/scripts"

gulp.task 'copy', ->
  gulp.src 'app/lib/**/*'
      .pipe gulp.dest 'www/lib'

gulp.task "watch", ->
  gulp.watch "app/**/*", { read: false }, [ "build" ]

gulp.task "serve", serve
  root: [ "www" ]
  port: 9000

gulp.task "default", [
  "serve"
  "watch"
  "build"
]

gulp.task "build", ->
  rs "clean", [
    "copy"
    "stylus"
    "jade"
    "coffee"
  ]
