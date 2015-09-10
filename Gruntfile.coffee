fs = require("fs")

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
        script: "./bin/www"
        options:
          ignore: [ # Do not restart when files in these folders are modified
            "./public/*"
            "./src/*"
            "./node_modules/*"
            "./.livereload"
          ]
          watch: [
            "bin/www"
            "."
          ]
          env:
            DEBUG: "karma:*"
            PORT: "3436"
            NODE_ENV: "development"
          ext: "coffee"
          exec: "coffee"
          callback: (nodemon) ->
            # Write to the .livereload file when nodemon restarts the server
            nodemon.on "restart", ->
              setTimeout (->
                fs.writeFileSync ".livereload", "K"
                return
              ), 1000
              return
            nodemon.on "log", (event) ->
              console.log event.colour
              return
            return
    watch:
      options:
        livereload: true
      coffee:
        files: ["./src/coffee/*.coffee"]
        tasks: ["coffee"]
      stylus:
        files: ["./src/styl/*.styl"]
        tasks: ["stylus"]
      server: # Watch the .livereload file so that livereload triggers when the file is modified
        files: ["./.livereload", "./views/*.jade"]
        tasks: [] # No need to run a task here
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

  grunt.registerTask "forceReload", null, ->
    setTimeout (->
      fs.writeFileSync ".livereload", "K"
      return
    ), 1500
    return

  grunt.registerTask("compile", ["stylus", "coffee", "forceReload"])
  grunt.registerTask("default", ["compile", "concurrent"])

  return
