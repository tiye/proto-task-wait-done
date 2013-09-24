
proto-task-wait-done
------

simple proto-based event handler, wait events and do task

### Usage

```
npm install --save proto-task-wait-done
```

```coffee
task = require('./main').task.new()

task.wait 'a'
task.wait 'b'

task.task = ->
  console.log 'fire:', task.data

task.done 'a', 'data of a'
task.done 'b', 'data of b'
```

### Implementation

```coffee
{proto} = require 'proto-scope'

exports.task = proto.as
  init: ->
    @keys = []
    @data = {}
  wait: (name) ->
    @keys.push name unless name in @keys
  drop: (name) ->
    @keys = @keys.filter (key) -> key isnt name
    @fire() if @keys.length is 0
  done: (name, data) ->
    @data[name] = data
    @drop name
  fire: ->
    @task? @data
```

### License

BSD