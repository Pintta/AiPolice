es_extended/client/common.lua 

```lua
AddEventHandler('esx:getSharedObject', function(cb)
	cb(ESX)
end)

function getSharedObject()
	return ESX
end
```

```lua
AddEventHandler('esx:getSharedObject', function(cb)
	cb(ESX)
end)

function getSharedObject()
	return ESX
end

exports('getSharedObject', function()
    return ESX
end)
```

es_extended/server/common.lua

Find this:

```lua
ESX                      = {}
ESX.Players              = {}
ESX.UsableItemsCallbacks = {}
ESX.Items                = {}
ESX.ServerCallbacks      = {}
ESX.TimeoutCount         = -1
ESX.CancelledTimeouts    = {}
ESX.LastPlayerData       = {}
ESX.Pickups              = {}
ESX.PickupId             = 0
ESX.Jobs                 = {}

AddEventHandler('esx:getSharedObject', function(cb)
	cb(ESX)
end)

function getSharedObject()
	return ESX
end
```

Replace this:

```lua

ESX                      = {}
ESX.Players              = {}
ESX.UsableItemsCallbacks = {}
ESX.Items                = {}
ESX.ServerCallbacks      = {}
ESX.TimeoutCount         = -1
ESX.CancelledTimeouts    = {}
ESX.LastPlayerData       = {}
ESX.Pickups              = {}
ESX.PickupId             = 0
ESX.Jobs                 = {}

AddEventHandler('esx:getSharedObject', function(cb)
	cb(ESX)
end)

function getSharedObject()
	return ESX
end

exports('getSharedObject', function()
    return ESX
end)
```

If you want you can added this for bankrobbery or carjacking progress.

```lua
exports['AiPolice']:ApplyWantedLevel(1) -- Wanted level 1
exports['AiPolice']:ApplyWantedLevel(2) -- Wanted level 2
exports['AiPolice']:ApplyWantedLevel(3) -- Wanted level 3
exports['AiPolice']:ApplyWantedLevel(4) -- Wanted level 4
exports['AiPolice']:ApplyWantedLevel(5) -- Wanted level 5
```