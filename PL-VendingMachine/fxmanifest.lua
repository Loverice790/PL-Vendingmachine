fx_version "cerulean"

game "gta5"

lua54 "yes"

author "pule_dev & loverice"


shared_script {"@ox_lib/init.lua", "config.lua" }

client_script {"client/main.lua"}

server_script {"server/main.lua"}

files {
    "locales/*.json"
}