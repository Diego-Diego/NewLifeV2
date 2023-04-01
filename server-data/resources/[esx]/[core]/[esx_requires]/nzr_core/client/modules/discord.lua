AddEventHandler('InitClientScript:discord', function()
    Citizen.CreateThread(function()
        while true do
            local PlayerName = GetPlayerName(PlayerId())
            local id = GetPlayerServerId(PlayerId())
            local nbPlayerTotal = NZR.GetCountPlayers()
            
            SetDiscordAppId(1080944786091028642)
            SetRichPresence(PlayerName.." ["..id.."]")
            SetRichPresence("["..id.."]" .. " - ".. nbPlayerTotal .. "/64")
            SetDiscordRichPresenceAsset('discord_logo')
            SetDiscordRichPresenceAssetText('NewLife')

            SetDiscordRichPresenceAction(0, ">> |🐌 Rejoindre 🐌| <<", "fivem://connect/YourIpHere")
            SetDiscordRichPresenceAction(1, ">> |🔗 Discord 🔗| <<", "https://discord.gg/xxxx")

            Citizen.Wait(60000)
        end
    end)
end)