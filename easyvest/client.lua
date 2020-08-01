--------------EasyVest--------------
-------- Made By Dennis9990 --------
----------------V1.1----------------

local given = false -- Don't delete this

 ------------------------- Vests --------------------------------

RegisterNetEvent('vest')
AddEventHandler('vest', function()
    local maleSkin = GetHashKey("mp_m_freemode_01")
    local femaleSkin = GetHashKey("mp_f_freemode_01")
        if GetEntityModel(PlayerPedId()) == maleSkin and given == false then -- If gender is male.
            ShowNotification("You put on your vest.")
	        TriggerEvent("animation")
            Wait(1000)
            givevestm(given)
        elseif GetEntityModel(PlayerPedId()) == femaleSkin and given == false then -- If gender is female.
            ShowNotification("You put on your vest.") 
            TriggerEvent("animation")
            Wait(1000)
            givevestf(given)
        elseif given == true then
            ShowNotification("You took your vest off..")
            TriggerEvent("animation")
            Wait(1000)
            SetPedComponentVariation(GetPlayerPed(-1), 9, 0, 0, 0)
            SetPedArmour(GetPlayerPed(-1), 50)
            given = false
        end
end)

------------------------- Animation --------------------------------

RegisterNetEvent( 'animation' )
AddEventHandler( 'animation', function()
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


function givevestm() -- Gender male
    SetPedComponentVariation(GetPlayerPed(-1), 9, 3, 1, 0) -- Armor ID. Change this however you want this to be.
    SetPedArmour(GetPlayerPed(-1), 100)
    given = true
end

function givevestf() -- Gender female
    SetPedComponentVariation(GetPlayerPed(-1), 9, 6, 2, 0) -- Armor ID. Change this however you want this to be.
    SetPedArmour(GetPlayerPed(-1), 100)
    given = true
end

-- You can choose between a Server notification or a chat message.
function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
  end
  
  function msg(text)
    TriggerEvent("chatMessage", "EasyVest", {255, 4, 1}, text)
end