{exec} = require 'child_process'
task 'build', 'Build project from src/*.coffee to lib/*.js', ->
  cpath = './node_modules/coffee-script/bin'	
  exec "#{cpath}/coffee --compile --output lib/ src/", (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr

