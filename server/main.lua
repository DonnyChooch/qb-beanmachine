RegisterServerEvent("qb-beanmachine:bill:player")
AddEventHandler("qb-beanmachine:bill:player", function(playerId, amount)
        local biller = QBCore.Functions.GetPlayer(source)
        local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
        local amount = tonumber(amount)
        if biller.PlayerData.job.name == 'bean' then
            if billed ~= nil then
                if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                    if amount and amount > 0 then
                        exports.ghmattimysql:execute('INSERT INTO phone_invoices (citizenid, amount, society, sender, sendercitizenid) VALUES (@citizenid, @amount, @society, @sender, @sendercitizenid)', {
                            ['@citizenid'] = billed.PlayerData.citizenid,
                            ['@amount'] = amount,
                            ['@society'] = biller.PlayerData.job.name,
                            ['@sender'] = biller.PlayerData.charinfo.firstname,
                            ['@sendercitizenid'] = biller.PlayerData.citizenid
                        })
                        TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                        TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                        TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        end
end)


QBCore.Functions.CreateCallback('qb-beanmachine:server:get:ingredientCoffee', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local water = Ply.Functions.GetItemByName("water_bottle")
    local beans = Ply.Functions.GetItemByName("beans")
    if water ~= nil and beans ~= nil then
        if water.amount >= 2 and beans.amount >= 5 then 
            cb(true)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['water_bottle'], "remove")
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['beans'], "remove")
        else
            cb(false)
            TriggerClientEvent('QBCore:Notify', source, "You don't have the right ingredients to make coffee", 'error')   
        end
    else
        TriggerClientEvent('QBCore:Notify', source, "You don't have the right ingredients to make coffee", 'error')   
    end
end)
