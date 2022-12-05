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
local customads = {}
local anontwt = {}

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
		exports.ls-essentials:sendDiscord('Chat', GetPlayerName(source).. " set their name to **" ..fullname.. "**.")
		customnames[serverID] = fullname	
	end, false)

	RegisterCommand("clearname", function(source, args)
		if customnames[source] then
			TriggerClientEvent('chatMessage', source, "^*Your name has now been reset")
			customnames[source] = false
		else
			TriggerClientEvent('chatMessage', source, "^*You do not have a name to reset")
			exports.ls-essentials:sendDiscord('Chat', GetPlayerName(source).. " reset their name.")
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
			exports.ls-essentials:sendDiscord('Chat', GetPlayerName(source).. " set their twotter handle to **" ..fulltwhandle.. "**.")
		customhandles[serverID] = fulltwhandle
		TriggerClientEvent("handlechange", -1, customhandles)
	end, false)

	RegisterCommand("clearhandle", function(source, args)
		if customhandles[source] then
			TriggerClientEvent('chatMessage', source, "^*Your Twotter handle has been reset")
			exports.ls-essentials:sendDiscord('Chat', GetPlayerName(source).. " reset their twotter handle.")
			customhandles[source] = false
		else
			TriggerClientEvent('chatMessage', source, "^*You do not have a Twotter handle to reset")
		end
	end, false)
end

if EnableAdvertisement == true then
	RegisterCommand("adname", function(source, args)
		if not args[1] then
			TriggerClientEvent('chatMessage', source, "^*Error: Please enter a valid name.")
			return
		end
		
		local serverID = source
		local fulladname = table.concat(args, " ")
				
		TriggerClientEvent('chatMessage', source, "^*Updated Ad Title: "..fulladname)
		exports.ls-essentials:sendDiscord('Chat', GetPlayerName(source).. " set their ad name to **" ..fulladname.. "**.")
		customads[serverID] = fulladname
		TriggerClientEvent("adchange", -1, customads)
	end, false)

	RegisterCommand("clearhandle", function(source, args)
		if customads[source] then
			TriggerClientEvent('chatMessage', source, "^*Your Ad name has been reset")
			exports.ls-essentials:sendDiscord('Chat', GetPlayerName(source).. " reset their ad name.")
			customads[source] = false
		else
			TriggerClientEvent('chatMessage', source, "^*You do not have a Ad name to reset")
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
		
		elseif rankchecker == "COL" then
			fullrank = "Colonel"
			local updatedDeptMess
		
		elseif rankchecker == "SSGT" then
			fullrank = "Staff Sergeant"
			local updatedDeptMess
		
		-- Department Heads
		elseif rankchecker == "SHERIFF" then
			fullrank = "Sheriff"
			local updatedDeptMess

		elseif rankchecker == "SUPINT" then
			fullrank = "Superintendent"
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
		elseif rankchecker == "MSTTRP" then
			fullrank = "Master Trooper"
			local updatedDeptMess
			
		elseif rankchecker == "TRP" then
			fullrank = "Trooper"
			local updatedDeptMess
			
		-- Police
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
		--[[ Subdivisions ]]
		-- CIU
		elseif rankchecker == "DET" then
			fullrank = "Detective"
			local updatedDeptMess
		
		elseif rankchecker == "LDET" then
			fullrank = "Lead Detective"
			local updatedDeptMess
		
		elseif rankchecker == "CST" then
			fullrank = "CST"
			local updatedDeptMess
		
		elseif rankchecker == "SPC" then
			fullrank = "Specialist"
			local updatedDeptMess
		
		
		
		else
			TriggerClientEvent('chatMessage', source,"^1^*Invalid Rank, do /ranks <department> to see acceptable ranks.")
			return
		end
		
		updatedDeptMess = TriggerClientEvent('chatMessage', source, "^*Your department has been updated to "..fullrank) exports.ls-essentials:sendDiscord('Chat', GetPlayerName(source).. " set their rank to **" ..fullrank.. "**.")


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
			exports.ls-essentials:sendDiscord('Chat', GetPlayerName(source).. " cleared their rank.")
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
				exports.ls-essentials:sendDiscord(dept.."‎ ‎"..name.." ("..GetPlayerName(source)..")".." (ID: "..source..")", "**/me:** "..table.concat(args, " "))
			elseif name then
				TriggerClientEvent("SendProximityMessageMe", -1, source, name, table.concat(args, " "))
				exports.ls-essentials:sendDiscord(name.." ("..GetPlayerName(source)..")".." (ID: "..source..")", "**/me:** "..table.concat(args, " "))
			elseif dept then
				TriggerClientEvent("SendProximityMessageMe", -1, source, ""..dept.."‎ ‎"..stockname, table.concat(args, " "))
				exports.ls-essentials:sendDiscord(dept.." " ..stockname.." (ID: "..source..")", "**/me:** "..table.concat(args, " "))
			else
				TriggerClientEvent("SendProximityMessageMe", -1, source, GetPlayerName(source), table.concat(args, " "))
				exports.ls-essentials:sendDiscord(GetPlayerName(source).." (ID: "..source..")", "**/me:** "..table.concat(args, " "))
			end
		end, false)
	end

		--/twt Command
	if EnableTwtCommands == true then
		RegisterCommand('twt', function(source, args, user)
		if args[1] then
			local name = customhandles[source]
			if name then
			--TriggerClientEvent('chatMessage', -1, "^*[Twotter] @" .. name .. "^r", {4, 196, 255}, table.concat(args, " "))
			exports.ls-essentials:sendDiscord(GetPlayerName(source).." (ID: "..source..")", "**[Twotter]** @" .. name ..": ".. table.concat(args, " "))
			TriggerClientEvent('chat:addMessage', -1 , {
					templateId =  'ccChat',
					multiline =  false,
					args = {
					'#1DA1F2',
					'fa-sharp fa-solid fa-dove',
					name,
					'',
					table.concat(args, " ")
				}})	
			else
				TriggerClientEvent('chatMessage', source, "^*Please create Twotter account \"/twthandle {username}\"")
			end
		end
		end, false)
	end
	
		--/ad Command
	if EnableAdvertisement == true then
		RegisterCommand('ad', function(source, args, user)
		if args[1] then
			local name = customads[source]
			if name then
			--TriggerClientEvent('chatMessage', -1, "^*[Advertisement] @" .. name .. "^r", {4, 196, 255}, table.concat(args, " "))
			exports.ls-essentials:sendDiscord(GetPlayerName(source).." (ID: "..source..")", "**[Advertisement]** " .. name ..": ".. table.concat(args, " "))
				TriggerClientEvent('chat:addMessage', -1 , {
					templateId =  'ccChat',
					multiline =  false,
					args = {
					'#FFFF00',
					'fa-sharp fa-solid fa-city',
					name,
					'',
					table.concat(args, " ")
				}})	
			else
			TriggerClientEvent('chatMessage', source, "^*Please set your Advertisement Name /adname (name).")
			end
		end
		end, false)
	end
	--/ooc Command
	if EnableOOCChat == true then
		RegisterCommand('ooc', function(source, args, user)
		if args[1] then
			local name = customnames[source]
			local dept = customdept[source]
			local stockname = GetPlayerName(source)
			if dept and name then
			--TriggerClientEvent('chatMessage', -1, ""..dept.."‎ ‎"..name, {4, 134, 255}, table.concat(args, " "))
				TriggerClientEvent('chat:addMessage', -1 , {
					templateId =  'ccChat',
					multiline =  false,
					args = {
					'#e74c3c',
					'fa-solid fa-user',
					dept.."‎ ‎"..name,
					'',
					table.concat(args, " ")
				}})	
			exports.ls-essentials:sendDiscord(dept.."‎ ‎"..name.." ("..GetPlayerName(source)..")".." (ID: "..source..")", "**/ooc:** "..table.concat(args, " "))
			elseif name then
				--TriggerClientEvent('chatMessage', -1, name , {4, 134, 255}, table.concat(args, " "))
				TriggerClientEvent('chat:addMessage', -1 , {
					templateId =  'ccChat',
					multiline =  false,
					args = {
					'#e74c3c',
					'fa-solid fa-user',
					name,
					'',
					table.concat(args, " ")
				}})	
				exports.ls-essentials:sendDiscord(name.." ("..GetPlayerName(source)..")".." (ID: "..source..")", "**/ooc:** "..table.concat(args, " "))
			elseif dept then
				--TriggerClientEvent('chatMessage', -1, ""..dept.."‎ ‎"..stockname, {4, 134, 255}, table.concat(args, " "))
				TriggerClientEvent('chat:addMessage', -1 , {
					templateId =  'ccChat',
					multiline =  false,
					args = {
					'#e74c3c',
					'fa-solid fa-user',
					dept.." "..stockname,
					'',
					table.concat(args, " ")
				}})	
				exports.ls-essentials:sendDiscord(dept.." " ..stockname.." (ID: "..source..")", "**/ooc:** "..table.concat(args, " "))
			else 
			--TriggerClientEvent('chatMessage', -1, GetPlayerName(source), {4, 134, 255}, table.concat(args, " "))
			TriggerClientEvent('chat:addMessage', -1 , {
					templateId =  'ccChat',
					multiline =  false,
					args = {
					'#e74c3c',
					'fa-solid fa-user',
					GetPlayerName(source),
					'',
					table.concat(args, " ")
				}})	
			exports.ls-essentials:sendDiscord(GetPlayerName(source).." (ID: "..source..")", "**/ooc:** "..table.concat(args, " "))
			end
		end
		end, false)
	end

	--/dw Command
	if EnableDwChat == true then
		RegisterCommand('dw', function(source, args, user)
			--TriggerClientEvent('chatMessage', -1, "^8^*[^*Dark Web] @^*Anonymous^r", {0, 0, 0}, table.concat(args, " "))
			if args[1] then
			TriggerClientEvent('chat:addMessage', -1 , {
					templateId =  'ccChat',
					multiline =  false,
					args = {
					'#FF0000',
					'fa-sharp fa-solid fa-cloud',
					'^8^*[^*Dark Web]',
					'',
					'@^*Anonymous^r '..table.concat(args, " ")
			}})	
			exports.ls-essentials:sendDiscord(GetPlayerName(source).." (ID: "..source..")", "**[Dark Web]** *@Anonymous*: ".. table.concat(args, " "))
			end
		end, false)
	end
	--/anontwt
	if EnableAnonTwt == true then
	RegisterCommand('anontwt', function(source, args, user)
	if args[1] then
		if anontwt[source] then
			TriggerClientEvent('chat:addMessage', -1 , {
					templateId =  'ccChat',
					multiline =  false,
					args = {
					'#1DA1F2',
					'fa-sharp fa-solid fa-dove',
					anontwt[source],
					'',
					table.concat(args, " ")
			}})	
		exports.ls-essentials:sendDiscord(GetPlayerName(source).." (ID: "..source..")", "**[Twotter]** @" .. anontwt[source] ..": ".. table.concat(args, " "))
		else
		TriggerClientEvent('chatMessage', source, "~r~First do /ganontwt to generate an anonymous username.")
		end end end, false)
		RegisterCommand('ganontwt', function (source, args, user)
			local serverID = source
			local fillanon = randomString(6)
			anontwt[serverID] = fillanon
			TriggerClientEvent("anonchange", -1, anontwt)
			TriggerClientEvent('chatMessage', source, "~g~Anontwt Username set to "..fillanon)
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


local charset = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890"
math.randomseed(os.clock())
function randomString(length)
	local ret = {}
	local r
	for i = 1, length do
		r = math.random(1, #charset)
		table.insert(ret, charset:sub(r, r))
	end
	return table.concat(ret)
end

-------------------------------------------------------------------------------



print [[NCCPack (1.0.1) Has been successfully started!
Made By KyleLee15 (https://github.com/KyleLee15/NCCPack)]]
exports.ls-essentials:sendDiscord("SYSTEM", "Chat hook started.")