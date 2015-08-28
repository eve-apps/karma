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
          sourcemap:
            inline: true
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
          ignore: [ # Do not restart when files in these folders are modified
            "./public/*"
            "./src/*"
            "./node_modules/*"
          ]
          env:
            DEBUG: "karma:*"
            PORT: "3436"
          ext: "js,coffee"
    watch:
      options:
        livereload: true
        atBegin: true
      coffee:
        files: ["./src/coffee/*.coffee"]
        tasks: ["coffee"]
      stylus:
        files: ["./src/styl/*.styl"]
        tasks: ["stylus"]
    concurrent:
      tasks: ["watch", "nodemon"]
      options:
        logConcurrentOutput: true
  )

  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-stylus"
  grunt.loadNpmTasks "grunt-nodemon"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-concurrent"

  grunt.registerTask("default", ["concurrent"])

  return
