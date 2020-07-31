print("EasyVest Made by Dennis9990")  -- dont remove please

RegisterCommand("vest", function(source, args, raw)
	local player = source 
	if (player > 0) then
		TriggerClientEvent("vest", source)
        CancelEvent()
	end
end, false)