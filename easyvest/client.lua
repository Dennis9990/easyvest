--------------EasyVest--------------
---------- Made By Sinned ----------
----------------V1.0----------------

given = false

 ------------------------- Events --------------------------------

RegisterNetEvent('vest')
AddEventHandler('vest', function()
	if given == false then
    ShowNotification("You put on your vest.")  -- ShowNotification or msg("message")
	TriggerEvent("EindBaas:vest") -- Trigger Animation.
	Wait(1000)
    local ped = GetPlayerPed(PlayerId())
    SetPedComponentVariation(GetPlayerPed(-1), 9, 3, 1, 0) -- Armor ID. Change this however you want this to be.
    SetPedArmour(GetPlayerPed(-1), 100)
	elseif given == true then
		ShowNotification("You already have a vest on.") -- ShowNotification or msg("message")
	end
end)

RegisterNetEvent('rvest')
AddEventHandler('rvest', function()
	if given == true then
	ShowNotification("You took your vest off.") -- ShowNotification or msg("message")
	TriggerEvent("EindBaas:vest") -- Trigger Animation.
	Wait(1000)
    local ped = GetPlayerPed(PlayerId())
    SetPedComponentVariation(GetPlayerPed(-1), 9, 0, 0, 0) -- Armor ID. Change this however you want this to be.
    SetPedArmour(GetPlayerPed(-1), 50)
	elseif given == false then
		ShowNotification("You are not wearing a vest.") -- ShowNotification or msg("message")
	end
end)

 ------------------------- Commands --------------------------------
 
RegisterCommand("vest", function()
	TriggerEvent("vest") -- Trigger Event
	given  = true
end, false)



RegisterCommand("rvest", function()
	TriggerEvent("rvest") -- Trigger Event
	given = false
end, false)



------------------------- Animation --------------------------------

RegisterNetEvent( 'EindBaas:vest' )
AddEventHandler( 'EindBaas:vest', function()
    local ped = GetPlayerPed(-1)
    if not IsEntityPlayingAnim(ped, "anim@narcotics@trash", "drop_front", 3) then
        RequestAnimDict("anim@narcotics@trash")
        while not HasAnimDictLoaded("anim@narcotics@trash") do
            Citizen.Wait(100)
        end
        TaskPlayAnim(ped, "anim@narcotics@trash", "drop_front", 0.9, -8, 1900, 49, 3.0, 0, 0, 0)
        Wait(2000)
        while IsEntityPlayingAnim(ped, "anim@narcotics@trash", "drop_front", 3) do
            Wait(1)
            if (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
                ClearPedTasksImmediately(ped)
                break
            end
        end
    end
end)

--------------------------------------------------------------------
--Change these values in the Animation section to whatever animation you want. Full animation list https://wiki.gtanet.work/index.php?title=Animations
--AnimDict = anim@narcotics@trash
--AnimName = drop_front

------------------------- Functions --------------------------------

-- You can choose between a Server notification or a chat message.
function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
  end
  
  function msg(text)
    TriggerEvent("chatMessage", "EasyVest", {255, 4, 1}, text) -- You can change "Armor" to whatever you want.
end
