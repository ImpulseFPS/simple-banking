SimpleBanking = SimpleBanking or {} 
SimpleBanking.Config = SimpleBanking.Config or {}


SimpleBanking.Config["Days_Transaction_History"] = 5 -- How many days should the transaction history go back in the bank?

SimpleBanking.Config["business_ranks"] = {
    ['šef'] = true,
    ['ravnatelj policije'] = true,
}

SimpleBanking.Config["gang_ranks"] = {
    ['šef'] = true,
}

SimpleBanking.Config["business_ranks_overrides"] = {
    ['police'] = {
        ['poručnik'] = true,
    },
    ['vlada'] = {
        ['predsjednik vlade'] = true,
        ['ministar'] = true,
    },
    ['ambulance'] = {
        ['posrednik'] = true,
    },
    ['cardealer'] = {
        ['financije'] = true,
    },
    ['realestate'] = {
        ['šef'] = true,
    },
}

SimpleBanking.Config["gang_ranks_overrides"] = {
}