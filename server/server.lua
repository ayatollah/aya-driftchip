--local QBCore = exports['qb-core']:GetCoreObject()
local useDebug = Config.Debug

local function removeItem(item, src)
   local Player = Ox.GetPlayer(src)
   exports.ox_inventory:RemoveItem(src, item, 1, nil)
   TriggerClientEvent('inventory:client:ItemBox', src, exports.ox_inventory:Items()[item], "remove")
end

local function addItem(item, src)
   exports.ox_inventory:AddItem(src, item, 1)
   TriggerClientEvent('inventory:client:ItemBox', src, exports.ox_inventory:Items()[item], "add")
end

RegisterNetEvent('cw-driftchip:server:openbox', function()
   removeItem(Config.DriftChipBoxItem, source)
   addItem(Config.DriftChipItem, source)
end)

