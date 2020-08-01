print("EasyVest Made by Dennis9990")  -- dont remove please

RegisterCommand("vest", function(source, args, raw)
	local player = source 
	if (player > 0) then
		local version = args[1]
		TriggerClientEvent("vest", source,version)
        CancelEvent()
	end
end, false)