function format_int(n)
    if not n then return 0 end
    n = tonumber(n)
    if n >= 1e14 then return tostring(n) end
    if n <= -1e14 then return "-" .. tostring(math.abs(n)) end
    local negative = n < 0
    n = tostring(math.abs(n))
    local dp = string.find(n, "%.") or #n + 1

    for i = dp - 4, 1, -3 do
        n = n:sub(1, i) .. "," .. n:sub(i + 1)
    end

    -- Make sure the amount is padded with zeroes
    if n[#n - 1] == "." then
        n = n .. "0"
    end

    return (negative and "-" or "") .. n
end

function PlayerIdentifier(type, id)
    --[[
    local identifiers = {}
    local numIdentifiers = GetNumPlayerIdentifiers(id)

    for a = 0, numIdentifiers do
        table.insert(identifiers, GetPlayerIdentifier(id, a))
    end

    for b = 1, #identifiers do
        if string.find(identifiers[b], type, 1) then
            return identifiers[b]
        end
    end
    return false
    ]]--

    local identifiers = GetPlayerIdentifiers(id)
    for k,v in pairs(identifiers) do
        if (string.find(v, type)) then
            return identifiers[k]
        end
    end

    return false
end