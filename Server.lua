-------------------------
--- Declaration d'ESX ---
-------------------------

ESX  = nil TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

---------------------
--- Script Serveur ---
---------------------

RegisterServerEvent('Selene_Cafe')
AddEventHandler('Selene_Cafe', function( Item, Prix, Notif3 )

	local xPlayer = ESX.GetPlayerFromId(source)
	Notif2 = '~y~[ - $'..Prix..' ] ~g~[ + 1 '..ESX.GetItemLabel(Item)..' ]'
	if xPlayer.getMoney() >= Prix then
		TriggerClientEvent('esx:showAdvancedNotification', source, '[ Machines Ã  CafÃ© ]', Notif2, nil, 'CHAR_BIKESITE', 0)			
		TriggerClientEvent('Selene_Cafe:Animation', source)
		xPlayer.addInventoryItem(Item, 1)
		xPlayer.removeMoney(Prix)						
	else 	TriggerClientEvent('esx:showAdvancedNotification', source, '[ Machines Ã  CafÃ© ]', Notif3, nil, 'CHAR_BIKESITE', 0)
	end

end)

RegisterServerEvent('Selene_Stand')
AddEventHandler('Selene_Stand', function( Item, Prix, Notif3 )

	local xPlayer = ESX.GetPlayerFromId(source)
	Notif2 = '~y~[ - $'..Prix..' ] ~g~[ + 1 '..ESX.GetItemLabel(Item)..' ]'
	if xPlayer.getMoney() >= Prix then
		TriggerClientEvent('esx:showAdvancedNotification', source, '[ Stand de Fruit ]', Notif2, nil, 'CHAR_BIKESITE', 0)			
		TriggerClientEvent('Selene_Stand:Animation', source)
		xPlayer.addInventoryItem(Item, 1)
		xPlayer.removeMoney(Prix)						
	else 	TriggerClientEvent('esx:showAdvancedNotification', source, '[ Stand de Fruit ]', Notif3, nil, 'CHAR_BIKESITE', 0)
	end

end)



RegisterServerEvent('Selene_Fontaine')
AddEventHandler('Selene_Fontaine', function( Hydratation, Prix, Notif3 )

	local xPlayer = ESX.GetPlayerFromId(source)
	Notif2 = '~y~[ - $'..Prix..' ]'
	if xPlayer.getMoney() >= Prix then
		TriggerClientEvent('esx:showAdvancedNotification', source, '[ Fontaine ]', Notif2, nil, 'CHAR_BIKESITE', 0)				
		TriggerClientEvent('esx_status:add', source, 'thirst', Hydratation)
		TriggerClientEvent('Selene_Fontaine:Animation', source)
		xPlayer.removeMoney(Prix)						
	else 	TriggerClientEvent('esx:showAdvancedNotification', source, '[ Fontaine ]', Notif3, nil, 'CHAR_BIKESITE', 0)
	end

end)


RegisterServerEvent('Selene_VendingM')
AddEventHandler('Selene_VendingM', function( Item, Prix, Notif3 )

	local xPlayer = ESX.GetPlayerFromId(source)
	Notif2 = '~y~[ - $'..Prix..' ] ~g~[ + 1 '..ESX.GetItemLabel(Item)..' ]'
	if xPlayer.getMoney() >= Prix then
		TriggerClientEvent('esx:showAdvancedNotification', source, '[ Distributeur ]', Notif2, nil, 'CHAR_BIKESITE', 0)				
		TriggerClientEvent('Selene_VendingM:Animation', source)
		xPlayer.addInventoryItem(Item, 1)
		xPlayer.removeMoney(Prix)						
	else 	TriggerClientEvent('esx:showAdvancedNotification', source, '[ Distributeur ]', Notif3, nil, 'CHAR_BIKESITE', 0)

	end

end)

RegisterServerEvent('Selene_FoodVan')
AddEventHandler('Selene_FoodVan', function( Item, Prix, Notif3 )

	local xPlayer = ESX.GetPlayerFromId(source)
	Notif2 = '~y~[ - $'..Prix..' ] ~g~[ + 1 '..ESX.GetItemLabel(Item)..' ]'
	if xPlayer.getMoney() >= Prix then
		TriggerClientEvent('esx:showAdvancedNotification', source, '[ Roulotte ]', Notif2, nil, 'CHAR_BIKESITE', 0)				
		TriggerClientEvent('Selene_FoodVan:Animation', source)
		xPlayer.addInventoryItem(Item, 1)
		xPlayer.removeMoney(Prix)						
	else 	TriggerClientEvent('esx:showAdvancedNotification', source, '[ Roulotte ]', Notif3, nil, 'CHAR_BIKESITE', 0)

	end

end)

