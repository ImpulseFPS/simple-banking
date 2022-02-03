RegisterServerEvent('qb-banking:server:sendPaycheck')
AddEventHandler('qb-banking:server:sendPaycheck', function(pAmount, pSource)
    local src = pSource
    if not src then return end
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid
    if not citizenid then return end

    local tax = CalculateTax(pAmount, 'global')
    local total = math.ceil(pAmount - tax)

    local result = MySQL.Sync.fetchAll("SELECT paycheck FROM players WHERE citizenid = ?", {citizenid})
    local data = result[1]
    if data ~= nil then
        TriggerClientEvent("QBCore:Notify",src,"Paycheck of €"..total, 'primary')
        local setter = MySQL.Sync.fetchAll("UPDATE players SET paycheck = paycheck + @amount WHERE citizenid = @citizenid",{ ['citizenid'] = citizenid, ['amount'] = total})
    end

end)

RegisterServerEvent('qb-banking:server:Paycheck:pickup')
AddEventHandler('qb-banking:server:Paycheck:pickup', function()
    local src = source
    if not src then return end
    local player = QBCore.Functions.GetPlayer(src)
    if not player then return end
    local cid = player.PlayerData.citizenid
    if not cid then return end

    local result = MySQL.Sync.fetchAll("SELECT paycheck FROM players WHERE citizenid = ?", {cid})
    local data = result[1].paycheck
    print(data)
    if data ~= nil then
        local paycheck = tonumber(data)
        if (paycheck > 0) then
            player.Functions.AddMoney('bank', paycheck)
            local setter = MySQL.Sync.fetchAll("UPDATE players SET paycheck = ? WHERE citizenid = ?", {0, cid})
            AddTransaction(src, "personal", paycheck, "deposit", "N/A", (note ~= "" and note or "Plaća od €"..format_int(paycheck)))
            TriggerClientEvent("QBCore:Notify",src,"Plača od €"..paycheck.." je uplačena na tvoj račun.", "primary")
        else
            TriggerClientEvent('QBCore:Notify', src, 'Nema Plače', 'error')
        end
    end
end)