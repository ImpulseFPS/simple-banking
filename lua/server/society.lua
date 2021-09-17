function GetSociety(name)
    local result = exports["oxmysql"]:fetchSync('SELECT * FROM society WHERE name= ?', {name}) --exports['ghmattimysql']:execute("SELECT * FROM `society` WHERE `name` ='"..name.."' ")
    local data = result[1]

    return data
end


RegisterNetEvent('qb-banking:society:server:WithdrawMoney')
AddEventHandler('qb-banking:society:server:WithdrawMoney', function(pSource, a, n)
    local src = pSource
    if not src then return end

    local player = QBCore.Functions.GetPlayer(src)
    if not player then return end

    local s = GetSociety(n)
    local sMoney = tonumber(s.money)
    local amount = tonumber(a)
    local withdraw = sMoney - amount
    --exports["oxmysql"]:execute("UPDATE society SET money = '"..withdraw.."' WHERE name = '"..n.."'")
    exports["oxmysql"]:execute("UPDATE society SET money =  ? WHERE name = ?", {withdraw, n})
end)

RegisterServerEvent('qb-banking:society:server:DepositMoney')
AddEventHandler('qb-banking:society:server:DepositMoney', function(pSource, a, n)
    local src = pSource
    if not src then return end

    local player = QBCore.Functions.GetPlayer(src)
    if not player then return end

    local s = GetSociety(n)
    local sMoney = tonumber(s.money)
    local amount = tonumber(a)
    local deposit = sMoney + amount

    
    exports["oxmysql"]:execute("UPDATE society SET money =  ? WHERE name = ?", {deposit, n})
end)