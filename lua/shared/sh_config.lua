SimpleBanking = SimpleBanking or {} 
SimpleBanking.Config = SimpleBanking.Config or {}


SimpleBanking.Config["Days_Transaction_History"] = 5 -- How many days should the transaction history go back in the bank?

SimpleBanking.Config["business_ranks"] = { -- what ranks can see the society accounts in the menu, and deposit/withdraw/transfer from them?
    ["owner"] = true,
    ["coowner"] = true, -- Add additionals like I have here, don't forget the comma. Job rank must be lowercase!
    ["chief"] = true,
    ["boss"] = true,
}


SimpleBanking.Config["business_ranks_overrides"] = {
    ["mechanic"] = { -- If you want a certain company to use custom job ranks, add them like below. otherwise, it defaults back to business_ranks
        ["owner"] = true,
        ["coowner"] = true,
        ["manager"] = true,
    }
}