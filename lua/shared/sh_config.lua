SimpleBanking = SimpleBanking or {} 
SimpleBanking.Config = SimpleBanking.Config or {}


SimpleBanking.Config["Days_Transaction_History"] = 5 -- How many days should the transaction history go back in the bank?

SimpleBanking.Config["business_ranks_overrides"] = { -- Grade names must be lower case!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    ["mechanic"] = { 
    ["RANK-NAME"] = true,
        ["RANK-NAME"] = true,
        ["RANK-NAME"] = true,
    },
    ['burgershot'] = {
        ["RANK-NAME"] = true,
        ["RANK-NAME"] = true,
    }
}

SimpleBanking.Config["gang_ranks_overrides"] = {
    ['lostmc'] = {
        ["RANK-NAME"] = true,
        ["RANK-NAME"] = true,
    }
}