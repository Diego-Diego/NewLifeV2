AddEventHandler('InitClientScript:escape', function()
    Citizen.CreateThread(function()
        while true do
            local nbPlayerTotal = NZR.GetCountPlayers()
            AddTextEntry('PM_SCR_MAP', '~r~Carte de Los Santos')
            AddTextEntry('PM_SCR_GAM', '~r~Prendre l\'avion')
            AddTextEntry('PM_SCR_INF', '~g~Logs')
            AddTextEntry('PM_SCR_SET', '~b~Configuration')
            AddTextEntry('PM_SCR_STA', '~r~Statistiques')
            AddTextEntry('PM_SCR_GAL', '~y~Galerie')
            AddTextEntry('PM_SCR_RPL', '~y~Éditeur ∑')
            AddTextEntry('PM_PANE_CFX', '~y~NzR')
            AddTextEntry('FE_THDR_GTAO', "~r~NewLife ~m~| ~r~discord.gg/~w~xxxx ~m~| ~r~ID : ~w~".. GetPlayerServerId(PlayerId()) .." ~m~| ~r~".. nbPlayerTotal .. "~w~/~r~128 ~w~joueurs ~r~en ligne")
            AddTextEntry('PM_PANE_LEAVE', '~r~Se déconnecter de NzR');
            AddTextEntry('PM_PANE_QUIT', '~p~Quitter FiveM');
            Citizen.Wait(5000)
        end
    end)
end)