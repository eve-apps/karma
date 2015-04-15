module.exports = (grunt) ->
  grunt.initConfig(
    coffee:
      compile:
        options:
          sourceMap: true
        files: [
          expand: true
          flatten: true
          src: "./src/coffee/*.coffee"
          dest: "./public/js"
          ext: ".js"
        ]
    stylus:
      compile:
        options:
          compress: false
          paths: ["./src/styl"]
          import: [
            "nib"
          ]
        files: [
          expand: true
          flatten: true
          src: "./src/styl/*.styl"
          dest: "./public/css"
          ext: ".css"
        ]
    nodemon:
      dev:
        script: "app.coffee"
        options:
          ignore: ["./public/*"]
          env:
            DEBUG: "karma:*"
            PORT: "3436"
    watch:
      options:
        livereload: true
      coffee:
        files: ["./src/coffee/*.coffee"]
        tasks: ["coffee"]
      stylus:
        files: ["./src/styl/*.styl"]
        tasks: ["stylus"]
  )

  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-stylus"
  grunt.loadNpmTasks "grunt-nodemon"
  grunt.loadNpmTasks "grunt-contrib-watch"

  grunt.registerTask("default", ["coffee", "stylus", "nodemon", "watch"])

  return
