AddEventHandler('InitClientScript:escape', function()
    Citizen.CreateThread(function()
        while true do
            local nbPlayerTotal = NZR.GetCountPlayers()
            AddTextEntry('PM_SCR_MAP', '~p~Carte de Los Santos')
            AddTextEntry('PM_SCR_GAM', '~r~Prendre l\'avion')
            AddTextEntry('PM_SCR_INF', '~g~Logs')
            AddTextEntry('PM_SCR_SET', '~b~Configuration')
            AddTextEntry('PM_SCR_STA', '~p~Statistiques')
            AddTextEntry('PM_SCR_GAL', '~y~Galerie')
            AddTextEntry('PM_SCR_RPL', '~y~Éditeur ∑')
            AddTextEntry('PM_PANE_CFX', '~y~NzR')
            AddTextEntry('FE_THDR_GTAO', "~p~N~w~z~p~R ~m~| ~p~discord.gg/~w~xxxx ~m~| ~p~ID : ~w~".. GetPlayerServerId(PlayerId()) .." ~m~| ~p~".. nbPlayerTotal .. "~w~/~p~128 ~w~joueurs ~p~en ligne")
            AddTextEntry('PM_PANE_LEAVE', '~p~Se déconnecter de NzR');
            AddTextEntry('PM_PANE_QUIT', '~r~Quitter FiveM');
            Citizen.Wait(5000)
        end
    end)
end)