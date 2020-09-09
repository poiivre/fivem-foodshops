-------------------------
--- Declaration d'ESX ---
-------------------------

ESX  = nil TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

----------------------
--- Script Serveur ---
----------------------

RegisterServerEvent('Selene_Cafe')
AddEventHandler('Selene_Cafe', function( Item, Prix, Notif2, Notif3 )

	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getMoney() >= Prix then
		TriggerClientEvent('esx:showNotification', source, Notif2)							
		TriggerClientEvent('Selene_Cafe:Animation', source)
		xPlayer.addInventoryItem(Item, 1)
		xPlayer.removeMoney(Prix)						

	else 	TriggerClientEvent('esx:showNotification', source, Notif3)		
	end

end)

RegisterServerEvent('Selene_Stand')
AddEventHandler('Selene_Stand', function( Item, Prix, Notif2, Notif3 )

	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getMoney() >= Prix then
		TriggerClientEvent('esx:showNotification', source, Notif2)							
		TriggerClientEvent('Selene_Stand:Animation', source)
		xPlayer.addInventoryItem(Item, 1)
		xPlayer.removeMoney(Prix)						

	else 	TriggerClientEvent('esx:showNotification', source, Notif3)		
	end

end)



RegisterServerEvent('Selene_Fontaine')
AddEventHandler('Selene_Fontaine', function( Hydratation, Prix, Notif2, Notif3 )

	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getMoney() >= Prix then
		TriggerClientEvent('esx:showNotification', source, Notif2)							
		TriggerClientEvent('esx_status:add', source, 'thirst', Hydratation)
		TriggerClientEvent('Selene_Fontaine:Animation', source)
		xPlayer.removeMoney(Prix)						

	else 	TriggerClientEvent('esx:showNotification', source, Notif3)		
	end

end)


RegisterServerEvent('Selene_VendingM')
AddEventHandler('Selene_VendingM', function( Item, Prix, Notif2, Notif3 )

	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getMoney() >= Prix then
		TriggerClientEvent('esx:showNotification', source, Notif2)							
		TriggerClientEvent('Selene_VendingM:Animation', source)
		xPlayer.addInventoryItem(Item, 1)
		xPlayer.removeMoney(Prix)						

	else 	TriggerClientEvent('esx:showNotification', source, Notif3)		
	end

end)
