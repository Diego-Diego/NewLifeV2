InitClientScripts = {}

function InitClientScripts.InitScripts(scriptList)
    for i, scriptName in ipairs(scriptList) do
        TriggerEvent("InitClientScript:" .. scriptName)
    end
end

InitClientScripts.InitScripts({"discord", "escape"})

RegisterNetEvent('nzr_core:restartModule')
AddEventHandler('nzr_core:restartModule', function(moduleName)
    InitClientScripts.InitScripts({moduleName})
end)