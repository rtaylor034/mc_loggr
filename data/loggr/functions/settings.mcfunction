#>loggr-settings

#declare storage loggr:settings
data modify storage loggr:settings PERSIST set value false

#>-------------------
#> storage_capacity : int
#-------------------
#~ maximum amount of stored log entries (soft limit)
#-------------------
#- oldest logs are deleted to keep total stored logs at this capacity
#- logs are checked/deleted every 5 seconds
#-------------------
# DEFAULT: 1000
#-------------------
data modify storage loggr:settings storage_capacity set value 1000
#>-------------------

#>-------------------
#> chat_prefix_tags : string (partial json)
#-------------------
#~ json tags that are added to the prefix of log chat messages.
#-------------------
#- these are directly added to the chat json via macro.
#-------------------
# DEFAULT: '"color":"#C8C8C8"'
#-------------------
data modify storage loggr:settings chat_prefix_tags set value '"color":"#C8C8C8"'
#>-------------------

#>-------------------
#> chat_source_tags : string (partial json)
#-------------------
#~ json tags that are added to the 'source' portion of log chat messages.
#-------------------
#- these are directly added to the chat json via macro.
#-------------------
# DEFAULT: '"color":"green"'
#-------------------
data modify storage loggr:settings chat_source_tags set value '"color":"green"'
#>-------------------

#>-------------------
#> chat_message_tags : {level: int, tags: string (partial json)}[]
#-------------------
#~ json tags that are added to the message of log chat messages based on log level.
#-------------------
#- these are directly added to the chat json via macro.
#- deliberately does NOT include 'interpret:true'
#   dynamic json such as '{"nbt":<path>,"storage":<storage>}' fetches data at *display* time and does not actually a snapshot of data.
#- if one really would like to json format a log message, consider gssen:api/text/evaluate, but be mindful of the overhead this causes.
#-------------------
# DEFAULT: [
#   {level: -1, tags: '"color":"white"},
#   {level:  0, tags: '"color":"light_purple"'},
#   {level:  1, tags: '"color":"red"'},
#   {level:  2, tags: '"color":"gold"'},
#   {level:  3, tags: '"color":"gray"'},
# ]
#-------------------
data remove storage loggr:settings chat_message_tags
data modify storage loggr:settings chat_message_tags append value {level: -1, tags: '"color":"white","bold":false'}
data modify storage loggr:settings chat_message_tags append value {level: 0, tags: '"color":"light_purple"'}
data modify storage loggr:settings chat_message_tags append value {level: 1, tags: '"color":"red"'}
data modify storage loggr:settings chat_message_tags append value {level: 2, tags: '"color":"gold"'}
data modify storage loggr:settings chat_message_tags append value {level: 3, tags: '"color":"gray"'}

#>-------------------