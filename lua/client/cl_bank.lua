local notified = false
local lastNotified = 0

local banks = {
	{name="Bank", id=108, x=150.266, y=-1040.203, z=29.374},
	{name="Bank", id=108, x=-1212.980, y=-330.841, z=37.787},
	{name="Bank", id=108, x=-2962.582, y=482.627, z=15.703},
	{name="Bank", id=108, x=-112.202, y=6469.295, z=31.626},
	{name="Bank", id=108, x=314.187, y=-278.621, z=54.170},
	{name="Bank", id=108, x=-351.534, y=-49.529, z=49.042}, 
	{name="Bank", id=106, x=241.610, y=225.120, z=106.286},
	{name="Bank", id=108, x=1175.064, y=2706.643, z=38.094}
}	


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
	  SetBlipScale  (blip, 0.7)
	  SetBlipColour (blip, 2)
	  SetBlipAsShortRange(blip, true)
	  BeginTextCommandSetBlipName("STRING")
	  AddTextComponentString(tostring(v.name))
	  EndTextCommandSetBlipName(blip)
	end
end)


RegisterNetEvent('qb-banking:client:bank:openUI')
AddEventHandler('qb-banking:client:bank:openUI', function() -- this one bank from target models
	if not bMenuOpen then
		TriggerEvent('animations:client:EmoteCommandStart', {"ATM"})

		QBCore.Functions.Progressbar("atm", "Opening Bank", 4500, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {}, {}, {}, function() -- Done
			ToggleUI()
		end, function()
			QBCore.Functions.Notify('Canceled', 'warning')
			TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		end)
	end
end)
RegisterNetEvent('qb-banking:client:atm:openUI')
AddEventHandler('qb-banking:client:atm:openUI', function() -- this opens ATM
	if not bMenuOpen then
		TriggerEvent('animations:client:EmoteCommandStart', {"ATM"})

		QBCore.Functions.Progressbar("atm", "Opening ATM", 4500, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {}, {}, {}, function() -- Done
			ToggleUI()
		end, function()
			QBCore.Functions.Notify('Canceled', 'warning')
			TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		end)
	end
end)

exports['qb-target']:AddTargetModel(506770882,  {
    options = {
        {
            type = "client",
            event = "qb-banking:client:atm:openUI",
            icon = "fas fa-money-check",
            label = "Access ATM",
        },
    },
    distance = 1.5
})
exports['qb-target']:AddTargetModel(-870868698,  {
    options = {
        {
            type = "client",
            event = "qb-banking:client:atm:openUI",
            icon = "fas fa-money-check",
            label = "Access ATM",
        },
    },
    distance = 1.5
})
exports['qb-target']:AddTargetModel(-1126237515,  {
    options = {
        {
            type = "client",
            event = "qb-banking:client:atm:openUI",
            icon = "fas fa-money-check",
            label = "Access ATM",
        },
    },
    distance = 1.5
})
exports['qb-target']:AddTargetModel(-1364697528,  {
    options = {
        {
            type = "client",
            event = "qb-banking:client:atm:openUI",
            icon = "fas fa-money-check",
            label = "Access ATM",
        },
    },
    distance = 1.5
})

exports['qb-target']:AddBoxZone("Bank1", vector3(149.07, -1041.16, 29.54), 1.5, 4.5, {
	name = "Bank1",
	heading = 160,
	debugPoly = true,
	minZ = 28,
	maxZ = 30.5,
	}, {
		options = {
			{
            	type = "client",
            	event = "qb-banking:client:bank:openUI",
				icon = "fas fa-sign-in-alt",
				label = "Sign In",
			},
		},
		distance = 2.5
})

exports['qb-target']:AddBoxZone("Bank2", vector3(-1212.98, -331.53, 38.24), 1.5, 4.5, {
	name = "Bank2",
	heading = 206,
	debugPoly = true,
	minZ = 37,
	maxZ = 39,
	}, {
		options = {
			{
            	type = "client",
            	event = "qb-banking:client:bank:openUI",
				icon = "fas fa-sign-in-alt",
				label = "Sign In",
			},
		},
		distance = 2.5
})

exports['qb-target']:AddBoxZone("Bank3", vector3(-2962.16, 482.17, 15.7), 1.5, 4.5, {
	name = "Bank3",
	heading = 269,
	debugPoly = true,
	minZ = 15,
	maxZ = 18,
	}, {
		options = {
			{
            	type = "client",
            	event = "qb-banking:client:bank:openUI",
				icon = "fas fa-sign-in-alt",
				label = "Sign In",
			},
		},
		distance = 2.5
})

exports['qb-target']:AddBoxZone("Bank4", vector3(-112.29, 6469.38, 31.63), 1.5, 4.5, {
	name = "Bank4",
	heading = 316,
	debugPoly = true,
	minZ = 31,
	maxZ = 33,
	}, {
		options = {
			{
            	type = "client",
            	event = "qb-banking:client:bank:openUI",
				icon = "fas fa-sign-in-alt",
				label = "Sign In",
			},
		},
		distance = 2.5
})

exports['qb-target']:AddBoxZone("Bank5", vector3(313.56, -279.7, 54.8), 1.5, 4.5, {
	name = "Bank5",
	heading = 160,
	debugPoly = true,
	minZ = 53,
	maxZ = 55,
	}, {
		options = {
			{
            	type = "client",
            	event = "qb-banking:client:bank:openUI",
				icon = "fas fa-sign-in-alt",
				label = "Sign In",
			},
		},
		distance = 2.5
})

exports['qb-target']:AddBoxZone("Bank6", vector3(-351.51, -49.8, 49.04), 1.5, 4.5, {
	name = "Bank6",
	heading = 160,
	debugPoly = true,
	minZ = 49,
	maxZ = 50,
	}, {
		options = {
			{
            	type = "client",
            	event = "qb-banking:client:bank:openUI",
				icon = "fas fa-sign-in-alt",
				label = "Sign In",
			},
		},
		distance = 2.5
})

exports['qb-target']:AddBoxZone("Bank7", vector3(1175.92, 2707.86, 38.09), 1.5, 4.5, {
	name = "Bank7",
	heading = 359.73,
	debugPoly = true,
	minZ = 37,
	maxZ = 39,
	}, {
		options = {
			{
            	type = "client",
            	event = "qb-banking:client:bank:openUI",
				icon = "fas fa-sign-in-alt",
				label = "Sign In",
			},
		},
		distance = 2.5
})

exports['qb-target']:AddBoxZone("BigBank", vector3(242.41, 225.03, 106.29), 1.5, 4.5, {
	name = "BigBank",
	heading = 342.44,
	debugPoly = true,
	minZ = 105,
	maxZ = 108,
	}, {
		options = {
			{
            	type = "client",
            	event = "qb-banking:client:bank:openUI",
				icon = "fas fa-sign-in-alt",
				label = "Sign In",
			},
		},
		distance = 2.5
})
