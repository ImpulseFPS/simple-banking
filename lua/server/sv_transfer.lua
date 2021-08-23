RegisterServerEvent('qb-banking:server:Transfer')
AddEventHandler('qb-banking:server:Transfer', function(target, account, amount, note, fSteamID)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    target = target ~= nil and tonumber(target) or nil
    if not target or target <= 0 or target == source then
        return
    end

    target = tonumber(target)
    amount = tonumber(amount)
    local targetPly = QBCore.Functions.GetPlayer(target)

    if not targetPly or targetPly == -1 then
        return
    end

    if (target == source) then
        return
    end

    if (not amount or amount <= 0) then
        return
    end

    if (account == "personal") then
        local balance = Player.PlayerData.money["bank"]--ply.getAccount("bank").money

        if amount > balance then
            return
        end

        Player.Functions.RemoveMoney('bank', amount)
        targetPly.Functions.AddMoney('bank', math.floor(amount))

        TriggerClientEvent("qb-banking:client:Notify", src, "info", "You have transfered $" .. format_int(amount) .. " to " .. targetPly.PlayerData.charinfo.firstname .. "'s account")
        TriggerEvent("qb-banking:server:AddToMoneyLog", src, "personal", -amount, "transfer", targetPly.PlayerData.charinfo.firstname, "Transfered $" .. format_int(amount) .. " to " .. targetPly.getName())
        TriggerEvent("qb-banking:server:AddToMoneyLog", target.PlayerData.source, "personal", amount, "transfer", Player.PlayerData.charinfo.firstname, "Received $" .. format_int(amount) .. " from " ..Player.PlayerData.charinfo.firstname)
    end

    if (account == "business") then
        local job = Player.PlayerData.job

        if (not SimpleBanking.Config["business_ranks"][string.lower(job.grade.name)] and not SimpleBanking.Config["business_ranks_overrides"][string.lower(job.name)]) then
            return
        end

        local low = string.lower(job.name)
        local grade = string.lower(job.grade.name)

        if (SimpleBanking.Config["business_ranks_overrides"][low] and not SimpleBanking.Config["business_ranks_overrides"][low][grade]) then
            return
        end

        local result = exports['ghmattimysql']:executeSync('SELECT * FROM society WHERE name=@name', {['@name'] = job.name})
        local data = result[1]
        if data then
            local society = data.name

            TriggerEvent('qb-banking:society:server:WithdrawMoney', src, amount, society)
            Wait(50)
            targetPly.Functions.AddMoney('cash', amount)
            TriggerClientEvent("qb-banking:client:Notify", src, "info", "You have transfered $" .. format_int(amount) .. " from " .. job.label .. "'s account")
            TriggerEvent("qb-banking:server:AddToMoneyLog", src, "personal", -amount, "transfer", targetPly.PlayerData.charinfo.firstname, "Transfered $" .. format_int(amount) .. " to " .. targetPly.PlayerData.charinfo.firstname .. " from " .. job.label .. "'s account")
        end
    end

    if (account == "organization") then
        local gang = Player.PlayerData.gang

        if (not SimpleBanking.Config["business_ranks"][string.lower(gang.grade.name)] and not SimpleBanking.Config["business_ranks_overrides"][string.lower(gang.name)]) then
            return
        end

        local low = string.lower(gang.name)
        local grade = string.lower(gang.grade.name)

        if (SimpleBanking.Config["business_ranks_overrides"][low] and not SimpleBanking.Config["business_ranks_overrides"][low][grade]) then
            return
        end

        local result = exports['ghmattimysql']:executeSync('SELECT * FROM society WHERE name=@name', {['@name'] = gang.name})
        local data = result[1]
        if data then
            local society = data.name

            TriggerEvent('qb-banking:society:server:WithdrawMoney', src, amount, society)
            Wait(50)
            targetPly.Functions.AddMoney('cash', amount)
            TriggerClientEvent("qb-banking:client:Notify", src, "info", "You have transfered $" .. format_int(amount) .. " from " .. gang.label .. "'s account")
            TriggerEvent("qb-banking:server:AddToMoneyLog", src, "personal", -amount, "transfer", targetPly.PlayerData.charinfo.firstname, "Transfered $" .. format_int(amount) .. " to " .. targetPly.PlayerData.charinfo.firstname .. " from " .. gang.label .. "'s account")
        end
    end
end)
