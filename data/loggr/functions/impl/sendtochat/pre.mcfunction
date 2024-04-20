#> loggr:impl/sendtochat/pre
#--------------------
#- loggr:api/sendtochat
#--------------------

$data modify storage loggr:var sendtochat.pre.message_tags set from storage loggr:settings chat_message_tags[{level:$(level)}].tags
$execute if entity $(players) run function loggr:impl/sendtochat/send with storage loggr:var sendtochat.pre