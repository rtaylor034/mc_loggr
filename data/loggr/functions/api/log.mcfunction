#> loggr:api > log
#--------------------
# -> message : any
# => source : string = "DEBUG"
# => level : int = -1
#--------------------
# <- entry : obj (log entry)
#--------------------
#> saves a log >entry< with <message> and <level>
#> the namespace of the datapack creating the log should be indicated by <source>
#--------------------
#- <message> does not need to be a string or text. it can be any data that conveys useful information.
#- also sends the entry as a chat msg to any player with a loggr_listento score >= <level>
#- see 'readme.txt' for information on log levels
#--------------------

execute unless data storage loggr:in log.level run data modify storage loggr:in log.level set value -1 
execute unless data storage loggr:in log.source run data modify storage loggr:in log.source set value "DEBUG"

#generate entry
data modify storage loggr:var log.entry set from storage loggr:in log
execute store result storage loggr:var log.entry.time.day int 1 run time query day
execute store result storage loggr:var log.entry.time.tick int 1 run time query daytime
execute store result storage loggr:var log.entry.time.absolute int 1 run time query gametime

#chat
execute store result score *log.level loggr_var run data get storage loggr:in log.level
execute as @a if score @s loggr_listento >= *log.level loggr_var run tag @s add _loggr-log.players

data modify storage loggr:in sendtochat.entry set from storage loggr:var log.entry
data modify storage loggr:in sendtochat.players set value "@a[tag=_loggr-log.players]"
function loggr:api/sendtochat

#add to logs
data modify storage loggr:data logs append from storage loggr:var log.entry

#RESET
tag @a remove _loggr-log.players
scoreboard players reset *log.level loggr_var
data remove storage loggr:var log
data remove storage loggr:in log