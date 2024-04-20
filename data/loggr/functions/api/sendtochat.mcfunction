#> loggr:api > sendtochat
#--------------------
# -> players : string (selector)
# -> entry : obj (log entry)
#--------------------
# ...
#--------------------
#> sends an <entry> as a formatted chat message to <players>
#--------------------
# ...
#--------------------

data modify storage loggr:var sendtochat.pre set from storage loggr:in sendtochat.entry
data modify storage loggr:var sendtochat.pre.players set from storage loggr:in sendtochat.players
data modify storage loggr:var sendtochat.pre.prefix_tags set from storage loggr:settings chat_prefix_tags
data modify storage loggr:var sendtochat.pre.source_tags set from storage loggr:settings chat_source_tags
function loggr:_/impl/sendtochat/pre with storage loggr:var sendtochat.pre

#reset
data remove storage loggr:in sendtochat
data remove storage loggr:var sendtochat