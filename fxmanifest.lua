fx_version 'cerulean'
games { 'gta5' }

shared_scripts {
    '@qb-core/import.lua',
    'lua/shared/sh_*.lua',
}

client_scripts {
    'lua/client/*.lua'
}

server_scripts {
    'lua/server/*.lua',
}

ui_page 'html/index.html'

files {
	'html/index.html',
    'html/app.js',
    'html/img/*.png',
    'html/img/*.jpg',
    'html/css/*.css'
}
