fx_version 'cerulean'

game 'gta5'
author 'Coffeelot and Wuggie'
description 'Plate Swaps for QB'
lua54 'yes'

ui_page 'html/index.html'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

client_scripts{
    '@ox_core/imports/client.lua',
    'client/*.lua',
}

server_scripts{
    '@oxmysql/lib/MySQL.lua',
    '@ox_core/imports/server.lua',
    'server/*.lua',
}

files {
    'locales/*.json',
    'html/*.html',
    'html/*.css',
    'html/*.js',
    'html/fonts/*.otf',
    'html/img/*'
}

dependency{
    'oxmysql',
}

exports {
    'resetPlateIfFake',
    'applyFakePlateIfExists',
}
