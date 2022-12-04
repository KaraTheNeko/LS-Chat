fx_version "adamant"
game "gta5"

-- Manifest
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

-- Resource Info
name 'ls-chat'
description 'FiveM Standalone Chat With Changeable Name & Department'
author 'KaraTheNeko'
version '1.0.0'

-- Script
shared_script 'config.lua'

client_scripts {
	'chat/ncc-c.lua',
	'functions.lua'
}
server_script {
	'chat/ncc-s.lua',
	'functions.lua'
}

dependencies {
	'ls-essentials',
	'cc-chat',
	'/onesync'
}