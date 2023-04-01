fx_version 'cerulean'

game 'gta5'

lua54 'yes'

version '0.0.1'
description 'Core'

shared_scripts {
    "@es_extended/imports.lua",
    '@es_extended/locale.lua',
    '@ox_lib/init.lua',
    'locales/*.lua',
    'shared/esx/*.lua'
}

client_scripts {
    "client/functions/**/*.lua",
    "client/modules/main_modules.lua",
    "client/modules/**/*.lua",
    "client/esx/**/*.lua"
}

server_script {
    '@oxmysql/lib/MySQL.lua',
    "server/modules/**/*.lua",
    'server/esx/**/*.lua'
}