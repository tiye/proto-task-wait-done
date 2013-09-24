
task = require('./main').task.new()

task.wait 'a'
task.wait 'b'

task.task = ->
  console.log 'fire:', task.data

task.done 'a', 'data of a'
task.done 'b', 'data of b'