#>loggr:internal/clearcapacity
#--------------------
# - internal/checkcapacity
# @self
#--------------------

scoreboard players remove *checkcapacity-tot loggr_var 1
data remove storage loggr:data logs[0]
execute if score *checkcapacity-tot loggr_var matches 1.. run function loggr:internal/clearcapacity