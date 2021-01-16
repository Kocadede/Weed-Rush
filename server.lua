ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('wet', function(source)
	TriggerClientEvent('kcdd_weed:ufala', source)
end)

ESX.RegisterUsableItem('weedbod', function(source)
	TriggerClientEvent('kcdd_weed:kurut', source)
end)

ESX.RegisterUsableItem('weedbud', function(source)
    TriggerClientEvent('kcdd_weed:sar', source)
end)

ESX.RegisterUsableItem('joint', function(source)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('armor:slow', source)
    xPlayer.removeInventoryItem('joint', 1)
end)

RegisterServerEvent('kcdd_weed:test')
AddEventHandler('kcdd_weed:test', function()
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local luck = math.random(1,100)
    if xPlayer ~= nil then
        if xPlayer.canCarryItem('wet', 5) then
            xPlayer.addInventoryItem('wet', 5) 
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = 'Daha fazlasını taşıyamazsın!'})
        end
        if luck > 90 then
            xPlayer.addInventoryItem('highgrademaleseed', 1)
            TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'success', text = 'Erkek tohum buldun!'})
        end
        if luck > 10 then
            xPlayer.addInventoryItem('highgradefemaleseed', 1)
            TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'success', text = 'Dişi tohum buldun!'})
        end
    end
end)

RegisterNetEvent("kcdd:ufala")
AddEventHandler("kcdd:ufala", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    if xPlayer ~= nil then
        if xPlayer.canCarryItem('weedbod', 10) then
            if xPlayer.getInventoryItem('wet').count > 4 then
                xPlayer.removeInventoryItem('wet', 5)
				xPlayer.addInventoryItem('weedbod', 10)
            elseif  xPlayer.getInventoryItem('wet').count < 4 then
                TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = 'Üzerinde yeterli eşya yok!'})
            end
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = 'Daha fazlasını taşıyamazsın!'})
        end
    end
end)

RegisterNetEvent("kcdd:kurut")
AddEventHandler("kcdd:kurut", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    if xPlayer ~= nil then
        if xPlayer.canCarryItem('weedbud', 15) then
            if xPlayer.getInventoryItem('weedbod').count > 9 then
                xPlayer.removeInventoryItem('weedbod', 10)
				xPlayer.addInventoryItem('weedbud', 15)
            elseif xPlayer.getInventoryItem('weedbod').count < 9 then
                TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = 'Üzerinde yeterli eşya yok!'})
            end
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = 'Daha fazlasını taşıyamazsın!'})
        end
    end
end)

RegisterNetEvent("kcdd_weed:sar")
AddEventHandler("kcdd_weed:sar", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    if xPlayer ~= nil then
        if xPlayer.canCarryItem('joint', 3) then
            if xPlayer.getInventoryItem('rollingpaper').count > 2 then        
                if xPlayer.getInventoryItem('weedbud').count > 14 then
                    xPlayer.removeInventoryItem('weedbud', 15)
                    xPlayer.removeInventoryItem('rollingpaper', 3)
			        xPlayer.addInventoryItem('joint', 3)
                else
                    TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = 'Üzerinde yeterli kurutulmuş ot yok!'})
                end
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = 'Üzerinde yeterli sarma kağıdı yok!'})
            end
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = 'Bu işlem için fazla ağır eşyalar taşıyorsun!'})
        end
    end
end)
