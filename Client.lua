--[[ 
	Pour utiliser ce script vous      	To use this script you will 
  	devez avoir un item cafÃ© et       	need to get a coffee item and 
  	les trois items choisis pour     	the three chosen items for the 
  	les distributeur dans votre       	vending machines. You will also
  	BDD.	Vous devez aussi avoir     	need the esx_status script to
	esx_status pour utiliser les      	be able to change player's thirst
  	fontaines Ã  eau.                  	when using a drinking fountain
   
	Si vous avez besoin d'aide  		If you need help to modify
	afin de le lier a un autre		it to be useable with another
	script contactez moi sur 		script, you can contact me on
	GitHub : Selene-Desna			GitHub : Selene-Desna
]]--

-----------------
--- Variables ---
-----------------
Fontaine, Cafe, VendingM, Stand, HotDog		= {}, {}, {}, {}, {}

UseBlips	= false
NotifArgent	= 'Vous n\'avez pas assez d\'argent'

Fontaine = { 
	Proche = false,
	Prix 	= 5,				
	Taille 	= 1.5,
	Anim 	= true,				
	Notif	= '~INPUT_CONTEXT~ Boire a la Fontaine ( $5 )',
	Hydrate = 130000	
}
Cafe = { 
	Proche = false,
	Prix 	= 12,				
	Taille 	= 1.5,
	Anim 	= true,				
	Notif	= '~INPUT_CONTEXT~ Prendre un CafÃ© ( $12 )',
	Item 	= 'coffee'	
}
Stand = { 
	Proche = false,
	Prix 	= 10,				
	Taille 	= 3.0,
	Anim 	= true,				
	Notif	= '~INPUT_CONTEXT~ Acheter un Jus de Fruit ( $12 )',
	Item 	= 'jusfruit'	
}
VendingM = { 
	Proche = false,
	Prix 	= 10,				
	Taille 	= 1.5,
	Anim 	= true,				
	Notif	= '10$~n~~INPUT_FRONTEND_LEFT~ Sandwich~n~~INPUT_FRONTEND_DOWN~ Soda~n~~INPUT_FRONTEND_RIGHT~ Monster',
	Item 	= 'bread',
	Item2 	= 'soda',
	Item3	= 'energy'	
}
FoodVan = { 
	Proche = false,
	Prix 	= 15,				
	Taille 	= 3.0,
	Anim 	= true,				
	Notif	= '15$~n~~INPUT_FRONTEND_LEFT~ Burger~n~~INPUT_FRONTEND_DOWN~ Soda~n~~INPUT_FRONTEND_RIGHT~ Hot Dog',
	Item 	= 'burger',
	Item2	= 'soda',
	Item3 	= 'hotdog',
}

Props = {
	{ prop = 'prop_burgerstand_01',		type = 'FoodVan' 	},
	{ prop = 'prop_hotdogstand_01', 	type = 'FoodVan' 	},
	{ prop = 'prop_food_van_01', 		type = 'FoodVan' 	},
	{ prop = 'prop_food_van_02', 		type = 'FoodVan' 	},

	{ prop = 'prop_vend_water_01', 		type = 'Fontaine' 	},
	{ prop = 'prop_watercooler', 		type = 'Fontaine' 	},
	
	{ prop = 'p_ld_coffee_vend_01', 	type = 'Cafe' 		},
	{ prop = 'p_ld_coffee_vend_s', 		type = 'Cafe' 		},
	{ prop = 'prop_vend_coffe_01', 		type = 'Cafe' 		},

	{ prop = 'prop_fruitstand_b', 		type = 'Stand' 		},
	{ prop = 'prop_fruitstand_01', 		type = 'Stand' 		},
	{ prop = 'prop_fruitstand_b_nite', 	type = 'Stand' 		},

	{ prop = 'prop_vend_fridge01', 		type = 'VendingM' 	},
	{ prop = 'prop_vend_snak_01', 		type = 'VendingM' 	},
	{ prop = 'prop_vend_snak_01_tu', 	type = 'VendingM' 	},
	{ prop = 'prop_vend_soda_01', 		type = 'VendingM' 	},
	{ prop = 'prop_vend_soda_02', 		type = 'VendingM' 	},
}
	
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
while true do Citizen.Wait(500)
	local coords = GetEntityCoords( PlayerPedId())
	for _, i in pairs(Props) do
	

	--------------------------
	-- Proche d'une props ? --
	--------------------------
            	jProps = GetClosestObjectOfType(coords, 2.0, GetHashKey(i.prop), false, false, false)
            	if DoesEntityExist(jProps) then 
			xProps = jProps
                	local distance = GetDistanceBetweenCoords(coords, GetEntityCoords(jProps), true)

			if 	i.type == 'FoodVan' 	then if distance <= FoodVan.Taille 	then FoodVan.Proche = true 	end end
			if 	i.type == 'VendingM' 	then if distance <= VendingM.Taille 	then VendingM.Proche = true 	end end
			if	i.type == 'Cafe' 	then if distance <= Cafe.Taille 	then Cafe.Proche = true 	end end
			if	i.type == 'Stand' 	then if distance <= Stand.Taille 	then Stand.Proche = true 	end end
			if	i.type == 'Fontaine' 	then if distance <= Fontaine.Taille 	then Fontaine.Proche = true 	end end

			if 	i.type == 'FoodVan' 	then if distance >= FoodVan.Taille 	then FoodVan.Proche = false	end end
			if 	i.type == 'VendingM' 	then if distance >= VendingM.Taille 	then VendingM.Proche = false 	end end
			if	i.type == 'Cafe' 	then if distance >= Cafe.Taille 	then Cafe.Proche = false 	end end 
			if	i.type == 'Stand' 	then if distance >= Stand.Taille 	then Stand.Proche = false 	end end
			if	i.type == 'Fontaine' 	then if distance >= Fontaine.Taille 	then Fontaine.Proche = false 	end end
		end
	end 
end
end)


	------------------------------------
	-- Si proche d'une props, options --
	------------------------------------
Citizen.CreateThread(function()
while true do Citizen.Wait(25)

		if VendingM.Proche == true then
      			ESX.ShowHelpNotification(VendingM.Notif)
			if IsControlJustReleased(0, 189) and GetLastInputMethod(0) then	
				SortirVoiture()
				TriggerServerEvent('Selene_VendingM', VendingM.Item1, VendingM.Prix, NotifArgent)
				VendingM.Proche = false

			elseif IsControlJustReleased(0, 187) and GetLastInputMethod(0) then
				SortirVoiture()	
			 	TriggerServerEvent('Selene_VendingM', VendingM.Item2, VendingM.Prix, NotifArgent)
				VendingM.Proche = false

			elseif IsControlJustReleased(0, 190) and GetLastInputMethod(0) then
				SortirVoiture()	
				TriggerServerEvent('Selene_VendingM', VendingM.Item3, VendingM.Prix, NotifArgent)
				VendingM.Proche = false
			end

      		elseif FoodVan.Proche == true then
      			ESX.ShowHelpNotification(FoodVan.Notif)
			if IsControlJustReleased(0, 189) and GetLastInputMethod(0) then	
				SortirVoiture()
				TriggerServerEvent('Selene_FoodVan', FoodVan.Item1, FoodVan.Prix, NotifArgent)
				VendingM.Proche = false

			elseif IsControlJustReleased(0, 187) and GetLastInputMethod(0) then
				SortirVoiture()	
			 	TriggerServerEvent('Selene_FoodVan', FoodVan.Item2, FoodVan.Prix, NotifArgent)
				FoodVan.Proche = false

			elseif IsControlJustReleased(0, 190) and GetLastInputMethod(0) then
				SortirVoiture()	
				TriggerServerEvent('Selene_FoodVan', FoodVan.Item3, FoodVan.Prix, NotifArgent)
				FoodVan.Proche = false
			end

    		elseif Cafe.Proche == true then
			ESX.ShowHelpNotification(Cafe.Notif)
			if IsControlJustReleased(0, 38) then	
				SortirVoiture()
				TriggerServerEvent('Selene_Cafe', Cafe.Item, Cafe.Prix, NotifArgent)
				Cafe.Proche = false
			end

    		elseif Fontaine.Proche == true then
			ESX.ShowHelpNotification(Fontaine.Notif)
			if IsControlJustReleased(0, 38) then
				SortirVoiture()	
				TriggerServerEvent('Selene_Fontaine', Fontaine.Hydrate, Fontaine.Prix, NotifArgent) 
				Fontaine.Proche = false
			end

		elseif Stand.Proche == true then
			ESX.ShowHelpNotification(Stand.Notif)
			if IsControlJustReleased(0, 38) then	
				SortirVoiture()
				TriggerServerEvent('Selene_Stand', Stand.Item, Stand.Prix, NotifArgent)
				Stand.Proche = false
			end

		end
end
end)

-----------------
--- Animation ---
-----------------

RegisterNetEvent('Selene_Fontaine:Animation')
AddEventHandler('Selene_Fontaine:Animation', function()
	if Fontaine.Anim then local Joueur = GetPlayerPed(-1)
	TaskPlayAnim(Joueur, 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 8.0, -8, -1, 49, 0, 0, 0, 0)
        AntiSpam(70) end
end)
RegisterNetEvent('Selene_Cafe:Animation')
AddEventHandler('Selene_Cafe:Animation', function()
	if Cafe.Anim then local Joueur = GetPlayerPed(-1)
	TaskPlayAnim(Joueur, 'amb@medic@standing@kneel@base', 'base', 3.0, 3.0, 2000, 0, 1, true, true, true)
        AntiSpam(50) end
end)
RegisterNetEvent('Selene_Stand:Animation')
AddEventHandler('Selene_Stand:Animation', function()
	if Stand.Anim then local Joueur = GetPlayerPed(-1)
	TaskPlayAnim(Joueur, 'amb@medic@standing@kneel@base', 'base', 3.0, 3.0, 2000, 0, 1, true, true, true)
        AntiSpam(60) end
end)
RegisterNetEvent('Selene_VendingM:Animation')
AddEventHandler('Selene_VendingM:Animation', function()
	if VendingM.Anim then local Joueur = GetPlayerPed(-1)
	TaskPlayAnim(Joueur, 'amb@medic@standing@kneel@base', 'base', 3.0, 3.0, 2000, 0, 1, true, true, true)
        AntiSpam(50) end
end)
RegisterNetEvent('Selene_Cafe:FoodVan')
AddEventHandler('Selene_Cafe:FoodVan', function()
	if Cafe.Anim then local Joueur = GetPlayerPed(-1)
	TaskPlayAnim(Joueur, 'amb@medic@standing@kneel@base', 'base', 3.0, 3.0, 2000, 0, 1, true, true, true)
        AntiSpam(50) end
end)


---------------
-- Fonctions --
---------------

function AntiSpam(Variable)
	local Temps = Variable
		while Temps >= 0 do
			Citizen.Wait(10)
			DisableControlAction(2,38,true)
			DisableControlAction(2,187,true)
			DisableControlAction(2,189,true)
			DisableControlAction(2,190,true)
			Temps = Temps - 1
		end
    	ClearPedSecondaryTask(GetPlayerPed(-1))
end


function AucunProche() 
	VendingM.Proche	= false 
	FoodVan.Proche	= false 
	Cafe.Proche	= false  
	Stand.Proche	= false 
	Fontaine.Proche	= false  
end

function SortirVoiture()
	
	local Joueur = GetPlayerPed(-1)
	if IsPedInAnyVehicle(Joueur, true) then
		local Vehicule = GetVehiclePedIsUsing(Joueur)
		TaskLeaveVehicle(Joueur, Vehicule)
		Citizen.Wait(2000)
	end

end
