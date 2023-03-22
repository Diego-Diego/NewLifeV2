ESX.RegisterCommand('modules', 'admin', function(xPlayer, args, showError)
    if args.modules then
        TriggerClientEvent('nzr_core:restartModule', -1, args.modules)
        print("Le module : "..args.modules.." à été redémarré")
    else
        print('Utilisation : /modules [nom du module]')
    end
end, false, {help = TranslateCap('command_modules'), validate = false, arguments = {
	{name = 'modules', validate = false, help = TranslateCap('command_modules'), type = 'string'}
}})