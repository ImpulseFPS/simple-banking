local notified = false
local lastNotified = 0

local banks = {
	{name="Bank", id=108, x=150.266, y=-1040.203, z=29.374},
	{name="Bank", id=108, x=-1212.980, y=-330.841, z=37.787},
	{name="Bank", id=108, x=-2962.582, y=482.627, z=15.703},
	{name="Bank", id=108, x=-112.202, y=6469.295, z=31.626},
	{name="Bank", id=108, x=314.187, y=-278.621, z=54.170},
	{name="Bank", id=108, x=-351.534, y=-49.529, z=49.042}, 
	{name="Bank", id=106, x=241.61, y=225.12, z=106.286},
	{name="Bank", id=108, x=1175.0643310547, y=2706.6435546875, z=38.094036102295}
}	

local bModels = {
    [-1126237515] = true,
    [506770882] = true,
    [-1364697528] = true,
    [-870868698] = true,
}

local function nearBank()
	local player = PlayerPedId()
	local playerloc = GetEntityCoords(player)
	
	for _, search in pairs(banks) do
		local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
		
		if distance <= 8 then
			return true
		end
	end

    return false
end

function nearATM()
	local ply = PlayerPedId()
	local pos = GetEntityCoords(ply, 0)
  
	for k,v in pairs(bModels) do
		ATMObject = GetClosestObjectOfType(pos, 0.6, k, false)
  
		if DoesEntityExist(ATMObject) then
			return true
		end
	end
	return false
end

RegisterNetEvent("qb-banking:client:ExtNotify")
AddEventHandler("qb-banking:client:ExtNotify", function(msg)
	if (not msg or msg == "") then return end

	QBCore.Functions.Notify(msg)
end)

--[[ Show Things ]]--
Citizen.CreateThread(function()
	for k,v in ipairs(banks) do
	  local blip = AddBlipForCoord(v.x, v.y, v.z)
	  SetBlipSprite(blip, v.id)
	  SetBlipDisplay(blip, 4)
	  SetBlipScale  (blip, 0.9)
	  SetBlipColour (blip, 2)
	  SetBlipAsShortRange(blip, true)
	  BeginTextCommandSetBlipName("STRING")
	  AddTextComponentString(tostring(v.name))
	  EndTextCommandSetBlipName(blip)
	end
end)

RegisterNetEvent('qb-banking:client:Bank:Options')
AddEventHandler('qb-banking:client:Bank:Options', function()
	exports['qb-menu']:SetTitle("Bank")
	exports['qb-menu']:AddButton("Open Bank" , "Access your bank account's" ,'qb-banking:client:bank:openUI')
    exports['qb-menu']:AddButton("PayCheck" , "Pick up your paycheck" ,'QBCore:server:Paycheck:pickup')
end)

RegisterNetEvent('qb-banking:client:bank:openUI')
AddEventHandler('qb-banking:client:bank:openUI', function() -- this one bank from target models
	if nearBank() and not bMenuOpen then
		TriggerEvent('animations:client:EmoteCommandStart', {"ATM"})

		QBCore.Functions.Progressbar("atm", "Bank", 4500, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {}, {}, {}, function() -- Done
			ToggleUI()
		end, function()
			QBCore.Functions.Notify('Canceld', 'warning')
			TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		end)
	end
end)

RegisterNetEvent('qb-banking:client:atm:openUI')
AddEventHandler('qb-banking:client:atm:openUI', function() -- this opens ATM
	if not bMenuOpen then
		TriggerEvent('animations:client:EmoteCommandStart', {"ATM"})

		QBCore.Functions.Progressbar("atm", "ATM", 4500, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {}, {}, {}, function() -- Done
			ToggleUI()
		end, function()
			QBCore.Functions.Notify('Canceld', 'warning')
			TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		end)
	end
end)