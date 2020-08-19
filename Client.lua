--[[ 
	Pour utiliser ce script vous      To use this script you will 
  devez avoir un item cafÃ© et       need to get a coffee item and 
  les trois items choisis pour      the three chosen items for the 
  les distributeur dans votre       vending machines. You will also
  BDD.	Vous devez aussi avoir      need the esx_status script to
	esx_status pour utiliser les      be able to change player's thirst
  fontaines Ã  eau.                  when using a drinking fountain
   
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

Fontaine.Prix	    	= 5				
Fontaine.Taille    	= 1.0
Fontaine.Anim	    	= true					
Fontaine.Notif	    	= '~INPUT_CONTEXT~ Boire a la Fontaine ('..Fontaine.Prix..'$)'
Fontaine.Notif2	    	= 'Vous buvez a la Fontaine'
Fontaine.Hydrate    	= 130000					
Fontaine.Pos	   	= {	
	
		{ x = -444.052, y = 6011.117, z = 31.755 },
		{ x = -440.913, y = 6007.957, z = 24.731 },  
		{ x = -454.232, y = 6017.498, z = 24.731 }, 
		{ x = -446.053, y = 6004.103, z = 36.806 }, 
		{ x = -411.687, y = 6066.688, z = 31.5 }, 
		{ x = -381.374, y = 6037.424, z = 31.499 },
		{ x = -377.948, y = 6033.778, z = 31.533 },
		{ x = -323.473, y = 6229.165, z = 31.488 },
		{ x = -73.607 , y = 6249.405, z = 31.089 },
		{ x = -99.571 , y = 6194.563, z = 31.025 },
		{ x = -144.491, y = 6153.275, z = 32.335 },
		{ x = -2194.687, y = 4289.276, z = 49.173 },
		{ x = 728.095, y = 2528.185, z = 73.505 },
		{ x = 2005.333, y = 3789.775, z = 32.18 },
		{ x = 1850.543, y = 3685.169, z = 34.267 },
		{ x = 1833.522, y = 3689.316, z = 34.27 },
		{ x = 1704.922, y = 3784.947, z = 34.766 },
		{ x = 2738.128, y = 3463.685, z = 55.671 },
		{ x = 3549.061, y = 3643.997, z = 28.121 },
		{ x = 3527.462, y = 3650.214, z = 27.521 },
		{ x = 904.713, y = -3204.056, z = -97.188 },
		{ x = 1121.302, y =-3193.57 , z =-40.394  },
		{ x = 1009.429, y = -3171.861, z = -38.908 },
		{ x = 269.505, y = -1354.704, z = 24.537 },
		{ x = 259.701, y = -1375.29, z = 39.534 },
		{ x = 242.475, y = -1360.672, z = 39.534 },
		{ x = 993.704, y = -3096.024, z = -38.996 },
		{ x = 97.495, y = 6620.133, z = 32.88 },

}

Cafe.Prix	    	= 12				
Cafe.Taille 	    	= 1.0
Cafe.Anim	    	= true					
Cafe.Notif	    	= '~INPUT_CONTEXT~ Prendre un CafÃ© ('..Cafe.Prix..'$)'
Cafe.Notif2 	    	= 'Vous avez acheter un CafÃ© !'
Cafe.Item 	    	= 'coffee'					
Cafe.Pos		= {
	
		{ x = -431.409, y = 6004.541, z = 31.755 },
		{ x = -435.588, y = 6000.384, z = 24.731 }, 
		{ x = -678.936, y = 5774.431, z = 17.33 },
		{ x = -677.147, y = 5773.731, z = 17.33 },
		{ x = 1708.635, y = 3786.143, z =  34.766},
		{ x = 993.704, y = -3096.024, z = -38.996 },
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
		
		{ x = -438.449,	y = 5997.979, 	z = 31.755},
		{ x = 309.11, 	y = -585.77, 	z = 43.28},
		{ x = 436.29, 	y = -986.59, 	z = 30.68},
		{ x = -205.71, 	y = 6233.75, 	z = 29.66},
		{ x = -438.28,	y = 5998.15, 	z = 31.75},
		{ x = -448.35, 	y = 6022.57, 	z = 24.73},
		{ x = 258.19, 	y = 6326.98, 	z = 32.43},
		{ x = 1699.62, 	y = 4791.43, 	z = 41.92},
		{ x = 1834.13, 	y = 3673.18, 	z = 34.27},
		{ x = 1193.33, 	y = 2701.75, 	z = 38.15},
		{ x = 1047.71, 	y = 2662.72, 	z = 39.55},
		{ x = 913.30, 	y = 3643.68, 	z = 32.66},
		{ x = 2743.30, 	y = 3468.25, 	z = 55.67},
		{ x = -2549.26,	y = 2316.65, 	z = 33.21},
		{ x = -98.343 , y = 6196.504, 	z = 31.021 },
		{ x = -549.054, y = 2674.808, 	z = 42.199 },
		{ x = 1999.682, y = 3777.806, z = 32.18 },
		{ x = 2560.457, y = 379.57, z = 108.621 },
		{ x = 1587.764, y = 6449.723, z = 25.317 },
		{ x = 2753.436, y = 3478.27, z = 55.672 },
		{ x = 2344.28, y = 3126.828, z = 48.208 },
		{ x = 898.185, y = -3198.922, z = -98.197 },
		{ x = 260.733, y = -1376.61, z = 39.534 },

}


ProcheFontaine  = 0
ProcheCafe      = 0
ProcheDistrib   = 0

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

		if ProcheFontaine ~= 0 then
			ESX.ShowHelpNotification(Fontaine.Notif)
			if IsControlJustReleased(0, 38) then	
				TriggerServerEvent('Selene_Fontaine', Fontaine.Hydrate, Fontaine.Prix, Fontaine.Notif2 , NotifArgent) 
				ProcheFontaine  = 0
			end
      
    		elseif ProcheCafe ~= 0 then
			ESX.ShowHelpNotification(Cafe.Notif)
			if IsControlJustReleased(0, 38) then	
				TriggerServerEvent('Selene_Cafe', Cafe.Item, Cafe.Prix, Cafe.Notif2 , NotifArgent)
				ProcheCafe      = 0
			end

    		elseif ProcheDistrib ~= 0 then
      			ESX.ShowHelpNotification(VendingM.Notif)
			if IsControlJustReleased(0, 189) and GetLastInputMethod(0) then	
				  TriggerServerEvent('Selene_VendingM', VendingM.Item1, VendingM.Prix, VendingM.Notif2 , NotifArgent)
				  ProcheDistrib   = 0

			elseif IsControlJustReleased(0, 187) and GetLastInputMethod(0) then	
				  TriggerServerEvent('Selene_VendingM', VendingM.Item2, VendingM.Prix, VendingM.Notif2 , NotifArgent)
				  ProcheDistrib   = 0

			elseif IsControlJustReleased(0, 190) and GetLastInputMethod(0) then	
				  TriggerServerEvent('Selene_VendingM', VendingM.Item3, VendingM.Prix, VendingM.Notif2 , NotifArgent)
				  ProcheDistrib   = 0

			end
      
		end
	end
end)



Citizen.CreateThread(function()
        while true do Citizen.Wait(500)

		local Joueur = GetEntityCoords(GetPlayerPed(-1), 0)
	
	------------------
	-- Dans la Zone --
	------------------
		
		for i = 1, #Fontaine.Pos, 1 do
			local distance = GetDistanceBetweenCoords(Fontaine.Pos[i].x, Fontaine.Pos[i].y, Fontaine.Pos[i].z, Joueur['x'], Joueur['y'], Joueur['z'], true)
		
			if distance <= Fontaine.Taille then
				ProcheFontaine = i
			end
		end
        
        	for i = 1, #Cafe.Pos, 1 do
			local distance = GetDistanceBetweenCoords(Cafe.Pos[i].x, Cafe.Pos[i].y, Cafe.Pos[i].z, Joueur['x'], Joueur['y'], Joueur['z'], true)
		
			if distance <= Cafe.Taille then
				ProcheCafe = i
			end
		end
	

		for i = 1, #VendingM.Pos, 1 do
			local distance = GetDistanceBetweenCoords(VendingM.Pos[i].x, VendingM.Pos[i].y, VendingM.Pos[i].z, Joueur['x'], Joueur['y'], Joueur['z'], true)
			if distance <= VendingM.Taille then
				ProcheDistrib = i
			end
		end

	----------------
	--- Hors Zone --
	----------------

		if ProcheDistrib ~= 0 then 
			local j = ProcheDistrib
			local distance = GetDistanceBetweenCoords(VendingM.Pos[j].x, VendingM.Pos[j].y, VendingM.Pos[j].z, Joueur['x'], Joueur['y'], Joueur['z'], true)
			if distance <= VendingM.Taille then else
				ProcheDistrib = 0
			end
		end
		if ProcheCafe ~= 0 then 
			local j = ProcheCafe
			local distance = GetDistanceBetweenCoords(Cafe.Pos[j].x, Cafe.Pos[j].y, Cafe.Pos[j].z, Joueur['x'], Joueur['y'], Joueur['z'], true)
			if distance <= Cafe.Taille then else
				ProcheCafe = 0
			end
		end
		if ProcheFontaine ~= 0 then 
			local j = ProcheFontaine
			local distance = GetDistanceBetweenCoords(Fontaine.Pos[j].x, Fontaine.Pos[j].y, Fontaine.Pos[j].z, Joueur['x'], Joueur['y'], Joueur['z'], true)
			if distance <= Fontaine.Taille then else
				ProcheFontaine = 0
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
			DisableControlAction(2,187,true)
			DisableControlAction(2,189,true)
			DisableControlAction(2,190,true)
			Temps = Temps - 1
		end
    ClearPedSecondaryTask(GetPlayerPed(-1))

end



