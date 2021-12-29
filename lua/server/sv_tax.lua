function CalculateTax(value, type)
    if not value then return end
    if not type then return end
    local data = GetTaxByType(type)
    local tax = (value / 100 * data)
    return tax
end

function GetTaxByType(type)
    if not type then return end
    local callback = exports["oxmysql"]:executeSync("SELECT * FROM city WHERE type = ?", {type})
    local data = callback[1].amount
    return data
end
