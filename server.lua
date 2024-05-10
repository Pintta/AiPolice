if switcher.qbcore then
    local QBCore = exports['qb-core']:GetCoreObject()
    CreateThread(function()
        while true do
            local amount = 0
            local players = QBCore.Functions.GetQBPlayers()
            for _, Player in pairs(players) do
                for k, v in pairs(Config.PoliceJobs) do
                    if Player.PlayerData.job.name == Config.PoliceJobs[k].job then
                        if Config.PoliceJobs[k].dutyCheck then
                            if Player.PlayerData.job.onduty then
                                amount = amount + 1
                            end
                        else
                            amount = amount + 1
                        end
                    end
                end
            end
            TriggerClientEvent('phade-aipolice:refresh',-1,amount)
            Wait(1 * 60 * 1000) -- 1 minute
        end
    end)

    QBCore.Functions.CreateCallback('phade-aipolice:server:GetCops', function(source, cb)
        local amount = 0
        local players = QBCore.Functions.GetQBPlayers()
        for _, Player in pairs(players) do
            for k, v in pairs(Config.PoliceJobs) do
                if Player.PlayerData.job.name == Config.PoliceJobs[k].job then
                    if Config.PoliceJobs[k].dutyCheck then
                        if Player.PlayerData.job.onduty then
                            amount = amount + 1
                        end
                    else
                        amount = amount + 1
                    end
                end
            end
        end
        cb(amount)
    end)
else
    return
end

if switcher.esx then
    local ESX = exports['es_extended']:getSharedObject()
    CreateThread(function()
        while true do
            local amount = 0
            local system = ESX.Game.GetPlayers()
            for _, Player in pairs(system) do
                for k, v in pairs(Config.PoliceJobs) do
                    if Player.PlayerData.job.name == Config.PoliceJobs[k].job then
                        if Config.PoliceJobs[k].dutyCheck then
                            if Player.PlayerData.job.onduty then
                                amount = amount + 1
                            end
                        else
                            amount = amount + 1
                        end
                    end
                end
            end
            TriggerClientEvent('phade-aipolice:refresh',-1,amount)
            Wait((1000 * 60)* 1) -- 1 minute
        end
    end)

    ESX.RegisterServerCallback('phade-aipolice:server:GetCops', function(source, cb)
        local amount = 0
        local system = ESX.Game.GetPlayers()
        for _, Player in pairs(system) do
            for k, v in pairs(Config.PoliceJobs) do
                if ESX.PlayerData.job.name == Config.PoliceJobs[k].job then -- Maybe works or not?
                    if Config.PoliceJobs[k].dutyCheck then
                        if ESX.PlayerData.job.onduty then -- Maybe works or not?
                            amount = amount + 1
                        end
                    else
                        amount = amount + 1
                    end
                end
            end
        end
        cb(amount)
    end)
else
    return
end