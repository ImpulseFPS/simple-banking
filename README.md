# simple-banking used with QBCore Framework
# All credits for this go to https://github.com/Pawsative 

###### This is by no means a leak, I talked to the original developer of simple banking and we talked about me releasing this for everyone since he is re-coding the banking and he give me his permission to release it. So huge thanks to him.

###### This banking is NP 3.0 styled banking with business and gang accounts 

### Some parts of the code might be dodo because .lua files were done really quickly (it will get updated) for .js everyone is welcome to make a PR to improve it because I'm not really good with js so yea f me bruh lol

###### You do not need QB-moneysafe with this banking it has society coded in and only players with specific job/gang and grade can see the business and gang account

### Btw qb-target events are already in the cl_bank.lua for thoes who dont use qb-target sorry but you will have to make loops your self
![Alt text](https://i.imgur.com/IfT1XkE.png "In-game screenshot")


### Adding grades to the config, adding override grades to the config
```lua
SimpleBanking.Config["business_ranks"] = {  -- Here you add default grades for boss to get access to the account NOTE that grades need to be lower case.
    ["owner"] = true,
    ["coowner"] = true,
    ["chief"] = true,
    ["boss"] = true,
}
```
###### Same thing goes for gang accounts, You can add default grades under business_ranks and add override grades for example
```lua
SimpleBanking.Config["business_ranks_overrides"] = {
    ["lostmc"] = { -- this is example for adding more then one grade to access the account for gangs
        ["boss"] = true,
        ["shot caller"] = true,
    }
}

SimpleBanking.Config["business_ranks_overrides"] = {
    ["police"] = { -- example for adding more then one grade to access the account for job
        ["chief"] = true,
        ["lieutenant"] = true,
        ["sergeant"] = true,
    }
}

```

