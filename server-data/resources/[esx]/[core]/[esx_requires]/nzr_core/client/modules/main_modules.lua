InitClientScripts = {}

function InitClientScripts.InitScripts(scriptList)
    for i, scriptName in ipairs(scriptList) do
        TriggerEvent("InitClientScript:" .. scriptName)
    end
end

InitClientScripts.InitScripts({"notify", "discord", "escape", "billing", "service", "society", "status", "login"})

RegisterNetEvent('nzr_core:restartModule')
AddEventHandler('nzr_core:restartModule', function(moduleName)
    InitClientScripts.InitScripts({moduleName})
end)