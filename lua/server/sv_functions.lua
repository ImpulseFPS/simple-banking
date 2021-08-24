RegisterNetEvent("qb-banking:server:AddToMoneyLog")
AddEventHandler("qb-banking:server:AddToMoneyLog", function(source, sAccount, iAmount, sType, sReceiver, sMessage, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local CitizenId = Player.PlayerData.citizenid

    local iTransactionID = math.random(1000, 100000)

    exports['ghmattimysql']:execute("INSERT INTO `transaction_history` (`citizenid`, `trans_id`, `account`, `amount`, `trans_type`, `receiver`, `message`) VALUES(@myID, @transid, @account, @amount, @type, @receiver, @message);", {
        ["@myID"] = CitizenId,
        ["@transid"] = iTransactionID,
        ["@account"] = sAccount,
        ["@amount"] = iAmount,
        ["@type"] = sType,
        ["@receiver"] = sReceiver,
        ["@message"] = sMessage
    }, function()
        RefreshTransactions(source)
    end)
end)

function RefreshTransactions(source)
    local src = source
    if not src then return end

    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then return end

    local CitizenId = Player.PlayerData.citizenid

    exports['ghmattimysql']:execute("SELECT * FROM `transaction_history` WHERE `citizenid` = @myID AND DATE(date) > (NOW() - INTERVAL "..SimpleBanking.Config["Days_Transaction_History"].." DAY) ORDER BY `id` ASC;",
    {
        ["@myID"] = CitizenId
    }, function(data)
        if (not data) then return end

        TriggerClientEvent("qb-banking:client:UpdateTransactions", source, data)
    end)
end