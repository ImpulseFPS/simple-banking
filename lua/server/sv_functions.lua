function AddTransaction(source, sAccount, iAmount, sType, sReceiver, sMessage, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local CitizenId = Player.PlayerData.citizenid

    local iTransactionID = math.random(1000, 100000)

    exports["oxmysql"]:insert("INSERT INTO `transaction_history` (`citizenid`, `trans_id`, `account`, `amount`, `trans_type`, `receiver`, `message`) VALUES(?, ?, ?, ?, ?, ?, ?)", {
        CitizenId,
        iTransactionID,
        sAccount,
        iAmount,
        sType,
        sReceiver,
        sMessage
    }, function()
        RefreshTransactions(src)
    end)
end

function RefreshTransactions(source)
    local src = source
    if not src then return end

    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then return end

    local result = exports["oxmysql"]:executeSync("SELECT * FROM transaction_history WHERE citizenid =  ? AND DATE(date) > (NOW() - INTERVAL "..SimpleBanking.Config["Days_Transaction_History"].." DAY)", {Player.PlayerData.citizenid})

    if result ~= nil then
        TriggerClientEvent("qb-banking:client:UpdateTransactions", src, result)
    end
end