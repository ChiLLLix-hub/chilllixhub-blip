fx_version 'cerulean'
game 'gta5'

author 'ChiLLLix-hub'
description 'FiveM Blip Script for QBCore Framework'
version '1.1.0'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}

-- Stream folder for custom blip sprites (.ytd files)
files {
    'stream/*.ytd'
}

lua54 'yes'
