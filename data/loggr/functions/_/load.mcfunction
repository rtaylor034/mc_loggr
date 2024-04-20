#>loggr:_/load
#--------------------
# @LOAD
#--------------------
#settings
execute unless data storage loggr:settings {PERSIST:true} run function loggr:settings

scoreboard players set *loggr load.status 1

#declare storage loggr:var
#declare storage loggr:in
#declare storage loggr:out
#declare storage loggr:data
#scoreboards
scoreboard objectives add loggr_var dummy
scoreboard objectives add loggr_listento dummy

#checkcapacity
schedule clear loggr:_/checkcapacity
schedule function loggr:_/checkcapacity 5s

