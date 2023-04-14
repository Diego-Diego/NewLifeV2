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
    'shared/esx/*.lua',
    'shared/scripts/*.lua'
}

client_scripts {
    "modules/RageUI/RMenu.lua",
    "modules/RageUI/menu/RageUI.lua",
    "modules/RageUI/menu/Menu.lua",
    "modules/RageUI/menu/MenuController.lua",
    "modules/RageUI/components/*.lua",
    "modules/RageUI/menu/elements/*.lua",
    "modules/RageUI/menu/items/*.lua",
    "modules/RageUI/menu/panels/*.lua",
    "modules/RageUI/menu/windows/*.lua",

    "client/functions/**/*.lua",
    "client/modules/**/*.lua",
    "client/esx/**/*.lua",
    "client/scripts/**/*.lua",
    "client/modules/main_modules.lua",
}

server_script {
    '@oxmysql/lib/MySQL.lua',
    "server/modules/**/*.lua",
    'server/esx/**/*.lua',
    'server/scripts/**/*.lua'
}

ui_page {
    'html/index.html', 
}

files {
    'html/**/*.*',
}