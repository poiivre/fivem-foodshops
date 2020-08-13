--[[ 
	Pour utiliser ce script vous      To use this script you will 
  devez avoir un item café et       need to get a coffee item and 
  les trois items choisis pour      the three chosen items for the 
  les distributeur dans votre       vending machines. You will also
  BDD.	Vous devez aussi avoir      need the esx_status script to
	esx_status pour utiliser les      be able to change player's thirst
  fontaines à eau.                  when using a drinking fountain
   
	Si vous avez besoin d'aide  		  If you need help to modify
	afin de le lier a un autre			  it to be useable with another
	script contactez moi sur 			    script, you can contact me on
	GitHub : Selene-Desna				      GitHub : Selene-Desna
]]--

-----------------
--- Variables ---
-----------------
Fontaine, Cafe, VendingM		= {}, {}, {}

NotifArgent		    = 'Vous n\'avez pas assez d\'argent'

Fontaine.Prix	    = 10				
Fontaine.Taille     = 1.0
Fontaine.Anim	    = true					
Fontaine.Notif	    = '~INPUT_CONTEXT~ Boire a la Fontaine (10$)'
Fontaine.Notif2	    = 'Vous buvez a la Fontaine'
Fontaine.Hydrate    = 130000					
Fontaine.Pos	    = {		
		{ x = -444.052, y = 6011.117, z = 31.755 }, 
}

Cafe.Prix	        = 12				
Cafe.Taille 	    = 1.0
Cafe.Anim	        = true					
Cafe.Notif	        = '~INPUT_CONTEXT~ Prendre un CafÃ© (12$)'
Cafe.Notif2 	    = 'Vous avez acheter un CafÃ© !'
Cafe.Item 	        = 'coffee'					
Cafe.Pos		    = {	
		{ x = -431.409, y = 6004.541, z = 31.755 }, 
}

VendingM.Prix		= 10				
VendingM.Taille 	= 1.0
VendingM.Anim		= true					
VendingM.Notif		= '10$~n~~INPUT_FRONTEND_LEFT~ Sandwich~n~~INPUT_FRONTEND_DOWN~ Soda~n~~INPUT_FRONTEND_RIGHT~ Monster'
VendingM.Notif2		= 'Vous RÃ©cuperer votre Achat'
VendingM.Item1 		= 'bread'
VendingM.Item2 		= 'soda'
VendingM.Item3		= 'energy'			
VendingM.Pos		= {		
		{ x = -438.391, y = 5998.022, z = 31.755}, 
}


ProcheFontaine  = false
ProcheCafe      = false
ProcheDistrib   = false

-------------------------
--- Declaration d'ESX ---
-------------------------

ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)

---------------------
--- Script Client ---
---------------------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(25)

		if ProcheFontaine then
			ESX.ShowHelpNotification(Fontaine.Notif)
			if IsControlJustReleased(0, 38) then	
				TriggerServerEvent('Selene_Fontaine', Fontaine.Hydrate, Fontaine.Prix, Fontaine.Notif2 , NotifArgent)
			end
      
    elseif ProcheCafe then
			ESX.ShowHelpNotification(Cafe.Notif)
			if IsControlJustReleased(0, 38) then	
				TriggerServerEvent('Selene_Cafe', Cafe.Item, Cafe.Prix, Cafe.Notif2 , NotifArgent)
			end

    elseif ProcheDistrib then
      ESX.ShowHelpNotification(VendingM.Notif)
			if IsControlJustReleased(0, 189) and GetLastInputMethod(0) then	
				  TriggerServerEvent('Selene_VendingM', VendingM.Item1, VendingM.Prix, VendingM.Notif2 , NotifArgent)
			elseif IsControlJustReleased(0, 187) and GetLastInputMethod(0) then	
				  TriggerServerEvent('Selene_VendingM', VendingM.Item2, VendingM.Prix, VendingM.Notif2 , NotifArgent)
			elseif IsControlJustReleased(0, 190) and GetLastInputMethod(0) then	
				  TriggerServerEvent('Selene_VendingM', VendingM.Item3, VendingM.Prix, VendingM.Notif2 , NotifArgent)
			end
      
		end
	end
end)



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)

		local Joueur = GetEntityCoords(GetPlayerPed(-1), 0)
	
		for _, cherche in pairs(Fontaine.Pos) do
			local distance = GetDistanceBetweenCoords(cherche.x, cherche.y, cherche.z, Joueur['x'], Joueur['y'], Joueur['z'], true)
		
			if distance <= Fontaine.Taille then
				ProcheFontaine = true
			else 
				ProcheFontaine = false
				 
			end
		end
        
        for _, cherche in pairs(Cafe.Pos) do
			local distance = GetDistanceBetweenCoords(cherche.x, cherche.y, cherche.z, Joueur['x'], Joueur['y'], Joueur['z'], true)
		
			if distance <= Cafe.Taille then
				ProcheCafe = true
			else 
				ProcheCafe = false
				 
			end
		end

        for _, cherche in pairs(VendingM.Pos) do
			local distance = GetDistanceBetweenCoords(cherche.x, cherche.y, cherche.z, Joueur['x'], Joueur['y'], Joueur['z'], true)
		
			if distance <= VendingM.Taille then
				ProcheDistrib = true
			else 
				ProcheDistrib = false
				 
			end
		end


	end
end)



-----------------
--- Animation ---
-----------------

RegisterNetEvent('Selene_Fontaine:Animation')
AddEventHandler('Selene_Fontaine:Animation', function()

	if Fontaine.Anim then
		local Joueur = GetPlayerPed(-1)
		TaskPlayAnim(Joueur, 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 8.0, -8, -1, 49, 0, 0, 0, 0)
        AntiSpam(70)
	end
  
end)


RegisterNetEvent('Selene_Cafe:Animation')
AddEventHandler('Selene_Cafe:Animation', function()

	if Cafe.Anim then
		local Joueur = GetPlayerPed(-1)
		TaskPlayAnim(Joueur, 'amb@medic@standing@kneel@base', 'base', 3.0, 3.0, 2000, 0, 1, true, true, true)
        AntiSpam(50)
	end

end)

RegisterNetEvent('Selene_VendingM:Animation')
AddEventHandler('Selene_VendingM:Animation', function()

	if VendingM.Anim then
		local Joueur = GetPlayerPed(-1)
		TaskPlayAnim(Joueur, 'amb@medic@standing@kneel@base', 'base', 3.0, 3.0, 2000, 0, 1, true, true, true)
        AntiSpam(50)
	end

end)


-----------------
--- Anti Spam ---
-----------------

function AntiSpam(Variable)

local Temps = Variable
		while Temps >= 0 do
			Citizen.Wait(10)
			DisableControlAction(2,38,true)
			Temps = Temps - 1
		end
    ClearPedSecondaryTask(GetPlayerPed(-1))

end

