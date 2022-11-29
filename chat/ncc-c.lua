--[[
==============[ ███╗░░██╗░█████╗░░█████╗░██████╗░░█████╗░░█████╗░██╗░░██╗ ]==============|
==============[ ████╗░██║██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║░██╔╝ ]==============|
==============[ ██╔██╗██║██║░░╚═╝██║░░╚═╝██████╔╝███████║██║░░╚═╝█████═╝░ ]==============|
==============[ ██║╚████║██║░░██╗██║░░██╗██╔═══╝░██╔══██║██║░░██╗██╔═██╗░ ]==============|
==============[ ██║░╚███║╚█████╔╝╚█████╔╝██║░░░░░██║░░██║╚█████╔╝██║░╚██╗ ]==============|
==============[ ╚═╝░░╚══╝░╚════╝░░╚════╝░╚═╝░░░░░╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝ ]==============|
                 Made By KyleLee15 (https://github.com/KyleLee15/NCCPack)
]]

-- Persona Name (Client)
if EnableNameChange == true then
	local customnames = {}

	Citizen.CreateThread(function()
		while not NetworkIsPlayerActive(PlayerId()) do
			Citizen.Wait(0)
		end
		TriggerServerEvent("getcustomnames")
	end)

	RegisterNetEvent("namechange")
	AddEventHandler("namechange", function(names)

		customnames = names

	end)

	function GetCustomNames()
		return customnames
	end
end

if EnableTwtCommands == true then
	-- Twotter Handle
	local customhandles = {}

	Citizen.CreateThread(function()
		while not NetworkIsPlayerActive(PlayerId()) do
			Citizen.Wait(0)
		end
		TriggerServerEvent("getcustomhandles")
	end)

	RegisterNetEvent("handlechange")
	AddEventHandler("handlechange", function(names)

		customhandles = handles

	end)

	function GetCustomHandles()
		return customhandles
	end
end

-- Department
if EnableRankChange == true then
	local customdept = {}

	Citizen.CreateThread(function()
		while not NetworkIsPlayerActive(PlayerId()) do
			Citizen.Wait(0)
		end
		TriggerServerEvent("depthandles")
	end)

	RegisterNetEvent("deptchange")
	AddEventHandler("deptchange", function(names)

		customa = depts

	end)

	function GetCustomDepts()
		return GetCustomDepts
	end
end



if EnableChatSuggestions == true then
	Citizen.CreateThread(function()
		if EnableRankChange == true then
			TriggerEvent('chat:addSuggestion', '/rank', 'Set your rank.', {
				{ name="Rank" }
			})
			TriggerEvent('chat:addSuggestion', '/ranks', 'List acceptable ranks.', {
				{ name="Department", help="SO/PD/State/Fire/EMS"}
			})
			TriggerEvent('chat:addSuggestion', '/clearrank', 'Clears your active department. (Client Sided)')
		end

		if EnableTwtCommands == true then
			TriggerEvent('chat:addSuggestion', '/twthandle', '', {
				{ name="Twotter Handle", help=""}
			})
			TriggerEvent('chat:addSuggestion', '/clearhandle', 'Clears your active twotter handle. (Client Sided)')
		end

		if EnableNameChange == true then
			TriggerEvent('chat:addSuggestion', '/name', '', {
				{ name="firstname lastname", help=""}
			})
			TriggerEvent('chat:addSuggestion', '/clearname', 'Clears your active name. (Client Sided)')
		end

		if EnableOOCChat == true then
			TriggerEvent('chat:addSuggestion', '/ooc', 'Out Of Character chat Message.')
		end

		if EnableMeChat == true then
			TriggerEvent('chat:addSuggestion', '/me', 'Send message in the third person. (Proximity Chat)', {
				{ name="Message", help="message."}
			})
		end
		
		if EnableTwtCommands == true then
			TriggerEvent('chat:addSuggestion', '/twt', 'Send a Twotter in game. (Global Chat)', {
				{ name="Message", help="Twotter Message."}
			})
		end

		if EnableDwChat == true then
			TriggerEvent('chat:addSuggestion', '/dw', 'Send a anonymous message in game. (Global Chat)', {
				{ name="Message", help="Anonymous Message."}
			})
		end

		if EnableClearCommand == true then
			TriggerEvent('chat:addSuggestion', '/clear', 'Clears all messages in your chat. (Client Sided)')
		end
	end)
end

if EnableStandChat == true then
	--Standard Chat
	RegisterNetEvent('SendProximityMessage')
	AddEventHandler('SendProximityMessage', function(id, name, message)
	  local myID = PlayerId()
	  local pID = GetPlayerFromServerId(id)
	  if pID == myID then
		TriggerEvent('chatMessage', "^r" .. name .. " (#"..id..")", {128, 128, 128}, "^r " .. message)
	  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myID)), GetEntityCoords(GetPlayerPed(pID)), true) < 19.999 then
		TriggerEvent('chatMessage', "^r" .. name .. " (#"..id..")", {128, 128, 128}, "^r " .. message)
	  end
	end)
end

if EnableMeChat == true then
	--/me Command
	RegisterNetEvent('SendProximityMessageMe')
	AddEventHandler('SendProximityMessageMe', function(id, name, message)
	  local myID = PlayerId()
	  local pID = GetPlayerFromServerId(id)
	  if pID == myID then
		TriggerEvent('chatMessage', "", {255, 0, 0}, " ^3 > ^7 " .. name .." (#"..id.."): ".."^r " .. message)
	  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myID)), GetEntityCoords(GetPlayerPed(pID)), true) < 19.999 then
		TriggerEvent('chatMessage', "", {255, 0, 0}, " ^3 > ^7 " .. name .." (#"..id.."): ".."^r " .. message)
	  end
	end)
end



if EnableClearCommand == true then
	RegisterCommand('clear', function(source, args)
		TriggerEvent('chat:clear')
	end, false)
end