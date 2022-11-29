--[[
==============[ ███╗░░██╗░█████╗░░█████╗░██████╗░░█████╗░░█████╗░██╗░░██╗ ]==============|
==============[ ████╗░██║██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║░██╔╝ ]==============|
==============[ ██╔██╗██║██║░░╚═╝██║░░╚═╝██████╔╝███████║██║░░╚═╝█████═╝░ ]==============|
==============[ ██║╚████║██║░░██╗██║░░██╗██╔═══╝░██╔══██║██║░░██╗██╔═██╗░ ]==============|
==============[ ██║░╚███║╚█████╔╝╚█████╔╝██║░░░░░██║░░██║╚█████╔╝██║░╚██╗ ]==============|
==============[ ╚═╝░░╚══╝░╚════╝░░╚════╝░╚═╝░░░░░╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝ ]==============|
                 Made By KyleLee15 (https://github.com/KyleLee15/NCCPack)
]]

local customnames = {}
local customhandles = {}
local customdept = {}


--[[
███╗░░██╗░█████╗░███╗░░░███╗███████╗  ░░░░░░░  ████████╗░██╗░░░░░░░██╗████████╗
████╗░██║██╔══██╗████╗░████║██╔════╝  ░░██╗░░  ╚══██╔══╝░██║░░██╗░░██║╚══██╔══╝
██╔██╗██║███████║██╔████╔██║█████╗░░  ██████╗  ░░░██║░░░░╚██╗████╗██╔╝░░░██║░░░
██║╚████║██╔══██║██║╚██╔╝██║██╔══╝░░  ╚═██╔═╝  ░░░██║░░░░░████╔═████║░░░░██║░░░
██║░╚███║██║░░██║██║░╚═╝░██║███████╗  ░░╚═╝░░  ░░░██║░░░░░╚██╔╝░╚██╔╝░░░░██║░░░
╚═╝░░╚══╝╚═╝░░╚═╝╚═╝░░░░░╚═╝╚══════╝  ░░░░░░░  ░░░╚═╝░░░░░░╚═╝░░░╚═╝░░░░░╚═╝░░░

██████╗░███████╗██╗░░░░░░█████╗░████████╗███████╗██████╗░
██╔══██╗██╔════╝██║░░░░░██╔══██╗╚══██╔══╝██╔════╝██╔══██╗
██████╔╝█████╗░░██║░░░░░███████║░░░██║░░░█████╗░░██║░░██║
██╔══██╗██╔══╝░░██║░░░░░██╔══██║░░░██║░░░██╔══╝░░██║░░██║
██║░░██║███████╗███████╗██║░░██║░░░██║░░░███████╗██████╔╝
╚═╝░░╚═╝╚══════╝╚══════╝╚═╝░░╚═╝░░░╚═╝░░░╚══════╝╚═════╝░]]

if EnableNameChange == true then
	RegisterCommand("name", function(source, args)

		if not args[2] then
			TriggerClientEvent('chatMessage', source, "^*Error: Please enter a first and last name.")
			return
		end
			
		local serverID = source
		local fullname = firstToUpper(args[1]) .. ' ' .. firstToUpper(args[2])
		
		TriggerClientEvent('chatMessage', source, "^*Updated Name: "..fullname)
		customnames[serverID] = fullname	
	end, false)

	RegisterCommand("clearname", function(source, args)
		if customnames[source] then
			TriggerClientEvent('chatMessage', source, "^*Your name has now been reset")
			customnames[source] = false
		else
			TriggerClientEvent('chatMessage', source, "^*You do not have a name to reset")
		end
	end, false)
end





if EnableTwtCommands == true then
	RegisterCommand("twthandle", function(source, args)
		if not args[1] then
			TriggerClientEvent('chatMessage', source, "^*Error: Please enter a valid Twotter username.")
			return
		end
		if args[2] then
			TriggerClientEvent('chatMessage', source, "^*Error: Twotter usernames can not contain spaces.")
			return
		end
		
		local serverID = source
		local fulltwhandle = args[1]
				
		TriggerClientEvent('chatMessage', source, "^*Updated Twotter Username: "..fulltwhandle)
		customhandles[serverID] = fulltwhandle
		TriggerClientEvent("handlechange", -1, customhandles)
	end, false)

	RegisterCommand("clearhandle", function(source, args)
		if customhandles[source] then
			TriggerClientEvent('chatMessage', source, "^*Your Twotter handle has been reset")
			customhandles[source] = false
		else
			TriggerClientEvent('chatMessage', source, "^*You do not have a Twotter handle to reset")
		end
	end, false)
end











































--[[
██████╗░███████╗██████╗░░█████╗░██████╗░████████╗███╗░░░███╗███████╗███╗░░██╗████████╗
██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝████╗░████║██╔════╝████╗░██║╚══██╔══╝
██║░░██║█████╗░░██████╔╝███████║██████╔╝░░░██║░░░██╔████╔██║█████╗░░██╔██╗██║░░░██║░░░
██║░░██║██╔══╝░░██╔═══╝░██╔══██║██╔══██╗░░░██║░░░██║╚██╔╝██║██╔══╝░░██║╚████║░░░██║░░░
██████╔╝███████╗██║░░░░░██║░░██║██║░░██║░░░██║░░░██║░╚═╝░██║███████╗██║░╚███║░░░██║░░░
╚═════╝░╚══════╝╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░░░░╚═╝╚══════╝╚═╝░░╚══╝░░░╚═╝░░░

██████╗░███████╗██╗░░░░░░█████╗░████████╗███████╗██████╗░
██╔══██╗██╔════╝██║░░░░░██╔══██╗╚══██╔══╝██╔════╝██╔══██╗
██████╔╝█████╗░░██║░░░░░███████║░░░██║░░░█████╗░░██║░░██║
██╔══██╗██╔══╝░░██║░░░░░██╔══██║░░░██║░░░██╔══╝░░██║░░██║
██║░░██║███████╗███████╗██║░░██║░░░██║░░░███████╗██████╔╝
╚═╝░░╚═╝╚══════╝╚══════╝╚═╝░░╚═╝░░░╚═╝░░░╚══════╝╚═════╝░]]




if EnableRankChange == true then
	RegisterCommand("rank", function(source, args)
		fullrank = ""
		rankchecker = ""
		if not args[1] then
			TriggerClientEvent('chatMessage', source,"^1^*Invalid Rank, do /ranks <department> to see acceptable ranks.")
			return
		end

		rankchecker = string.upper(args[1])
		-- Shared
		if rankchecker == "CHIEF" then
			fullrank = "Chief"
			local updatedDeptMess
		
		elseif rankchecker == "MAJ" then
			fullrank = "Major"
			local updatedDeptMess
		
		elseif rankchecker == "CMDR" then
			fullrank = "Commander"
			local updatedDeptMess
		
		elseif rankchecker == "CAPT" then
			fullrank = "Captain"
			local updatedDeptMess
		
		elseif rankchecker == "LT" then
			fullrank = "Lieutenant"
			local updatedDeptMess
		
		elseif rankchecker == "SGT" then
			fullrank = "Sergeant"
			local updatedDeptMess
		
		elseif rankchecker == "CPL" then
			fullrank = "Corporal"
			local updatedDeptMess
		-- Department Heads
		elseif rankchecker == "SHERIFF" then
			fullrank = "Sheriff"
			local updatedDeptMess

		elseif rankchecker == "STATEFILLER" then
			fullrank = "STATEFILLER"
			local updatedDeptMess
		-- Sheriff
		elseif rankchecker == "UNDERSHERIFF" then
			fullrank = "Undersheriff"
			local updatedDeptMess

		elseif rankchecker == "CDEP" then
			fullrank = "Chief Deputy"
			local updatedDeptMess
		
		elseif rankchecker == "DFC" then
			fullrank = "Deputy First Class"
			local updatedDeptMess
		
		elseif rankchecker == "DEPUTY" then
			fullrank = "Deputy"
			local updatedDeptMess
		-- State
		elseif rankchecker == "STATEFILLER2" then
			fullrank = "StateFiller2"
			local updatedDeptMess
		-- Police
		elseif rankchecker == "COL" then
			fullrank = "Colonel"
			local updatedDeptMess
		
		elseif rankchecker == "SSGT" then
			fullrank = "Staff Sergeant"
			local updatedDeptMess
		
		elseif rankchecker == "OFC" then
			fullrank = "Officer"
			local updatedDeptMess
		-- Fire
		elseif rankchecker == "ENG" then
			fullrank = "Engineer"
			local updatedDeptMess
		
		elseif rankchecker == "FF" then
			fullrank = "FireFighter"
			local updatedDeptMess
		
		elseif rankchecker == "EMT" then
			fullrank = "EMT"
			local updatedDeptMess
		
		elseif rankchecker == "PM" then
			fullrank = "Paramedic"
			local updatedDeptMess
		
		else
			TriggerClientEvent('chatMessage', source, "^*[Invalid Department] Please choose from the following: SO, PD, HP, Civ or FD.")
			return
		end
		
		updatedDeptMess = TriggerClientEvent('chatMessage', source, "^*Your department has been updated to "..fullrank)


		local serverID = source
			
		customdept[serverID] = fullrank
		TriggerClientEvent("deptchange", -1, customdept)
	end, false)
	RegisterCommand("ranks", function(source, args)
	local dept = tostring(string.upper(args[1]))
		TriggerClientEvent('chatMessage', source,"^1^*Valid ranks are as follows:")
		if dept == "SO" then
			TriggerClientEvent('chatMessage', source,"^7Deputy (DEPUTY), Deputy First Class (DFC), Corporal (CPL), Sergeant (SGT)")
			TriggerClientEvent('chatMessage', source,"^7Lieutenant (LT), Captain (CPT), Commander (CMDR), Major (MAJ)")
			TriggerClientEvent('chatMessage', source,"^7Chief Deputy (CDEP), Undersheriff (UNDERSHERIFF), Sheriff (SHERIFF).")
		elseif dept == "PD" then
			TriggerClientEvent('chatMessage', source,"^7Officer (OFC), Corporal (CPL), Sergeant (SGT), Staff Sergeant (SSGT), Lieutenant (LT), Captain (CPT), Major (MAJ), Chief (CHIEF)")
		elseif dept == "STATE" then
		TriggerClientEvent('chatMessage', source,"^1^*State: NOT DONE.")
		elseif dept == "FIRE" then
		TriggerClientEvent('chatMessage', source,"^7Firefighter (FF), Engineer (ENG), Lieutenant (LT), Captain (CAPT), Chief (CHIEF).")
		elseif dept == "EMS" then
		TriggerClientEvent('chatMessage', source,"^7Emergency Medical Technician (EMT), Paramedic (PM), Lieutenant (LT), Chief (CHIEF).")
		else
		TriggerClientEvent('chatMessage', source,"^1^*Misc: ^7None yet.")
		return
	end
	end, false)
	RegisterCommand("clearrank", function(source, args)
		if customdept[source] then
			TriggerClientEvent('chatMessage', source, "^*Your rank has been cleared.")
			customdept[source] = false
		else
			TriggerClientEvent('chatMessage', source, "^*You do not have a rank to clear.")
		end
	end, false)
end





--[[
░█████╗░██╗░░██╗░█████╗░████████╗  ██████╗░███████╗██╗░░░░░░█████╗░████████╗███████╗██████╗░
██╔══██╗██║░░██║██╔══██╗╚══██╔══╝  ██╔══██╗██╔════╝██║░░░░░██╔══██╗╚══██╔══╝██╔════╝██╔══██╗
██║░░╚═╝███████║███████║░░░██║░░░  ██████╔╝█████╗░░██║░░░░░███████║░░░██║░░░█████╗░░██║░░██║
██║░░██╗██╔══██║██╔══██║░░░██║░░░  ██╔══██╗██╔══╝░░██║░░░░░██╔══██║░░░██║░░░██╔══╝░░██║░░██║
╚█████╔╝██║░░██║██║░░██║░░░██║░░░  ██║░░██║███████╗███████╗██║░░██║░░░██║░░░███████╗██████╔╝
░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░  ╚═╝░░╚═╝╚══════╝╚══════╝╚═╝░░╚═╝░░░╚═╝░░░╚══════╝╚═════╝░]]


if EnableChatCommand == true then
	--Standard Chat
	if EnableStandChat == true then
		AddEventHandler('chatMessage', function(source, name, message)
			if string.sub(message, 1, string.len("/")) ~= "/" then
				local name = customnames[source]
				local dept = customdept[source]
				local stockname = GetPlayerName(source)
				if dept and name then
					TriggerClientEvent("SendProximityMessage", -1, source, ""..dept.."‎ ‎"..name, message)
				elseif name then
					TriggerClientEvent("SendProximityMessage", -1, source, name, message)
				elseif dept then
					TriggerClientEvent("SendProximityMessage", -1, source, ""..dept.."‎ ‎"..stockname, message)
				else
					TriggerClientEvent("SendProximityMessage", -1, source, stockname, message)
				end		
			end
			CancelEvent()
		end)
	end


	
	--/me Command
	if EnableMeChat == true then
		RegisterCommand('me', function(source, args, user)
			local name = customnames[source]
			local dept = customdept[source]
			local stockname = GetPlayerName(source)
			if dept and name then
				TriggerClientEvent("SendProximityMessageMe", -1, source, ""..dept.."‎ ‎"..name, table.concat(args, " "))
			elseif name then
				TriggerClientEvent("SendProximityMessageMe", -1, source, name, table.concat(args, " "))
			elseif dept then
				TriggerClientEvent("SendProximityMessageMe", -1, source, ""..dept.."‎ ‎"..stockname, table.concat(args, " "))
			else
				TriggerClientEvent("SendProximityMessageMe", -1, source, GetPlayerName(source), table.concat(args, " "))
			end
		end, false)
	end

		--/twt Command
	if EnableTwtCommands == true then
		RegisterCommand('twt', function(source, args, user)
			local name = customhandles[source]
			if name then
			TriggerClientEvent('chatMessage', -1, "^*[Twotter] @" .. name .. "^r", {4, 196, 255}, table.concat(args, " "))
			else
				TriggerClientEvent('chatMessage', source, "^*Please create Twotter account \"/twthandle {username}\"")
			end
		end, false)
	end

	--/ooc Command
	if EnableOOCChat == true then
		RegisterCommand('ooc', function(source, args, user)
			local name = customnames[source]
			local dept = customdept[source]
			local stockname = GetPlayerName(source)
			if dept and name then
			TriggerClientEvent('chatMessage', -1, ""..dept.."‎ ‎"..name, {4, 134, 255}, table.concat(args, " "))
			elseif name then
				TriggerClientEvent('chatMessage', -1, name , {4, 134, 255}, table.concat(args, " "))
			elseif dept then
				TriggerClientEvent('chatMessage', -1, ""..dept.."‎ ‎"..stockname, {4, 134, 255}, table.concat(args, " "))
			else 
			TriggerClientEvent('chatMessage', -1, GetPlayerName(source), {4, 134, 255}, table.concat(args, " "))
			end
		end, false)
	end

	--/dw Command
	if EnableDwChat == true then
		RegisterCommand('dw', function(source, args, user)
			TriggerClientEvent('chatMessage', -1, "^8^*[^*Dark Web] @^*Anonymous^r", {0, 0, 0}, table.concat(args, " "))
		end, false)
	end
end
-------------------------------------------------------------------------------

if EnableChatCommand == true then

	--String Splitting																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																									
	function stringsplit(inputstr, sep)
		if sep == nil then
			sep = "%s"
		end
		local t={} ; i=1
		for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
			t[i] = str
			i = i + 1
		end
		return t
	end
end

-------------------------------------------------------------------------------



print [[NCCPack (1.0.1) Has been successfully started!
Made By KyleLee15 (https://github.com/KyleLee15/NCCPack)]]
