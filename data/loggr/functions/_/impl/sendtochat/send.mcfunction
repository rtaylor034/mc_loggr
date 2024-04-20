#> loggr:_/impl/sendtochat/send
#--------------------
#- loggr:api/sendtochat
#--------------------

$tellraw $(players) ["",{"text":"[Log : ",$(prefix_tags)},{"nbt":"sendtochat.entry.source","storage":"loggr:in",$(source_tags)},{"text":"] @ ",$(prefix_tags)},{"nbt":"sendtochat.entry.time.day","storage":"loggr:in",$(prefix_tags)},{"text":"-",$(prefix_tags)},{"nbt":"sendtochat.entry.time.tick","storage":"loggr:in", $(prefix_tags)},{"text":" (",$(prefix_tags)},{"nbt":"sendtochat.entry.level","storage":"loggr:in",$(message_tags)},{"text":"): ",$(prefix_tags)},{"nbt":"sendtochat.entry.message","storage":"loggr:in",$(message_tags)}]