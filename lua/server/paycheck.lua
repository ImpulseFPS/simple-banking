RegisterServerEvent('qb-banking:server:sendPaycheck')
AddEventHandler('qb-banking:server:sendPaycheck', function(pAmount, pSource)
    print('paycheck')
    local src = pSource
    if not src then return end
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid
    if not citizenid then return end

    local tax = QBCore.Functions.GlobalTax(pAmount)
    local total = math.ceil(pAmount - tax)

    local result = exports["oxmysql"]:executeSync("SELECT paycheck FROM players WHERE citizenid = ?", {citizenid})
    local data = result[1]
    if data ~= nil then
        TriggerClientEvent("QBCore:Notify",src,"Dobio si Plaća od €"..total.." (- 15% poreza)", 'primary')
        local setter = exports["oxmysql"]:executeSync("UPDATE players SET paycheck = paycheck + @amount WHERE citizenid = @citizenid",{ ['citizenid'] = citizenid, ['amount'] = total})
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

    local result = exports.oxmysql:executeSync("SELECT * FROM players WHERE citizenid = ?", {cid})
    local data = result[1]

    if data ~= nil then
        local paycheck = data.paycheck
        if paycheck > 0 then
            player.Functions.AddMoney('bank', paycheck)
            local setter = exports.oxmysql:executeSync("UPDATE players SET paycheck = ? WHERE citizenid = ?", {0, cid})
            TriggerEvent("qb-banking:server:AddToMoneyLog", src, "personal", paycheck, "deposit", "N/A", (note ~= "" and note or "Deposited paycheck of €"..format_int(paycheck).." to a bank account"))
            TriggerClientEvent("QBCore:Notify",src,"Paycheck of  €"..paycheck.." is deposited to your bank account.", "primary")
        else
            TriggerClientEvent('QBCore:Notify', src, 'There is no paycheck.', 'error')
        end
    end
end)