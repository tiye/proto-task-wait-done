
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