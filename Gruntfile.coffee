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
            "./.livereload"
          ]
          env:
            DEBUG: "karma:*"
            PORT: "3436"
          ext: "js,coffee"
          callback: (nodemon) ->
            # Write to the .livereload file when nodemon restarts the server
            nodemon.on "restart", ->
              setTimeout (->
                require("fs").writeFileSync ".livereload", "K"
                return
              ), 1000
              return
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
      server: # Watch the .livereload file so that it triggers a reload
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

  grunt.registerTask("default", ["concurrent"])

  return
