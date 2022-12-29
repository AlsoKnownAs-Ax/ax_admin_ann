fx_version 'adamant'

game 'gta5'

author '--Ax-'

ui_page 'html/index.html'

files{
    'html/assets/logo.png',
    'html/index.html',
    'html/reset.css',
    'html/style.css',
    'html/main.js'
}

client_scripts{
    '@vrp/client/Proxy.lua',
    '@vrp/client/Tunnel.lua',
    'main/client.lua'
}

server_scripts{
    '@vrp/lib/utils.lua',
    'main/server.lua'
}

shared_scripts{
    'config.lua'
}