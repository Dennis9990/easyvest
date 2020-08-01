--------------EasyVest--------------
-------- Made By Dennis9990 --------
----------------V1.1----------------

local given = false -- Don't delete this
local maleSkin = GetHashKey('mp_m_freemode_01') -- Don't delete this
local femaleSkin = GetHashKey('mp_f_freemode_01') -- Don't delete this

 ------------------------- Vests --------------------------------

RegisterNetEvent('vest')
AddEventHandler('vest', function(version)
    light = version == "light"
    medium = version == "medium"
    heavy = version == "heavy"
    if version == nil and not given then
        msg("Use /vest light, medium or heavy.")
    end
        if light and GetEntityModel(PlayerPedId()) == maleSkin and given == false then -- If gender is male and vest type is light.
            lightm(given)
        elseif medium and GetEntityModel(PlayerPedId()) == maleSkin and given == false then -- If gender is male and vest type is medium.
            mediumm(given)
        elseif heavy and GetEntityModel(PlayerPedId()) == maleSkin and given == false then -- If gender is male and vest type is heavy.
            heavym(given)
        elseif light and GetEntityModel(PlayerPedId()) == femaleSkin and given == false then -- If gender is female and vest type is light.
            lightf(given)
        elseif medium and GetEntityModel(PlayerPedId()) == femaleSkin and given == false then -- If gender is female and vest type is medium.
            mediumf(given)
        elseif heavy and GetEntityModel(PlayerPedId()) == femaleSkin and given == false then -- If gender is female and vest type is heavy.
            heavyf(given)
        elseif version == nil and given == true then -- If removing vest.
            rvest(given)
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

function lightm() -- Light vest Gender male
    ShowNotification("You put on your vest.")
    TriggerEvent("animation")
    Wait(1000)
    SetPedComponentVariation(GetPlayerPed(-1), 9, 7, 2, 0) -- Armor ID. Change this however you want this to be.
    SetPedArmour(GetPlayerPed(-1), 25)
    given = true
end

function lightf() -- Light vest Gender female
    ShowNotification("You put on your vest.") 
    TriggerEvent("animation")
    Wait(1000)
    SetPedComponentVariation(GetPlayerPed(-1), 9, 4, 0, 0) -- Armor ID. Change this however you want this to be.
    SetPedArmour(GetPlayerPed(-1), 25)
    given = true
end

function mediumm() -- Medium vest Gender male
    ShowNotification("You put on your vest.")
    TriggerEvent("animation")
    Wait(1000)
    SetPedComponentVariation(GetPlayerPed(-1), 9, 7, 3, 0) -- Armor ID. Change this however you want this to be.
    SetPedArmour(GetPlayerPed(-1), 50)
    given = true
end

function mediumf() -- Medium vest Gender female
    ShowNotification("You put on your vest.") 
    TriggerEvent("animation")
    Wait(1000)
    SetPedComponentVariation(GetPlayerPed(-1), 9, 6, 3, 0) -- Armor ID. Change this however you want this to be.
    SetPedArmour(GetPlayerPed(-1), 50)
    given = true
end

function heavym() -- Heavy vest Gender male
    ShowNotification("You put on your vest.")
    TriggerEvent("animation")
    Wait(1000)
    SetPedComponentVariation(GetPlayerPed(-1), 9, 3, 1, 0) -- Armor ID. Change this however you want this to be.
    SetPedArmour(GetPlayerPed(-1), 100)
    given = true
end

function heavyf() -- Heavy vest Gender female
    ShowNotification("You put on your vest.") 
    TriggerEvent("animation")
    Wait(1000)
    SetPedComponentVariation(GetPlayerPed(-1), 9, 4, 0, 0) -- Armor ID. Change this however you want this to be.
    SetPedArmour(GetPlayerPed(-1), 100)
    given = true
end

function rvest() -- removes vest
    ShowNotification("You took your vest off..")
    TriggerEvent("animation")
    Wait(1000)
    SetPedComponentVariation(GetPlayerPed(-1), 9, 0, 0, 0)
    SetPedArmour(GetPlayerPed(-1), 0)
    given = false
end

function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
  end
  
  function msg(text)
    TriggerEvent("chatMessage", "EasyVest", {255, 4, 1}, text)
end