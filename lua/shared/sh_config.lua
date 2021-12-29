SimpleBanking = SimpleBanking or {} 
SimpleBanking.Config = SimpleBanking.Config or {}


SimpleBanking.Config["Days_Transaction_History"] = 5 -- How many days should the transaction history go back in the bank?

SimpleBanking.Config["business_ranks_overrides"] = {
    ["mechanic"] = { -- If you want a certain company to use custom job ranks, add them like below. otherwise, it defaults back to business_ranks
        ["owner"] = true,
        ["coowner"] = true,
        ["manager"] = true,
    },
    ['burgershot'] = {
        ['kuhar'] = true,
        ['zamjenik šefa'] = true,
    }
}

SimpleBanking.Config["gang_ranks_overrides"] = {
}