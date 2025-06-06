--[[ ====================================================== ]] --
--[[         MH Vehicle Sabotage Script by MaDHouSe         ]] --
--[[ ====================================================== ]] --
fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'MaDHouSe'
description 'MH Brakes - Sabotage vehicle brakelines.'
version '1.0.0'

shared_scripts {'@ox_lib/init.lua', 'locales/locale.lua', 'locales/en.lua', 'locales/*.lua'}
client_scripts {'client/main.lua'}
server_scripts {'@oxmysql/lib/MySQL.lua', 'server/sv_config.lua', 'server/main.lua', 'server/update.lua'}

dependencies {'oxmysql', 'ox_lib'}