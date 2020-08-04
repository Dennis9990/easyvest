--------------EasyVest--------------
-------- Made By Dennis9990 --------
----------------V1.4----------------

local given = false -- Don't delete this
local maleSkin = GetHashKey('mp_m_freemode_01') -- Don't delete this
local femaleSkin = GetHashKey('mp_f_freemode_01') -- Don't delete this
local currentvest = nil -- Don't delete this

 ----------------------- Vests Event -----------------------------

RegisterNetEvent('vest')
AddEventHandler('vest', function(version)
    light = version == "light"
    medium = version == "medium"
    heavy = version == "heavy"
    if version == nil and not given then
        msg("Use /vest light, medium or heavy.")
    end
        if light and not given then -- If vest type is light.
            typelight(given)
            elseif medium and currentvest == 'light'and given then
                typemedium(given)
            elseif heavy and currentvest == 'light' and given then
                typeheavy(given)
        elseif medium and not given then -- If vest type is medium.
            typemedium(given)
            elseif light and currentvest == 'medium' and given then
                typelight(given)
            elseif heavy and currentvest == 'medium' and given then
                typeheavy(given)
        elseif heavy and not given then -- If vest type is heavy.
            typeheavy(given)
            elseif light and currentvest == 'heavy' and given then
                typelight(given)
            elseif medium and currentvest == 'heavy' and given then
                typemedium(given)
        elseif version == nil and given then -- If removing vest.
            rvest(given)
        end
end)

----------------------- Animation Event ----------------------------

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

function typelight() -- Light vest
    male = GetEntityModel(PlayerPedId()) == maleSkin
    female = GetEntityModel(PlayerPedId()) == femaleSkin
    if male then -- if gender is male
        ShowNotification("You put on your light vest.")
        TriggerEvent("animation")
        Wait(1000)
        SetPedComponentVariation(GetPlayerPed(-1), 9, 7, 2, 0) -- Armor ID. Change this however you want this to be.
        SetPedArmour(GetPlayerPed(-1), 25)
        given = true
        currentvest = 'light'
    elseif female then -- if gender is female
        ShowNotification("You put on your light vest.") 
        TriggerEvent("animation")
        Wait(1000)
        SetPedComponentVariation(GetPlayerPed(-1), 9, 6, 2, 0) -- Armor ID. Change this however you want this to be.
        SetPedArmour(GetPlayerPed(-1), 25)
        given = true
        currentvest = 'light'
    end
end


function typemedium() -- Medium vest
    male = GetEntityModel(PlayerPedId()) == maleSkin
    female = GetEntityModel(PlayerPedId()) == femaleSkin
    if male then -- if gender is male
        ShowNotification("You put on your medium vest.")
        TriggerEvent("animation")
        Wait(1000)
        SetPedComponentVariation(GetPlayerPed(-1), 9, 7, 3, 0) -- Armor ID. Change this however you want this to be.
        SetPedArmour(GetPlayerPed(-1), 50)
        given = true
        currentvest = 'medium'
    elseif female then --  if gender is female
        ShowNotification("You put on your medium vest.") 
        TriggerEvent("animation")
        Wait(1000)
        SetPedComponentVariation(GetPlayerPed(-1), 9, 6, 3, 0) -- Armor ID. Change this however you want this to be.
        SetPedArmour(GetPlayerPed(-1), 50)
        given = true
        currentvest = 'medium'
    end
end


function typeheavy() -- Heavy vest
    male = GetEntityModel(PlayerPedId()) == maleSkin
    female = GetEntityModel(PlayerPedId()) == femaleSkin
    if male then --  if gender is male
        ShowNotification("You put on your heavy vest.")
        TriggerEvent("animation")
        Wait(1000)
        SetPedComponentVariation(GetPlayerPed(-1), 9, 3, 1, 0) -- Armor ID. Change this however you want this to be.
        SetPedArmour(GetPlayerPed(-1), 100)
        given = true
        currentvest = 'heavy'
    elseif female then -- if gender is female
        ShowNotification("You put on your heavy vest.") 
        TriggerEvent("animation")
        Wait(1000)
        SetPedComponentVariation(GetPlayerPed(-1), 9, 4, 0, 0) -- Armor ID. Change this however you want this to be.
        SetPedArmour(GetPlayerPed(-1), 100)
        given = true
        currentvest = 'heavy'
    end
end


function rvest() -- removes vest
    ShowNotification("You took your vest off.")
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