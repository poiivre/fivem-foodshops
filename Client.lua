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
Fontaine, Cafe, VendingM, Stand		= {}, {}, {}, {}

NotifArgent		    = 'Vous n\'avez pas assez d\'argent'

Fontaine.Prix	    	= 5				
Fontaine.Taille    	= 1.0
Fontaine.Anim	    	= true					
Fontaine.Notif	    	= '~INPUT_CONTEXT~ Boire a la Fontaine ('..Fontaine.Prix..'$)'
Fontaine.Notif2	    	= 'Vous buvez a la Fontaine'
Fontaine.Hydrate    	= 130000					
Fontaine.Pos	   	= {	
	
		{ x = -444.052, 	y = 6011.117, 		z = 31.755 },
		{ x = -440.913, 	y = 6007.957, 		z = 24.731 },  
		{ x = -454.232, 	y = 6017.498, 		z = 24.731 }, 
		{ x = -446.053, 	y = 6004.103, 		z = 36.806 }, 
		{ x = -411.687, 	y = 6066.688, 		z = 31.5 }, 
		{ x = -381.374, 	y = 6037.424, 		z = 31.499 },
		{ x = -377.948, 	y = 6033.778, 		z = 31.533 },
		{ x = -323.473, 	y = 6229.165, 		z = 31.488 },
		{ x = -73.607 , 	y = 6249.405, 		z = 31.089 },
		{ x = -99.571 , 	y = 6194.563, 		z = 31.025 },
		{ x = -144.491, 	y = 6153.275, 		z = 32.335 },
		{ x = -2194.687, 	y = 4289.276, 		z = 49.173 },
		{ x = 728.095, 		y = 2528.185, 		z = 73.505 },
		{ x = 2005.333, 	y = 3789.775, 		z = 32.18 },
		{ x = 1850.543, 	y = 3685.169, 		z = 34.267 },
		{ x = 1833.522, 	y = 3689.316, 		z = 34.27 },
		{ x = 1704.922, 	y = 3784.947, 		z = 34.766 },
		{ x = 2738.128, 	y = 3463.685, 		z = 55.671 },
		{ x = 3549.061, 	y = 3643.997, 		z = 28.121 },
		{ x = 3527.462, 	y = 3650.214, 		z = 27.521 },
		{ x = 904.713, 		y = -3204.056, 		z = -97.188 },
		{ x = 1121.302, 	y =-3193.57 , 		z =-40.394  },
		{ x = 1009.429, 	y = -3171.861, 		z = -38.908 },
		{ x = 269.505, 		y = -1354.704, 		z = 24.537 },
		{ x = 259.701, 		y = -1375.29, 		z = 39.534 },
		{ x = 242.475, 		y = -1360.672, 		z = 39.534 },
		{ x = 993.704,	 	y = -3096.024, 		z = -38.996 },
		{ x = 97.495, 		y = 6620.133, 		z = 32.88 },

}

Cafe.Prix	    	= 12				
Cafe.Taille 	    	= 1.0
Cafe.Anim	    	= true					
Cafe.Notif	    	= '~INPUT_CONTEXT~ Prendre un CafÃ© ('..Cafe.Prix..'$)'
Cafe.Notif2 	    	= 'Vous avez acheter un CafÃ© !'
Cafe.Item 	    	= 'coffee'					
Cafe.Pos		= {
	
		{ x = -431.409, 	y = 6004.541, 		z = 31.755 },
		{ x = -435.588, 	y = 6000.384, 		z = 24.731 }, 
		{ x = -678.936, 	y = 5774.431, 		z = 17.33 },
		{ x = -677.147, 	y = 5773.731, 		z = 17.33 },
		{ x = 1708.635, 	y = 3786.143, 		z =  34.766},
		{ x = 993.704, 		y = -3096.024, 		z = -38.996 },
            	{ x = 436.144, 		y = -985.824, 		z = 30.6896 },
            	{ x = -45.4649, 	y = -1754.41, 		z = 29.421 },
           	{ x = 24.5889, 		y = -1342.32, 		z = 29.497 },
            	{ x = -707.394, 	y = -910.114, 		z = 19.2156 },
            	{ x = 1162.87, 		y = -319.218, 		z = 69.2051 },
            	{ x = 373.872, 		y = 331.028, 		z = 103.566 },
            	{ x = 2552.47, 		y = 381.031, 		z = 108.623 },
            	{ x = -1823.67, 	y = 796.291, 		z = 138.126 },
            	{ x = 2673.91, 		y = 3281.77, 		z = 55.2411 },
            	{ x = 1957.64, 		y = 3744.29, 		z = 32.3438 },
            	{ x = 1701.97, 		y = 4921.81, 		z = 42.0637 },
            	{ x = 1730.06, 		y = 6419.63, 		z = 35.0372 }
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
					
		-- 90 Positions in the whole map ( +3 'Out of Order' at the end ) 
		-- 90 Positions sur toute la map ( +3 'Hors Service' à la fin ) 

        	{ x = -438.449,		y = 5997.979, 		z = 31.755	},
		{ x = 309.11, 		y = -585.77, 		z = 43.28	},
		{ x = -205.71, 		y = 6233.75, 		z = 29.66	},
		{ x = -438.28,		y = 5998.15, 		z = 31.75	},
		{ x = -448.35, 		y = 6022.57, 		z = 24.73	},
		{ x = 258.19, 		y = 6326.98, 		z = 32.43	},
		{ x = 1834.13, 		y = 3673.18, 		z = 34.27	},
		{ x = 1047.71, 		y = 2662.72, 		z = 39.55	},
		{ x = 2743.30, 		y = 3468.25, 		z = 55.67	},
		{ x = -98.343 , 	y = 6196.504, 		z = 31.021 	},
		{ x = 1999.682, 	y = 3777.806, 		z = 32.18 	},
		{ x = 898.185, 		y = -3198.922, 		z = -98.197 	},
		{ x = 260.733, 		y = -1376.61, 		z = 39.534 	},
		{ x = 815.25,		y = -2971.31, 		z = 6.02	},
		{ x = 816.54,		y = -2971.3,  		z = 6.02	},
		{ x = 822.28,		y = -2149.81, 		z = 29.62	},
		{ x = 2560.5,		y = 379.14,   		z = 108.62	},
		{ x = 2753.36,		y = 3478.39,  		z = 55.67	},
		{ x = 913.32,		y = 3643.77,  		z = 32.66	},
		{ x = 549.27,		y = 2674.8,  		z = 42.2	}, 
		{ x = 1193.22,		y = 2701.72,  		z = 38.16	},
		{ x = 1699.61,		y = 4791.38,  		z = 41.92	},
		{ x = 1587.63,		y = 6449.8,   		z = 25.32	},
		{ x = 1486.87,		y = 1134.89,  		z = 114.33	},
		{ x = 1084.94,		y = -775.7,   		z = 58.23	},
		{ x = 1084.94,		y = -775.7,   		z = 58.23	},
		{ x = 644.27,		y = 265.74,   		z = 103.22	},
		{ x = 284.45,		y = 80.8,		z = 94.36	},
		{ x = 282.74,		y = 66.0,		z = 94.37	},
		{ x = 438.94,		y = -602.58,  		z = 28.71	},
		{ x = 451.86,		y = -633.23,  		z = 28.53	},
		{ x = 449.85,		y = -656.47,  		z = 28.43	},
		{ x = 171.38,		y = -1724.55, 		z = 29.32	},
		{ x = -341.61,		y = -1481.16, 		z = 30.68	},
		{ x = 8.08,		y = -1110.07, 		z = 29.8	},
		{ x = -333.29,		y = -783.52,  		z = 33.96	},
		{ x = -328.2,		y = -737.6,		z = 38.78	},
		{ x = -333.33,		y = -783.12,  		z = 43.61	},
		{ x = -328.23,  	y = -737.49,  		z = 48.42	},
		{ x = -692.17,		y = -730.64,  		z = 29.35	},
		{ x = -692.29,		y = -730.62,  		z = 33.68	},
		{ x = -708.34,		y = -909.97,  		z = 19.22	},
		{ x = -1655.78,		y = -1097.21, 		z = 13.13	},
		{ x = -1695.84,		y = -1127.19, 		z = 13.15	},
		{ x = -1711.11,		y = -1133.33, 		z = 13.13	},
		{ x = -1475.27,		y = -671.98,  		z = 29.04	},
		{ x = -1269.97,		y = -1427.1,  		z = 4.35	},
		{ x = -1231.44,		y = -1448.38, 		z = 4.27	},
		{ x = -269.81,		y = -2022.76, 		z = 30.15	},
		{ x = -692.28,		y = -749.71, 		z = 25.05	},
		{ x = -694.39,		y = -763.44, 		z = 33.68	},
		{ x = 821.91,		y = -2988.64,  		z = 6.02	},
		{ x = 820.81,		y = -2988.68,  		z = 6.02	},
		{ x = 809.82,		y = -2150.0,   		z = 29.62	},
		{ x = 2560.57,		y = 380.13,    		z = 108.62	},
		{ x = 2558.81,		y = 2601.82,   		z = 38.09	},
		{ x = 2344.35,		y = 3127.13,   		z = 48.21	},
		{ x = 1702.89,		y = 4923.42,   		z = 42.06	},
		{ x = 1485.8,		y = 1134.97,   		z = 114.33	},
		{ x = 1160.96,		y = -319.77,   		z = 69.21	},
		{ x = 286.14,		y = 195.21,    		z = 104.37	},
		{ x = 309.33,		y = 186.95,    		z = 103.9	},
		{ x = 285.59,		y = 80.36,     		z = 94.36	},
		{ x = 281.68,		y = 66.38,     		z = 94.37	},
		{ x = 436.23,		y = -986.68,   		z = 30.69	},
		{ x = -59.84,		y = -1749.34,  		z = 29.32	},
		{ x = -46.78,		y = -1753.18,  		z = 29.42	},
		{ x = 19.83,		y = -1114.28,  		z = 29.8	},
		{ x = -325.56,		y = -738.59,   		z = 33.96	},
		{ x = -310.1,		y = -739.47,   		z = 33.96	},
		{ x = -334.82,		y = -785.04,   		z = 38.78	},
		{ x = -325.51,		y = -738.58,   		z = 43.6	},
		{ x = -334.9,		y = -784.87,   		z = 48.42	},
		{ x = -694.37,		y = -793.32,   		z = 33.68	},
		{ x = -709.31,		y = -910.05,   		z = 19.22	},
		{ x = -1654.96,		y = -1096.42,  		z = 13.12	},
		{ x = -1695.27,		y = -1126.33,  		z = 13.15	},
		{ x = -1710.02,		y = -1133.83,  		z = 13.14	},
		{ x = -1692.37,		y = -1087.75,  		z = 13.15	},
		{ x = -1063.66,		y = -244.41,   		z = 39.73	},
		{ x = -1824.94,		y = 794.77,    		z = 138.16	},
		{ x = -2550.63,		y = 2316.61,   		z = 33.22	},
		{ x = -1269.34,		y = -1427.98,  		z = 4.35	},
		{ x = -1251.39,		y = -1450.37,  		z = 4.35	},
		{ x = -1230.58,		y = -1447.75,  		z = 4.27	},
		{ x = -1170.79,		y = -1574.44,  		z = 4.66	},
		{ x = -1148.0,		y = -1601.07,  		z = 4.39	},
		{ x = -1140.06,		y = -1623.16,  		z = 4.41	},
		{ x = -1123.07,		y = -1643.82,  		z = 4.66	},
		{ x = -246.52,		y = -2002.96,  		z = 30.15	},
		{ x = -275.87,		y = -2041.86,  		z = 30.15	},

	      -- "Out of Order" Sign // Panneau "Hors Service"
	      --{ x = 1162.06,		y = -319.56,  		z = 69.21	},
	      --{ x = 1702.28,		y = 4922.53,  		z = 42.06	},
	      --{ x = -1824.25,		y = 795.41,   		z = 138.14	},

	}


Stand.Prix	    	= 12				
Stand.Taille 	    	= 3.0
Stand.Anim	    	= true					
Stand.Notif	    	= '~INPUT_CONTEXT~ Acheter un Jus de Fruit ('..Stand.Prix..'$)'
Stand.Notif2 	    	= 'Vous avez acheter un Jus de Fruit !'
Stand.Item 	    	= 'jusfruit'					
Stand.Pos		= {

		{ x = 1263.163, 	y = 3546.803, 		z = 35.147 },
		{ x = 2474.649, 	y = 4445.677, 		z = 35.402 },
		{ x = -2509.746, 	y = 3615.285, 		z = 13.719 },
		{ x = -1043.595, 	y = 5326.446, 		z = 44.585 },
		{ x = 1088.088, 	y = 6510.078, 		z = 21.066 },
		{ x = -458.857, 	y = 3862.934, 		z = 35.18 },
		{ x = -1380.389, 	y = 734.771, 		z = 182.973 },
		{ x = 148.951, 		y = 1669.586, 		z = 228.701 },
		{ x = 1476.711, 	y = 2723.416, 		z = 37.567 },
}


ProcheFontaine  = 0
ProcheCafe      = 0
ProcheDistrib   = 0
ProcheStand 	= 0

-------------------------
--- Declaration d'ESX ---
-------------------------

ESX = nil
Citizen.CreateThread(function()
print("-- Script par Selene Desna : Fontaine à Eau, Machine à Café, Distributeurs et Stand de Fruits -- ")

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
		elseif ProcheStand ~= 0 then
			ESX.ShowHelpNotification(Stand.Notif)
			if IsControlJustReleased(0, 38) then	
				TriggerServerEvent('Selene_Stand', Stand.Item, Stand.Prix, Stand.Notif2 , NotifArgent)
				ProcheStand      = 0
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
	
		for i = 1, #Stand.Pos, 1 do
			local distance = GetDistanceBetweenCoords(Stand.Pos[i].x, Stand.Pos[i].y, Stand.Pos[i].z, Joueur['x'], Joueur['y'], Joueur['z'], true)
		
			if distance <= Stand.Taille then
				ProcheStand = i
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
		if ProcheStand ~= 0 then 
			local j = ProcheStand
			local distance = GetDistanceBetweenCoords(Stand.Pos[j].x, Stand.Pos[j].y, Stand.Pos[j].z, Joueur['x'], Joueur['y'], Joueur['z'], true)
			if distance <= Stand.Taille then else
				ProcheStand = 0
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
		--TaskPlayAnim(Joueur, 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 8.0, -8, -1, 1, 0, 0, 0, 0)
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

RegisterNetEvent('Selene_Stand:Animation')
AddEventHandler('Selene_Stand:Animation', function()

	if Stand.Anim then
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




