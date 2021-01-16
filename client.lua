--------------------------------------------TOPLAMA--------------------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Wait(5)

		local PlayerPos = GetEntityCoords(PlayerPedId())
		
		if IsControlJustPressed(1, 38) and IsPedInAnyVehicle(GetPlayerPed(-1), false) ~= 1 then
			if GetDistanceBetweenCoords(PlayerPos, 2221.7973632813,5577.0966796875,53.844783782959, true) <= 10 then		
				TaskStartScenarioInPlace(PlayerPedId(), 'world_human_gardener_plant', -1, false)
				local finished = exports["xx-taskbar"]:taskBar(7500,"Ot Topluyorsun",false,false) 
				if (finished == 100) then
					TriggerServerEvent("kcdd_weed:test")
				end
			end	
		end
	end
end)
--------------------------------------------UFALAMA--------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('kcdd_weed:ufala')
AddEventHandler('kcdd_weed:ufala', function()
	TriggerEvent("animation:ufala")
	local finished = exports["xx-taskbar"]:taskBar(7500,"Ufalıyorsun",false,false) 
	if (finished == 100) then
		TriggerServerEvent("kcdd:ufala")
	end
end)
------------------------------------------------------------------------Kurutma------------------------------------------------------------------------
RegisterNetEvent('kcdd_weed:kurut')
AddEventHandler('kcdd_weed:kurut', function()
	local PlayerPos = GetEntityCoords(PlayerPedId())
	if GetDistanceBetweenCoords(PlayerPos, 3824.611, 4442.358, 2.8053, true) <= 15 then					
		TriggerEvent("animation:kurut")
		local finished = exports["xx-taskbar"]:taskBar(7500,"Kurutuyorsun",false,false) 
		if (finished == 100) then
			TriggerServerEvent("kcdd:kurut")
		end
	end
end)
----------------------------------------------Sarma----------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('kcdd_weed:sar')
AddEventHandler('kcdd_weed:sar', function()
	local finished = exports["xx-taskbar"]:taskBar(7500,"Sarıyorsun",false,false) 
	if (finished == 100) then
		TriggerServerEvent("kcdd_weed:sar")
	end

end)
--------------------------------------------ANİMATİON--------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('animation:ufala')
AddEventHandler('animation:ufala', function()
	inanimation = true
	local lPed = GetPlayerPed(-1)
	RequestAnimDict("amb@prop_human_parking_meter@male@base")
	while not HasAnimDictLoaded("amb@prop_human_parking_meter@male@base") do
		Citizen.Wait(0)
	end
	
	if IsEntityPlayingAnim(lPed, "amb@prop_human_parking_meter@male@base", "base", 3) then
		ClearPedSecondaryTask(lPed)
	else
		TaskPlayAnim(lPed, "amb@prop_human_parking_meter@male@base", "base", 8.0, -8, -1, 49, 0, 0, 0, 0)
		seccount = 4
		while seccount > 0 do
			Citizen.Wait(2000)
			seccount = seccount - 1
		end
		ClearPedSecondaryTask(lPed)
	end		
	inanimation = false
end)

RegisterNetEvent('animation:kurut')
AddEventHandler('animation:kurut', function()
	inanimation = true
	local lPed = GetPlayerPed(-1)
	RequestAnimDict("amb@world_human_cop_idles@female@idle_b")
	while not HasAnimDictLoaded("amb@world_human_cop_idles@female@idle_b") do
		Citizen.Wait(0)
	end
	
	if IsEntityPlayingAnim(lPed, "amb@world_human_cop_idles@female@idle_b", "idle_d", 3) then
		ClearPedSecondaryTask(lPed)
	else
		TaskPlayAnim(lPed, "amb@world_human_cop_idles@female@idle_b", "idle_d", 8.0, -8, -1, 49, 0, 0, 0, 0)
		seccount = 4
		while seccount > 0 do
			Citizen.Wait(2000)
			seccount = seccount - 1
		end
		ClearPedSecondaryTask(lPed)
	end		
	inanimation = false
end)

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 

RegisterNetEvent('armor:slow')
AddEventHandler('armor:slow', function()
	local ped = PlayerPedId()
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING_POT", 0, 1)
	exports["np-taskbar"]:taskBar(5000, "Ot İçiyorsun")
	ClearPedTasksImmediately(ped)
    local count = 12
    while count > 0 do
        Citizen.Wait(1000)
        count = count - 1
        SetPedArmour(PlayerPedId(), GetPedArmour(PlayerPedId()) + 3) 
    end
end)
